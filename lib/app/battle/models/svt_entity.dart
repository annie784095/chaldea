import 'dart:math';

import 'package:chaldea/app/battle/functions/function_executor.dart';
import 'package:chaldea/app/battle/models/battle.dart';
import 'package:chaldea/app/battle/models/command_card.dart';
import 'package:chaldea/app/battle/models/craft_essence_entity.dart';
import 'package:chaldea/app/battle/utils/battle_utils.dart';
import 'package:chaldea/app/battle/utils/buff_utils.dart';
import 'package:chaldea/models/models.dart';

import 'buff.dart';
import 'card_dmg.dart';
import 'skill.dart';

class BattleServantData {
  static const npPityThreshold = 9900;
  static List<BuffType> gutsTypes = [BuffType.guts, BuffType.gutsRatio];

  QuestEnemy? niceEnemy;
  Servant? niceSvt;

  bool get isPlayer => niceSvt != null;

  bool get isEnemy => niceEnemy != null;

  String get name => isPlayer ? niceSvt!.battleName : niceEnemy!.lShownName;

  //
  int index = 0;
  int deckIndex = -1;
  int uniqueId = 0;
  int svtId = -1;
  int exceedCount = 0;
  int limitCount = 0;
  int transformSvtId = -1;
  int transformIndex = -1;
  int totalDamage = 0;
  Servant? svtData;
  int level = 0;
  int maxLevel = 0;
  int atk = 0;
  dynamic followerType; // none/friend/non_friend/npc/npc_no_td
  int hp = 0;
  int maxHp = 0;
  int maxActNum = 0;
  int np = 0;
  int npLineCount = 3;
  int lineMaxNp = 100;
  int tmpNp = 0;
  int equipAtk = 0;
  int equipHp = 0;
  int maxTpTurn = 0;
  int nextTpTurn = 0;
  int downStarRate = 0;
  int downTdRate = 0;
  int deathRate = 0;
  int svtType = 0; //displayType, npcSvtType;
  int criticalRate = 0;
  int reducedHp = 0;
  int restAttackCount = 0;
  int overkillTargetId = 0;
  int accumulationDamage = 0;
  int resultHp = 0;

  // BattleServantData.Status status
  List<int> userCommandCodeIds = [];
  List<int> svtIndividuality = [];
  List<BattleSkillInfoData> skillInfoList = []; //BattleSkillInfoData
  int tdId = 0;
  int tdLv = 0;
  BattleCEData? equip;
  BattleBuff battleBuff = BattleBuff();
  int shiftIndex = 0;
  BattleServantData? killedBy;
  CommandCardData? killedByCard;
  List<List<BuffData>> commandCodeBuffs = [[], [], [], [], []];

  PlayerSvtData? playerSvtData;

  bool get selectable => battleBuff.isSelectable;

  int get attack =>
      isPlayer ? atk + playerSvtData!.fou + (equip?.craftEssence.atkGrowth[playerSvtData!.ceLv] ?? 0) : atk;

  SvtClass get svtClass => isPlayer ? niceSvt!.className : niceEnemy!.svt.className;

  Attribute get attribute => isPlayer ? niceSvt!.attribute : niceEnemy!.svt.attribute;

  int get starGen => isPlayer ? niceSvt!.starGen : 0;

  int get defenceNpGain =>
      isPlayer ? niceSvt!.noblePhantasms[playerSvtData!.npStrengthenLvl].npGain.defence[playerSvtData!.npLv] : 0;

  int get enemyTdRate => isEnemy ? niceEnemy!.serverMod.tdRate : 0;

  int get enemyTdAttackRate => isEnemy ? niceEnemy!.serverMod.tdAttackRate : 0;

  int get enemyStarRate => isEnemy ? niceEnemy!.serverMod.starRate : 0;

  bool get isBuggedOverkill => accumulationDamage > hp;

  static BattleServantData fromEnemy(QuestEnemy enemy) {
    final svt = BattleServantData();
    svt
      ..niceEnemy = enemy
      ..hp = enemy.hp
      ..uniqueId = enemy.uniqueId
      ..svtId = enemy.svt.id
      ..limitCount = enemy.limit?.limitCount ?? 0
      ..level = enemy.lv
      ..atk = enemy.atk
      ..deathRate = enemy.deathRate
      ..downTdRate = enemy.serverMod.tdRate;
    // TODO (battle): build enemy active skills & cards & NP
    return svt;
  }

