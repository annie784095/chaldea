import 'package:chaldea/app/battle/models/battle.dart';
import 'package:chaldea/app/battle/models/command_card.dart';
import 'package:chaldea/app/battle/models/svt_entity.dart';
import 'package:chaldea/app/battle/utils/battle_utils.dart';
import 'package:chaldea/models/db.dart';
import 'package:chaldea/models/gamedata/gamedata.dart';
import 'package:chaldea/utils/utils.dart';

class Damage {
  Damage._();

  static final List<BuffAction> powerMods = [
    BuffAction.damage,
    BuffAction.damageIndividuality,
    BuffAction.damageIndividualityActiveonly,
    BuffAction.damageEventPoint
  ];

  static bool damage(
    final BattleData battleData,
    final DataVals dataVals,
    final Iterable<BattleServantData> targets,
    final int chainPos,
    final bool isTypeChain,
    final bool isMightyChain,
    final CardType firstCardType, {
    final bool isPierceDefense = false,
    final bool checkBuffTraits = false,
  }) {
    final functionRate = dataVals.Rate ?? 1000;
    if (functionRate < battleData.probabilityThreshold) {
      return false;
    }

    final activator = battleData.activator!;
    final currentCard = battleData.currentCard!;

    for (final target in targets) {
      battleData.setTarget(target);

      final classAdvantage = getClassRelation(battleData, activator, target, currentCard);

      final damageParameters = DamageParameters()
        ..attack = activator.attack + currentCard.cardStrengthen
        ..totalHits = Maths.sum(currentCard.cardDetail.hitsDistribution)
        ..damageRate = currentCard.isNP ? dataVals.Value! : 1000
        ..npSpecificAttackRate =
            dataVals.Target != null && target.checkTrait(NiceTrait(id: dataVals.Target!), checkBuff: checkBuffTraits)
                ? dataVals.Correction!
                : 1000
        ..attackerClass = activator.svtClass
        ..defenderClass = target.svtClass
        ..classAdvantage = classAdvantage
        ..attackerAttribute = activator.attribute
        ..defenderAttribute = target.attribute
        ..isNp = currentCard.isNP
        ..chainPos = chainPos
        ..currentCardType = currentCard.cardType
        ..firstCardType = firstCardType
        ..isTypeChain = isTypeChain
        ..isMightyChain = isMightyChain
        ..isCritical = currentCard.isCritical
        ..cardBuff = activator.getBuffValueOnAction(battleData, BuffAction.commandAtk, currentCard.commandCodeBuffs)
        ..attackBuff = activator.getBuffValueOnAction(battleData, BuffAction.atk, currentCard.commandCodeBuffs)
        ..specificAttackBuff = Maths.sum(powerMods.map((action) => activator.getBuffValueOnAction(battleData, action)))
        ..criticalDamageBuff = currentCard.isCritical
            ? activator.getBuffValueOnAction(battleData, BuffAction.criticalDamage, currentCard.commandCodeBuffs)
            : 0
        ..npDamageBuff = currentCard.isNP
            ? activator.getBuffValueOnAction(battleData, BuffAction.npdamage, currentCard.commandCodeBuffs)
            : 0
        ..percentAttackBuff =
            activator.getBuffValueOnAction(battleData, BuffAction.damageSpecial, currentCard.commandCodeBuffs)
        ..damageAdditionBuff =
            activator.getBuffValueOnAction(battleData, BuffAction.givenDamage, currentCard.commandCodeBuffs)
        ..fixedRandom = battleData.fixedRandom;

      final atkNpParameters = AttackNpGainParameters();
      final defNpParameters = DefendNpGainParameters();
      final starParameters = StarParameters();

      if (activator.isPlayer) {
        atkNpParameters
          ..attackerNpCharge = currentCard.npGain
          ..defenderNpRate = target.enemyTdRate
          ..isNp = currentCard.isNP
          ..chainPos = chainPos
          ..currentCardType = currentCard.cardType
          ..firstCardType = firstCardType
          ..isMightyChain = isMightyChain
          ..isCritical = currentCard.isCritical
          ..cardBuff = activator.getBuffValueOnAction(battleData, BuffAction.commandNpAtk, currentCard.commandCodeBuffs)
          ..npGainBuff = activator.getBuffValueOnAction(battleData, BuffAction.dropNp, currentCard.commandCodeBuffs);

        starParameters
          ..attackerStarGen = activator.starGen
          ..defenderStarRate = target.enemyStarRate
          ..isNp = currentCard.isNP
          ..chainPos = chainPos
          ..currentCardType = currentCard.cardType
          ..firstCardType = firstCardType
          ..isMightyChain = isMightyChain
          ..isCritical = currentCard.isCritical
          ..cardBuff =
              activator.getBuffValueOnAction(battleData, BuffAction.commandStarAtk, currentCard.commandCodeBuffs)
          ..starGenBuff =
              activator.getBuffValueOnAction(battleData, BuffAction.criticalPoint, currentCard.commandCodeBuffs);
      } else {
        defNpParameters
          ..defenderNpCharge = target.defenceNpGain
          ..attackerNpRate = activator.enemyTdAttackRate
          ..npGainBuff = target.getBuffValueOnAction(battleData, BuffAction.dropNp, currentCard.commandCodeBuffs)
          ..defenseNpGainBuff =
              target.getBuffValueOnAction(battleData, BuffAction.dropNpDamage, currentCard.commandCodeBuffs);
      }

      final hasPierceDefense =
          activator.hasBuffOnAction(battleData, BuffAction.pierceDefence, currentCard.commandCodeBuffs);
      final skipDamage = shouldSkipDamage(battleData, activator, target, currentCard);
      if (!skipDamage) {
        damageParameters
          ..cardResist = target.getBuffValueOnAction(battleData, BuffAction.commandDef)
          ..defenseBuff = isPierceDefense || hasPierceDefense
              ? target.getBuffValueOnAction(battleData, BuffAction.defencePierce)
              : target.getBuffValueOnAction(battleData, BuffAction.defence)
          ..specificDefenseBuff = target.getBuffValueOnAction(battleData, BuffAction.selfdamage)
          ..percentDefenseBuff = target.getBuffValueOnAction(battleData, BuffAction.specialdefence)
          ..damageReductionBuff = target.getBuffValueOnAction(battleData, BuffAction.receiveDamage);

        atkNpParameters.cardResist = target.getBuffValueOnAction(battleData, BuffAction.commandNpDef);

        starParameters
          ..cardResist = target.getBuffValueOnAction(battleData, BuffAction.commandStarDef)
          ..enemyStarGenResist = target.getBuffValueOnAction(battleData, BuffAction.criticalStarDamageTaken);
      }

      final totalDamage = calculateDamage(damageParameters);
      int remainingDamage = totalDamage;

      int overkillCount = 0;
      final List<int> hitDamages = [];
      final List<int> hitNpGains = [];
      final List<int> hitStars = [];
      for (int i = 0; i < currentCard.cardDetail.hitsDistribution.length; i += 1) {
        if (skipDamage) {
          hitDamages.add(0);
        } else {
          final hitsPercentage = currentCard.cardDetail.hitsDistribution[i];
          final int hitDamage;
          if (i < currentCard.cardDetail.hitsDistribution.length - 1) {
            hitDamage = totalDamage * hitsPercentage ~/ 100;
          } else {
            hitDamage = remainingDamage;
          }

          hitDamages.add(hitDamage);
          remainingDamage -= hitDamage;

          target.receiveDamage(hitDamage);
        }

        if (target.hp <= 0) {
          activator.activateBuffOnAction(battleData, BuffAction.functionDeadattack);
          target.killedBy = activator;
          target.killedByCard = currentCard;
        }

        final isOverkill = target.hp < 0 || (!currentCard.isNP && target.isBuggedOverkill);
        if (isOverkill) {
          overkillCount += 1;
        }

        if (activator.isPlayer) {
          atkNpParameters.isOverkill = isOverkill;
          starParameters.isOverkill = isOverkill;
          final hitNpGain = calculateAttackNpGain(atkNpParameters);
          final previousNP = activator.np;
          activator.changeNP(hitNpGain);
          hitNpGains.add(activator.np - previousNP);

          final hitStar = calculateStar(starParameters);
          hitStars.add(hitStar);
        }

        if (target.isPlayer) {
          defNpParameters.isOverkill = isOverkill;
          final hitNpGain = calculateDefendNpGain(defNpParameters);

          final previousNP = activator.np;
          target.changeNP(hitNpGain);
          hitNpGains.add(activator.np - previousNP);
        }
      }

      battleData.logger.debug(damageParameters.toString());
      if (activator.isPlayer) {
        battleData.logger.debug(atkNpParameters.toString());
        battleData.logger.debug(starParameters.toString());
        battleData.logger.action('${activator.lBattleName} activates ${currentCard.cardType.name.toUpperCase()} '
            '${currentCard.isNP ? 'NP' : ''} card, '
            'targeting ${target.lBattleName}, '
            'dealt $totalDamage damage, '
            'gained ${(Maths.sum(hitNpGains) / 100).toStringAsFixed(2)} % NP, '
            'gained ${(Maths.sum(hitStars) / 1000).toStringAsFixed(3)} stars, '
            'overkill: $overkillCount/${currentCard.cardDetail.hitsDistribution.length}');
        battleData.logger.debug('Detailed hits: Damage: $hitDamages, NP: $hitNpGains, Star: $hitStars');
      } else {
        battleData.logger.debug(defNpParameters.toString());
        battleData.logger.action('${activator.lBattleName} activates ${currentCard.cardType.name.toUpperCase()} '
            '${currentCard.isNP ? 'NP' : ''} card, '
            'targeting ${target.lBattleName}, '
            'dealt $totalDamage damage, '
            '${target.lBattleName} '
            'gained ${Maths.sum(hitNpGains)} NP, '
            'overkill: $overkillCount/${currentCard.cardDetail.hitsDistribution.length}');
        battleData.logger.debug('Detailed hits: Damage: $hitDamages, NP: $hitNpGains');
      }

      battleData.changeStar(toModifier(Maths.sum(hitStars)));

      target.removeBuffWithTrait(NiceTrait(id: Trait.buffSleep.id));

      target.addAccumulationDamage(totalDamage - remainingDamage);

      battleData.unsetTarget();
    }

    return true;
  }

