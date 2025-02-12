import 'dart:math';

import 'package:chaldea/app/battle/models/battle.dart';
import 'package:chaldea/app/battle/utils/buff_utils.dart';
import 'package:chaldea/app/descriptors/func/vals.dart';
import 'package:chaldea/generated/l10n.dart';
import 'package:chaldea/models/models.dart';

class BattleBuff {
  List<BuffData> _passiveList = [];
  List<BuffData> _activeList = [];
  List<BuffData> commandCodeList = [];
  List<BuffData> auraBuffList = [];

  /// directly return origin instance, be aware if you want to modify in place
  List<BuffData> get originalPassiveList => _passiveList;
  List<BuffData> get originalActiveList => _activeList;

  List<BuffData> getPassiveList() => _passiveList.where((e) => e.stateAct && e.stateAct).toList();
  List<BuffData> getActiveList() => _activeList.where((e) => e.stateAct && e.stateAct).toList();
  List<BuffData> getCommandCodeList() => commandCodeList.where((e) => e.stateAct && e.stateAct).toList();

  List<BuffData> getAllBuffs() => [..._passiveList, ..._activeList, ...commandCodeList];
  List<BuffData> get validBuffs => [...getPassiveList(), ...getActiveList(), ...getCommandCodeList()];

  void setPassiveList(List<BuffData> list) => _passiveList = list;
  void setActiveList(List<BuffData> list) => _activeList = list;

  void addBuff(BuffData buff, {required bool isPassive}) {
    if (isPassive) {
      _passiveList.add(buff);
    } else {
      _activeList.add(buff);
    }
  }

  void checkUsedBuff() {
    _passiveList.removeWhere((buff) => buff.checkBuffClear());
    _activeList.removeWhere((buff) => buff.checkBuffClear());
  }

  List<BuffData> get shownBuffs => [
        ..._passiveList.where((buff) {
          final showState = buff.vals.ShowState ?? 0;
          if (showState == -1) return false;
          if (buff.vals.SetPassiveFrame == 1 || showState >= 1) return true;
          return false;
        }),
        ..._activeList.where((buff) {
          final showState = buff.vals.ShowState ?? 0;
          if (showState == -1) return false;
          return true;
        }),
      ];

  bool get isSelectable =>
      validBuffs.every((buff) => !buff.traits.map((trait) => trait.id).contains(Trait.cantBeSacrificed.id));

  void removeBuffWithTrait(final NiceTrait trait, {bool includeNoAct = false, bool includeNoField = false}) {
    _activeList.removeWhere((buff) =>
        (includeNoAct || buff.stateAct) &&
        (includeNoField || buff.stateField) &&
        checkTraitFunction(buff.traits, [trait], partialMatch, partialMatch));
  }

  void turnProgress() {
    for (final buff in getAllBuffs()) {
      if (!buff.stateField) continue;
      buff.turnPass();
    }
  }

  void turnPassParamAdd() {
    for (final buff in validBuffs) {
      buff.turnPassParamAdd();
    }
  }

  void clearPassive(final int uniqueId) {
    _passiveList.removeWhere((buff) => buff.actorUniqueId == uniqueId);
  }

  BattleBuff copy() {
    final copy = BattleBuff()
      .._passiveList = _passiveList.map((e) => e.copy()).toList()
      .._activeList = _activeList.map((e) => e.copy()).toList()
      ..commandCodeList = commandCodeList.map((e) => e.copy()).toList()
      ..auraBuffList = auraBuffList.map((e) => e.copy()).toList();
    return copy;
  }
}

class BuffData {
  Buff buff;
  DataVals vals;

  int buffRate = 1000;
  int count = -1;
  int logicTurn = -1;
  int get dispTurn => logicTurn >= 0 ? (logicTurn + 1) ~/ 2 : logicTurn;
  int param = 0;
  int additionalParam = 0;
  NiceTd? tdSelection;

  bool checkBuffClear() => count == 0 || logicTurn == 0;

  int? actorUniqueId;
  String? actorName;
  bool isUsed = false;

  bool passive = false;
  bool irremovable = false;

  bool stateAct = true;
  bool stateField = true;

  // ignore: unused_field
  bool isDecide = false;
  int userCommandCodeId = -1;
  List<int> targetSkill = [];
  int state = 0;
  int auraEffectId = -1;
  bool isActiveCC = false;

