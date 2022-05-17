import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:chaldea/app/modules/common/misc.dart';
import 'package:chaldea/models/models.dart';
import 'package:chaldea/utils/utils.dart';
import 'package:chaldea/widgets/widgets.dart';
import 'func/func.dart';

class SkillDescriptor extends StatelessWidget with FuncsDescriptor {
  final BaseSkill skill;
  final int? level; // 1-10
  final bool showPlayer;
  final bool showEnemy;
  final bool showNone;
  final bool hideDetail;
  final bool showBuffDetail;

  const SkillDescriptor({
    Key? key,
    required this.skill,
    this.level,
    this.showPlayer = true,
    this.showEnemy = false,
    this.showNone = false,
    this.hideDetail = false,
    this.showBuffDetail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int cd0 = 0, cd1 = 0;
    if (skill.coolDown.isNotEmpty) {
      cd0 = skill.coolDown.first;
      cd1 = skill.coolDown.last;
    }
    Widget? _wrapSkillAdd(Widget? child, bool translate) {
      if (child == null) return null;
      if (skill.skillAdd.isEmpty) return child;
      return Tooltip(
        message: skill.skillAdd
            .map((e) => translate ? Transl.skillNames(e.name).l : e.name)
            .join('/'),
        child: child,
      );
    }

    final header = CustomTile(
      contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 6, 16, 6),
      leading: db.getIconImage(skill.icon, width: 33, aspectRatio: 1),
      title: _wrapSkillAdd(Text(skill.lName.l), true),
      subtitle: Transl.isJP || hideDetail
          ? null
          : _wrapSkillAdd(Text(skill.name), false),
      trailing: cd0 <= 0 && cd1 <= 0
          ? null
          : cd0 == cd1
              ? Text('   CD: $cd0')
              : Text('   CD: $cd0→$cd1'),
    );
    const divider = Divider(indent: 16, endIndent: 16, height: 2, thickness: 1);
    return TileGroup(
      children: [
        header,
        if (!hideDetail) ...[
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
            child: Text(skill.lDetail ?? '???',
                style: Theme.of(context).textTheme.caption),
          ),
          divider,
        ],
        ...describeFunctions(
          funcs: skill.functions,
          level: level,
          showPlayer: showPlayer,
          showEnemy: showEnemy,
          showNone: showNone,
          showBuffDetail: showBuffDetail,
        )
      ],
    );
  }
}

class OverrideTDData {
  final String? tdName;
  final String? tdRuby;
  final String? tdFileName;
  final String? tdRank;
  final String? tdTypeText;

  final List<int> keys;

  OverrideTDData({
    required this.tdName,
    required this.tdRuby,
    required this.tdFileName,
    required this.tdRank,
    required this.tdTypeText,
  }) : keys = [];

  static List<OverrideTDData> fromAscensionAdd(AscensionAdd data) {
    List<OverrideTDData> tds = [];
    for (final key in data.overWriteTDName.all.keys) {
      final v = OverrideTDData(
        tdName: data.overWriteTDName.all[key],
        tdRuby: data.overWriteTDRuby.all[key],
        tdFileName: data.overWriteTDFileName.all[key],
        tdRank: data.overWriteTDRank.all[key],
        tdTypeText: data.overWriteTDTypeText.all[key],
      );
      v.keys.add(key);
      final td = tds.firstWhereOrNull((e) => e._hashCode == v._hashCode);
      if (td == null) {
        tds.add(v);
      } else {
        td.keys.add(key);
      }
    }
    return tds;
  }

  int get _hashCode =>
      Object.hash(tdName, tdRuby, tdFileName, tdRank, tdTypeText);
}

class TdDescriptor extends StatelessWidget with FuncsDescriptor {
  final NiceTd td;
  final int? level;
  final bool showPlayer;
  final bool showEnemy;
  final bool showNone;
  final OverrideTDData? overrideData;

  const TdDescriptor({
    Key? key,
    required this.td,
    this.level,
    this.showPlayer = true,
    this.showEnemy = false,
    this.showNone = false,
    this.overrideData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tdType = Transl.tdTypes(overrideData?.tdTypeText ?? td.type);
    final tdRank = overrideData?.tdRank ?? td.rank;
    final tdName = Transl.tdNames(overrideData?.tdName ?? td.name);
    final tdRuby = Transl.tdRuby(overrideData?.tdRuby ?? td.ruby);
    const divider = Divider(indent: 16, endIndent: 16, height: 2, thickness: 1);
    final header = CustomTile(
      leading: Column(
        children: <Widget>[
          CommandCardWidget(card: td.card, width: 90),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 110 * 0.9),
            child: Text(
              '${tdType.l} $tdRank',
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AutoSizeText(
            tdRuby.l,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.caption?.color),
            maxLines: 1,
          ),
          AutoSizeText(
            tdName.l,
            style: const TextStyle(fontWeight: FontWeight.w600),
            maxLines: 2,
          ),
          if (!Transl.isJP) ...[
            AutoSizeText(
              tdRuby.jp,
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.caption?.color),
              maxLines: 1,
            ),
            AutoSizeText(
              tdName.jp,
              style: const TextStyle(fontWeight: FontWeight.w600),
              maxLines: 1,
            ),
          ]
        ],
      ),
    );
    return TileGroup(
      children: [
        header,
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
          child: Text(td.lDetail ?? '???',
              style: Theme.of(context).textTheme.caption),
        ),
        divider,
        ...describeFunctions(
          funcs: td.functions,
          level: level,
          showPlayer: showPlayer,
          showEnemy: showEnemy,
          showNone: showNone,
        ),
        CustomTable(children: [
          CustomTableRow(children: [
            TableCellData(text: 'Hits', isHeader: true),
            TableCellData(
              text: td.npDistribution.isEmpty
                  ? '   -'
                  : '   ${td.npDistribution.length} Hits '
                      '(${td.npDistribution.join(', ')})',
              flex: 5,
              alignment: Alignment.centerLeft,
            )
          ]),
          CustomTableRow.fromTexts(
              texts: const ['Buster', 'Arts', 'Quick', 'Extra', 'NP', 'Def'],
              defaults: TableCellData(isHeader: true, maxLines: 1)),
          CustomTableRow.fromTexts(
            texts: [
              td.npGain.buster,
              td.npGain.arts,
              td.npGain.quick,
              td.npGain.extra,
              td.npGain.np,
              td.npGain.defence,
            ].map((e) => '${e.first / 100}%').toList(),
          ),
        ]),
      ],
    );
  }
}