  static bool shouldSkipDamage(
    final BattleData battleData,
    final BattleServantData activator,
    final BattleServantData target,
    final CommandCardData currentCard,
  ) {
    final hasSpecialInvincible = target.hasBuffOnAction(battleData, BuffAction.specialInvincible);
    final hasPierceInvincible =
        activator.hasBuffOnAction(battleData, BuffAction.pierceInvincible, currentCard.commandCodeBuffs);
    if (hasSpecialInvincible) {
      return true;
    }
    final hasInvincible = target.hasBuffOnAction(battleData, BuffAction.invincible);
    if (hasPierceInvincible) {
      return false;
    }
    final hasBreakAvoidance =
        activator.hasBuffOnAction(battleData, BuffAction.breakAvoidance, currentCard.commandCodeBuffs);
    if (hasInvincible) {
      return true;
    }
    final hasAvoidance = target.hasBuffOnAction(battleData, BuffAction.avoidance) ||
        target.hasBuffOnAction(battleData, BuffAction.avoidanceIndividuality);
    return !hasBreakAvoidance && hasAvoidance;
  }

  static int getClassRelation(
    final BattleData battleData,
    final BattleServantData activator,
    final BattleServantData target,
    final CommandCardData currentCard,
  ) {
    return ConstData.getClassRelation(activator.svtClass, target.svtClass);
  }
}