  // may not need this field.
  // Intent is to check should remove passive when transforming servants to only remove actor's passive
  // Default to Hyde's passive not ever added, which means we don't do any passive cleaning logic in transform script
  bool notActorPassive = false;

  bool get isOnField => vals.OnField == 1;

  BuffData(this.buff, this.vals) {
    count = vals.Count ?? -1;
    logicTurn = vals.Turn == null ? -1 : vals.Turn! * 2;
    param = vals.Value ?? 0;
    additionalParam = vals.Value2 ?? 0;
    buffRate = vals.UseRate ?? 1000;
    irremovable = vals.UnSubState == 1; // need more sample
  }

  BuffData.makeCopy(this.buff, this.vals);

  List<NiceTrait> get traits => buff.vals;

  static final List<BuffType> activeOnlyTypes = [
    BuffType.upDamageIndividualityActiveonly,
    BuffType.downDamageIndividualityActiveonly,
  ];

  int getValue(final BattleData battleData, final BattleServantData self, [final BattleServantData? opponent]) {
    int addValue = 0;
    if (vals.ParamAddValue != null) {
      int addCount = 0;
      final selfIndiv = vals.ParamAddSelfIndividuality ?? vals.ParamAddFieldIndividuality;
      final oppIndiv = vals.ParamAddOpIndividuality ?? vals.ParamAddFieldIndividuality;
      if (selfIndiv != null) {
        final targetTraits = NiceTrait.list(selfIndiv);
        addCount += self.countTrait(battleData, targetTraits) + self.countBuffWithTrait(targetTraits);
      }
      if (oppIndiv != null && opponent != null) {
        final targetTraits = NiceTrait.list(oppIndiv);
        addCount += opponent.countTrait(battleData, targetTraits) + opponent.countBuffWithTrait(targetTraits);
      }

      if (vals.ParamAddMaxCount != null) {
        addCount = min(addCount, vals.ParamAddMaxCount!);
      }

      addValue = addCount * vals.ParamAddValue!;

      if (vals.ParamAddMaxValue != null) {
        addValue = min(addValue, vals.ParamAddMaxValue!);
      }
    }

    int baseParam = param;
    if (vals.RatioHPLow != null || vals.RatioHPHigh != null) {
      final lowerBound = vals.RatioHPHigh ?? 0;
      final upperBound = vals.RatioHPLow ?? 0;
      final addition = upperBound - lowerBound;
      final maxHpRatio = vals.RatioHPRangeHigh ?? 1000;
      final minHpRatio = vals.RatioHPRangeLow ?? 0;
      final currentHpRatio = ((self.hp / self.getMaxHp(battleData)) * 1000).toInt();

      final appliedBase = currentHpRatio > maxHpRatio ? 0 : lowerBound;
      final additionPercent = (maxHpRatio - currentHpRatio.clamp(minHpRatio, maxHpRatio)) / (maxHpRatio - minHpRatio);

      baseParam += appliedBase + (addition * additionPercent).toInt();
    }

    return baseParam + addValue;
  }

  bool shouldApplyBuff(final BattleData battleData, final BattleServantData self, [final BattleServantData? opponent]) {
    // final onFieldCheck = !isOnField || actorUniqueId == null || battleData.isActorOnField(actorUniqueId!);

    final scriptCheck = checkDataVals(battleData) && checkBuffScript(battleData);

    if (!scriptCheck || !stateAct || !stateField) {
      return false;
    }

    /// dw does not check self / op traits for svtTrait related types
    switch (buff.type) {
      case BuffType.addIndividuality:
      case BuffType.subIndividuality:
        return true;
      default:
        final checkIndvType = buff.script?.checkIndvType ?? 0;
        final positiveMatchFunction = checkIndvType == 1 || checkIndvType == 3 ? allMatch : partialMatch;
        final negativeMatchFunction = checkIndvType == 1 || checkIndvType == 3 ? allMatch : partialMatch;
        final activeOnly = activeOnlyTypes.contains(buff.type);
        final ignoreIrremovable = vals.IgnoreIndivUnreleaseable == 1;
        final checkActorNpTraits = buff.script?.IncludeIgnoreIndividuality == 1;

        final selfCheck = battleData.checkTraits(CheckTraitParameters(
          requiredTraits: buff.ckSelfIndv,
          actor: self,
          positiveMatchFunction: positiveMatchFunction,
          negativeMatchFunction: negativeMatchFunction,
          checkActorTraits: true,
          checkActorBuffTraits: battleData.currentBuff == null,
          checkActiveBuffOnly: activeOnly,
          ignoreIrremovableBuff: ignoreIrremovable,
          checkActorNpTraits: checkActorNpTraits,
          checkCurrentBuffTraits: true,
          checkCurrentCardTraits: true,
        ));

        final opponentCheck = battleData.checkTraits(CheckTraitParameters(
          requiredTraits: buff.ckOpIndv,
          actor: opponent,
          positiveMatchFunction: positiveMatchFunction,
          negativeMatchFunction: negativeMatchFunction,
          checkActorTraits: true,
          checkActorBuffTraits: battleData.currentBuff == null,
          checkActiveBuffOnly: activeOnly,
          ignoreIrremovableBuff: ignoreIrremovable,
          checkActorNpTraits: checkActorNpTraits,
          checkCurrentBuffTraits: true,
          checkCurrentCardTraits: true,
        ));

        return selfCheck && opponentCheck;
    }
  }