  void init(BattleData battleData) {
    List<NiceSkill> passives = isPlayer
        ? [...niceSvt!.classPassive, ...niceSvt!.extraPassive, ...niceSvt!.appendPassive.map((e) => e.skill)]
        : [...niceEnemy!.classPassive.classPassive, ...niceEnemy!.classPassive.addPassive];

    battleData.setActivator(this);
    for (final skill in passives) {
      activateSkill(battleData, skill, 1, isPassive: true); // passives default to level 1
    }

    equip?.activateCE(battleData);

    battleData.unsetActivator();
  }

  List<CommandCardData> getCards() {
    if (isEnemy) {
      return [];
    }

    final List<CommandCardData> builtCards = [];
    for (int i = 0; i < niceSvt!.cards.length; i += 1) {
      final cardType = niceSvt!.cards[i];
      final card = CommandCardData(cardType, niceSvt!.cardDetails[cardType]!)
        ..isNP = false
        ..cardStrengthen = playerSvtData!.cardStrengthens[i]
        ..npGain = getNPGain(cardType)
        ..traits = [mapCardTypeToTrait(cardType), NiceTrait(id: Trait.faceCard.id)]
        ..commandCodeBuffs = commandCodeBuffs[i];
      builtCards.add(card);
    }
    return builtCards;
  }

  CommandCardData? getExtraCard() {
    if (isEnemy) {
      return null;
    }

    return CommandCardData(CardType.extra, niceSvt!.cardDetails[CardType.extra]!)
      ..isNP = false
      ..npGain = getNPGain(CardType.extra)
      ..traits = [mapCardTypeToTrait(CardType.extra), NiceTrait(id: Trait.faceCard.id)];
  }

  static NiceTrait mapCardTypeToTrait(CardType cardType) {
    switch (cardType) {
      case CardType.buster:
        return NiceTrait(id: Trait.cardBuster.id);
      case CardType.arts:
        return NiceTrait(id: Trait.cardArts.id);
      case CardType.quick:
        return NiceTrait(id: Trait.cardQuick.id);
      case CardType.extra:
        return NiceTrait(id: Trait.cardExtra.id);
      case CardType.weak:
        return NiceTrait(id: Trait.cardWeak.id);
      case CardType.strength:
        return NiceTrait(id: Trait.cardStrong.id);
      case CardType.none:
      case CardType.blank:
        throw 'Invalid Card Type: $cardType';
    }
  }

  int getNPGain(CardType cardType) {
    if (!isPlayer) {
      return 0;
    }
    switch (cardType) {
      case CardType.buster:
        return getCurrentNP().npGain.buster[playerSvtData!.npLv];
      case CardType.arts:
        return getCurrentNP().npGain.arts[playerSvtData!.npLv];
      case CardType.quick:
        return getCurrentNP().npGain.quick[playerSvtData!.npLv];
      case CardType.extra:
        return getCurrentNP().npGain.extra[playerSvtData!.npLv];
      default:
        return 0;
    }
  }

  List<NiceTrait> getTraits() {
    // TODO (battle): account for add & remove traits
    final List<NiceTrait> results = [];
    final svtTraits = isPlayer ? niceSvt!.traits : niceEnemy!.traits;
    results.addAll(svtTraits);
    return results;
  }

  bool checkTrait(NiceTrait requiredTrait) {
    return checkTraits([requiredTrait]);
  }

  bool checkTraits(Iterable<NiceTrait> requiredTraits) {
    return containsAllTraits(getTraits(), requiredTraits) || battleBuff.checkTraits(requiredTraits);
  }

  void changeNP(int change) {
    if (!isPlayer) {
      return;
    }

    np += change;

    np.clamp(0, getNPCap(playerSvtData!.npLv));
    if (change > 0 && np > npPityThreshold) {
      np = max(np, db.gameData.constData.constants.fullTdPoint);
    }
  }

  static int getNPCap(int npLevel) {
    final capRate = npLevel == 1
        ? 1
        : npLevel < 5
            ? 2
            : 3;
    return db.gameData.constData.constants.fullTdPoint * capRate;
  }

  bool isKilledBy(BattleServantData? activator, CommandCardData? currentCard) {
    return activator != null && currentCard != null && killedBy == activator && killedByCard == currentCard;
  }

  void receiveDamage(int hitDamage) {
    hp -= hitDamage;
  }

  void addAccumulationDamage(int damage) {
    accumulationDamage += damage;
  }

  void clearAccumulationDamage() {
    accumulationDamage = 0;
  }

  bool hasNextShift() {
    if (isPlayer) {
      return false;
    }

    return niceEnemy!.enemyScript.shift != null && niceEnemy!.enemyScript.shift!.length > shiftIndex;
  }

  bool isAlive() {
    if (hp > 0) {
      return true;
    }

    if (hasNextShift()) {
      return true;
    }

    // TODO (battle): check for conditional guts?
    return collectBuffsPerTypes(battleBuff.allBuffs, gutsTypes).isNotEmpty;
  }

  bool canAttack(BattleData battleData) {
    if (hp <= 0) {
      return false;
    }

    final doNotActs = collectBuffsPerAction(battleBuff.allBuffs, BuffAction.donotAct);
    return doNotActs.every((buff) => !buff.shouldApplyBuff(battleData, this == battleData.target));
  }

  bool canCommandCard(BattleData battleData) {
    final doNotCommandCards = collectBuffsPerAction(battleBuff.allBuffs, BuffAction.donotActCommandtype);

    return canAttack(battleData) &&
        doNotCommandCards.every((buff) => !buff.shouldApplyBuff(battleData, this == battleData.target));
  }

  bool canNP(BattleData battleData) {
    if ((isPlayer && np < db.gameData.constData.constants.fullTdPoint) ||
        (isEnemy && (npLineCount < niceEnemy!.chargeTurn || niceEnemy!.chargeTurn == 0))) {
      return false;
    }

    final doNotActNps = [
      ...collectBuffsPerAction(battleBuff.allBuffs, BuffAction.donotNoble),
      ...collectBuffsPerAction(battleBuff.allBuffs, BuffAction.donotNobleCondMismatch)
    ];

    return canAttack(battleData) &&
        doNotActNps.every((buff) => !buff.shouldApplyBuff(battleData, this == battleData.target)) &&
        checkNPScript(battleData);
  }

  bool checkNPScript(BattleData battleData) {
    if (isPlayer) {
      final currentNP = niceSvt!.noblePhantasms[playerSvtData!.npStrengthenLvl];
      // TODO (battle): check script
    } else {
      final currentNP = niceEnemy!.noblePhantasm;
    }
    return true;
  }

  NiceTd getCurrentNP() {
    return isPlayer ? niceSvt!.noblePhantasms[playerSvtData!.npStrengthenLvl] : niceEnemy!.noblePhantasm.noblePhantasm!;
  }

  void activateNP(BattleData battleData, int extraOverchargeLvl) {
    battleData.setActivator(this);

    // TODO (battle): account for OC buff
    final overchargeLvl =
        isPlayer ? (np / db.gameData.constData.constants.fullTdPoint).floor() + extraOverchargeLvl : 1;

    final npLvl = isPlayer ? playerSvtData!.npLv : niceEnemy!.noblePhantasm.noblePhantasmLv;

    np = 0;
    npLineCount = 0;

    for (final function in getCurrentNP().functions) {
      executeFunction(battleData, function, npLvl, overchargeLvl: overchargeLvl);
    }
    battleData.unsetActivator();
  }

  int getBuffValueOnAction(BattleData battleData, BuffAction buffAction, [List<BuffData>? commandCodeBuffs]) {
    final isTarget = battleData.target == this;
    var totalVal = 0;
    var maxRate = 0;

    final actionDetails = db.gameData.constData.buffActions[buffAction];

    final allBuffs = [...battleBuff.allBuffs, ...commandCodeBuffs ?? []];

    for (BuffData buff in collectBuffsPerAction(allBuffs, buffAction)) {
      if (buff.shouldApplyBuff(battleData, isTarget)) {
        buff.setUsed();
        battleData.setCurrentBuff(buff);
        final totalEffectiveness =
            buffAction != BuffAction.buffRate ? getBuffValueOnAction(battleData, BuffAction.buffRate) : 0;
        battleData.unsetCurrentBuff();

        final value = (toModifier(totalEffectiveness) * buff.param).toInt();
        if (actionDetails!.plusTypes.contains(buff.buff.type)) {
          totalVal += value;
        } else {
          totalVal -= value;
        }
        maxRate = max(maxRate, buff.buff.maxRate);
      }
    }
    return capBuffValue(actionDetails!, totalVal, maxRate);
  }

  bool hasBuffOnAction(BattleData battleData, BuffAction buffAction, [List<BuffData>? commandCodeBuffs]) {
    final isTarget = battleData.target == this;

    final allBuffs = [...battleBuff.allBuffs, ...commandCodeBuffs ?? []];
    for (BuffData buff in collectBuffsPerAction(allBuffs, buffAction)) {
      if (buff.shouldApplyBuff(battleData, isTarget)) {
        buff.setUsed();
        return true;
      }
    }
    return false;
  }

  void activateBuffOnAction(BattleData battleData, BuffAction buffAction, [List<BuffData>? commandCodeBuffs]) {
    activateBuffOnActions(battleData, [buffAction], commandCodeBuffs);
  }