  Future<bool> shouldActivateBuff(
    final BattleData battleData,
    final BattleServantData self, [
    final BattleServantData? opponent,
  ]) async {
    final probabilityCheck = await battleData.canActivate(
        buffRate,
        '${battleData.activator?.lBattleName ?? S.current.battle_no_source}'
        ' - ${buff.lName.l}');

    if (buffRate < 1000) {
      battleData.battleLogger.debug('${battleData.activator?.lBattleName ?? S.current.battle_no_source}'
          ' - ${buff.lName.l}: ${probabilityCheck ? S.current.success : S.current.failed}'
          '${battleData.options.tailoredExecution ? '' : ' [$buffRate vs ${battleData.options.probabilityThreshold}]'}');
    }

    return probabilityCheck && shouldApplyBuff(battleData, self, opponent);
  }

  bool checkDataVals(final BattleData battleData) {
    if (vals.HpReduceToRegainIndiv != null) {
      final currentBuffMatch = battleData.checkTraits(CheckTraitParameters(
        requiredTraits: [NiceTrait(id: vals.HpReduceToRegainIndiv!)],
        checkCurrentBuffTraits: true,
      ));
      if (!currentBuffMatch) {
        return false;
      }
    }

    return true;
  }

  bool checkBuffScript(final BattleData battleData) {
    if (buff.script == null) {
      return true;
    }

    final script = buff.script!;

    if (vals.OnFieldCount == -1 && script.TargetIndiv != null) {
      final List<BattleServantData> allies =
          battleData.activator?.isPlayer ?? true ? battleData.nonnullAllies : battleData.nonnullEnemies;

      final onFieldServantsExist = allies
          .where((svt) =>
              svt != battleData.activator &&
              battleData.checkTraits(CheckTraitParameters(
                requiredTraits: [script.TargetIndiv!],
                actor: svt,
                checkActorTraits: true,
                checkActorBuffTraits: script.IncludeIgnoreIndividuality == 1,
              )))
          .isNotEmpty;

      if (onFieldServantsExist) {
        return false;
      }
    }

    if (script.UpBuffRateBuffIndiv != null && battleData.currentBuff != null) {
      final isCurrentBuffMatch = battleData.checkTraits(CheckTraitParameters(
        requiredTraits: script.UpBuffRateBuffIndiv!,
        checkCurrentBuffTraits: true,
      ));

      if (!isCurrentBuffMatch) {
        return false;
      }
    }

    if (script.convert != null &&
        battleData.currentBuff != null &&
        script.convert!.convertType == BuffConvertType.buff) {
      final Map<String, dynamic> targetBuffs = script.convert!.targets.first;
      final int buffId = targetBuffs.values.first;
      if (buffId != battleData.currentBuff!.buff.id) {
        return false;
      }
    }

    return true;
  }

  bool canStack(final int buffGroup) {
    return buffGroup == 0 || buffGroup != buff.buffGroup;
  }

  void setUsed() {
    isUsed = true;
  }

  void useOnce() {
    isUsed = false;
    if (count > 0) {
      count -= 1;
    }
  }

  void turnPassParamAdd() {
    if (vals.ParamAdd != null) {
      if (vals.ParamAddSelfIndividuality == null &&
          vals.ParamAddOpIndividuality == null &&
          vals.ParamAddFieldIndividuality == null) {
        param += vals.ParamAdd!;
        param = param.clamp(0, vals.ParamMax!);
      }
    }
  }

  void turnPass() {
    if (logicTurn > 0) {
      logicTurn -= 1;
    }
  }

  void updateActState(final BattleData battleData, final BattleServantData owner) {
    bool actResult = true;

    List<NiceTrait>? requiredTraits;
    int? requireAtLeast;
    bool Function(Iterable<NiceTrait>, Iterable<NiceTrait>) positiveMatchFunction = partialMatch;
    bool Function(Iterable<NiceTrait>, Iterable<NiceTrait>) negativeMatchFunction = partialMatch;

    if (buff.script?.INDIVIDUALITIE != null) {
      requiredTraits = [buff.script!.INDIVIDUALITIE!];
      requireAtLeast = buff.script?.INDIVIDUALITIE_COUNT_ABOVE;
    } else if (buff.script?.INDIVIDUALITIE_AND != null) {
      requiredTraits = buff.script!.INDIVIDUALITIE_AND!;
      positiveMatchFunction = allMatch;
      negativeMatchFunction = allMatch;
    } else if (buff.script?.INDIVIDUALITIE_OR != null) {
      requiredTraits = buff.script!.INDIVIDUALITIE_OR!;
    }

    if (requiredTraits != null) {
      actResult &= battleData.checkTraits(CheckTraitParameters(
        requiredTraits: requiredTraits,
        actor: owner,
        requireAtLeast: requireAtLeast,
        positiveMatchFunction: positiveMatchFunction,
        negativeMatchFunction: negativeMatchFunction,
        checkActorTraits: true,
        checkActorBuffTraits: true,
        checkQuestTraits: true,
      ));
    }

    if (buff.script?.HP_HIGHER != null) {
      final int hpRatio = (owner.hp / owner.getMaxHp(battleData) * 1000).toInt();
      actResult &= hpRatio >= buff.script!.HP_HIGHER!;
    }

    if (buff.script?.HP_LOWER != null) {
      final int hpRatio = (owner.hp / owner.getMaxHp(battleData) * 1000).toInt();
      actResult &= hpRatio <= buff.script!.HP_LOWER!;
    }
    stateAct = actResult;

    stateField = true;
    if (isOnField && actorUniqueId != null) {
      // should be NO_FIELD state rather NO_ACT in fact
      stateField &= battleData.isActorOnField(actorUniqueId!);
    }
  }

  String effectString() {
    return '${buffRate != 1000 ? '${(buffRate / 10).toStringAsFixed(1)} %' : ''} '
        '${buff.lName.l} '
        '${buff.ckSelfIndv.isNotEmpty ? '${S.current.battle_require_self_traits} '
            '${buff.ckSelfIndv.map((trait) => trait.shownName())} ' : ''}'
        '${buff.ckOpIndv.isNotEmpty ? '${S.current.battle_require_opponent_traits} '
            '${buff.ckOpIndv.map((trait) => trait.shownName())} ' : ''}'
        '${getParamString()}'
        '${isOnField ? S.current.battle_require_actor_on_field((actorName ?? actorUniqueId).toString()) : ''}';
  }

  String getParamString() {
    final List<String> effectString = [];
    ValDsc.describeBuff(effectString, buff, vals, inList: false, ignoreCount: true);
    return effectString.join(' ');
  }

  String durationString() {
    final List<String> durationString = [];
    if (count > 0) {
      durationString.add(Transl.special.funcValCountTimes(count));
    }
    if (logicTurn > 0) {
      durationString.add(Transl.special.funcValTurns(dispTurn));
    }
    if (durationString.isEmpty) {
      durationString.add(S.current.battle_buff_permanent);
    }

    return durationString.join(', ');
  }

  BuffData copy() {
    final BuffData copy = BuffData.makeCopy(buff, vals)
      ..buffRate = buffRate
      ..count = count
      ..logicTurn = logicTurn
      ..param = param
      ..additionalParam = additionalParam
      ..tdSelection = tdSelection
      ..actorUniqueId = actorUniqueId
      ..actorName = actorName
      ..isUsed = isUsed
      ..irremovable = irremovable
      ..passive = passive
      ..stateAct = stateAct
      ..stateField = stateField;
    return copy;
  }
}