  void activateBuffOnActions(BattleData battleData, Iterable<BuffAction> buffActions,
      [List<BuffData>? commandCodeBuffs]) {
    battleData.setActivator(this);

    final allBuffs = [...battleBuff.allBuffs, ...commandCodeBuffs ?? []];
    for (BuffData buff in collectBuffsPerActions(allBuffs, buffActions)) {
      if (buff.shouldApplyBuff(battleData, false)) {
        final skill = db.gameData.baseSkills[buff.param];
        if (skill == null) {
          print('Unknown skill ID [${buff.param}] referenced in buff [${buff.buff?.id}].');
          continue;
        }

        activateSkill(battleData, skill, buff.additionalParam);
        buff.setUsed();
      }
    }

    battleData.unsetActivator();
  }

  void removeBuffWithTrait(NiceTrait trait) {
    battleBuff.activeList.removeWhere((buff) => buff.checkTraits([trait]));
  }

  bool isBuffStackable(int buffGroup) {
    for (BuffData buff in battleBuff.allBuffs) {
      if (!buff.canStack(buffGroup)) {
        return false;
      }
    }

    return true;
  }

  void addBuff(BuffData buffData, {bool isPassive = false}) {
    if (isPassive) {
      battleBuff.passiveList.add(buffData);
    } else {
      battleBuff.activeList.add(buffData);
    }
  }

  void checkBuffStatus() {
    battleBuff.allBuffs.where((buff) => buff.isUsed).forEach((buff) {
      buff.useOnce();
    });

    battleBuff.allBuffs.removeWhere((buff) => !buff.isActive);
  }

  void enterField(BattleData battleData) {
    activateBuffOnAction(battleData, BuffAction.functionEntry);
  }

  void death(BattleData battleData) {
    activateBuffOnAction(battleData, BuffAction.functionDead);
  }

  void startOfMyTurn(BattleData battleData) {
    activateBuffOnAction(battleData, BuffAction.functionSelfturnstart);
  }

  bool activateGuts(BattleData battleData) {
    BuffData? gutsToApply;
    for (final buff in collectBuffsPerTypes(battleBuff.allBuffs, gutsTypes)) {
      if (buff.shouldApplyBuff(battleData, false)) {
        if (gutsToApply == null || (gutsToApply.irremovable && !buff.irremovable)) {
          gutsToApply = buff;
        }
      }
    }

    if (gutsToApply != null) {
      gutsToApply.setUsed();
      final value = gutsToApply.param;
      if (gutsToApply.buff.type == BuffType.gutsRatio) {
        hp = (value * maxHp).floor();
      } else {
        hp = value;
      }
      killedByCard = null;
      killedBy = null;
      activateBuffOnAction(battleData, BuffAction.functionGuts);
      return true;
    }

    return false;
  }

  BattleServantData copy() {
    return BattleServantData()
      ..niceEnemy = niceEnemy
      ..niceSvt = niceSvt
      ..index = index
      ..deckIndex = deckIndex
      ..uniqueId = uniqueId
      ..svtId = svtId
      ..exceedCount = exceedCount
      ..limitCount = limitCount
      ..transformSvtId = transformSvtId
      ..transformIndex = transformIndex
      ..totalDamage = totalDamage
      ..svtData = svtData
      ..level = level
      ..maxLevel = maxLevel
      ..atk = atk
      ..followerType = followerType
      ..hp = hp
      ..maxHp = maxHp
      ..maxActNum = maxActNum
      ..np = np
      ..npLineCount = npLineCount
      ..lineMaxNp = lineMaxNp
      ..tmpNp = tmpNp
      ..equipAtk = equipAtk
      ..equipHp = equipHp
      ..maxTpTurn = maxTpTurn
      ..nextTpTurn = nextTpTurn
      ..downStarRate = downStarRate
      ..downTdRate = downTdRate
      ..deathRate = deathRate
      ..svtType = svtType
      ..criticalRate = criticalRate
      ..reducedHp = reducedHp
      ..restAttackCount = restAttackCount
      ..overkillTargetId = overkillTargetId
      ..accumulationDamage = accumulationDamage
      ..resultHp = resultHp
      ..userCommandCodeIds = userCommandCodeIds.toList()
      ..svtIndividuality = svtIndividuality.toList()
      ..skillInfoList = skillInfoList.toList() // copy
      ..tdId = tdId
      ..tdLv = tdLv
      ..equip = equip
      ..battleBuff = battleBuff // TODO (battle): add copy()
      ..shiftIndex = shiftIndex; //copy
  }
}
