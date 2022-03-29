import 'package:auto_size_text/auto_size_text.dart';
import 'package:chaldea/app/app.dart';
import 'package:chaldea/app/modules/common/filter_page_base.dart';
import 'package:chaldea/generated/l10n.dart';
import 'package:chaldea/models/models.dart';
import 'package:chaldea/packages/split_route/split_route.dart';
import 'package:chaldea/utils/utils.dart';
import 'package:chaldea/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'filter_page.dart';
import 'summon_detail_page.dart';

class SummonListPage extends StatefulWidget {
  SummonListPage({Key? key}) : super(key: key);

  @override
  _SummonListPageState createState() => _SummonListPageState();
}

class _SummonListPageState extends State<SummonListPage>
    with SearchableListState<LimitedSummon, SummonListPage> {
  @override
  Iterable<LimitedSummon> get wholeData => db2.gameData.wiki.summons.values;

  SummonFilterData get filterData => db2.settings.summonFilterData;

  Set<String> get plans => db2.curUser.summons;

  @override
  void initState() {
    super.initState();
    filterData.reset();
    // filterData.reversed = Language.isJP || db.curUser.server == GameServer.jp;
  }

  @override
  Widget build(BuildContext context) {
    filterShownList();
    shownList.sort2((a) => a.startTime.jp ?? 0);
    if (filterData.reversed) {
      final reversed = List.of(shownList.reversed);
      shownList
        ..clear()
        ..addAll(reversed);
    }
    return scrollListener(
      useGrid: false,
      appBar: AppBar(
        title: Text(S.of(context).summon_title),
        leading: const MasterBackButton(),
        titleSpacing: 0,
        bottom: showSearchBar ? searchBar : null,
        actions: [
          IconButton(
            icon: FaIcon(
              filterData.reversed
                  ? FontAwesomeIcons.arrowDownWideShort
                  : FontAwesomeIcons.arrowUpWideShort,
              size: 20,
            ),
            tooltip: 'Reversed',
            onPressed: () {
              setState(() {
                filterData.reversed = !filterData.reversed;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt),
            tooltip: S.of(context).filter,
            onPressed: () => FilterPage.show(
              context: context,
              builder: (context) => SummonFilterPage(
                filterData: filterData,
                onChanged: (_) {
                  if (mounted) setState(() {});
                },
              ),
            ),
          ),
          IconButton(
            icon: Icon(
                filterData.favorite ? Icons.favorite : Icons.favorite_outline),
            tooltip: S.current.favorite,
            onPressed: () {
              setState(() {
                filterData.favorite = !filterData.favorite;
              });
            },
          ),
          // searchIcon,
        ],
      ),
    );
  }

  @override
  Widget listItemBuilder(LimitedSummon summon) {
    Widget title;
    Widget? subtitle;
    if (filterData.showBanner) {
      title = ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 108),
        child: CachedImage(
          imageUrl:
              db2.curUser.region == Region.cn || db2.curUser.region == Region.tw
                  ? summon.banner.cn ?? summon.banner.jp
                  : summon.banner.jp ?? summon.banner.cn,
          placeholder: (ctx, url) => Text(summon.lName),
          cachedOption: CachedImageOption(
              errorWidget: (ctx, url, error) => Text(summon.lName)),
        ),
      );
    } else {
      title = AutoSizeText(
        summon.lName,
        maxLines: 2,
        maxFontSize: 14,
        // style: TextStyle(color: summon.isOutdated() ? Colors.grey : null),
      );
      String? subtitleText;
      if (db2.curUser.region == Region.cn) {
        subtitleText = summon.startTime.cn?.sec2date().toDateString();
        if (subtitleText != null) {
          subtitleText = 'CN ' + subtitleText;
        }
      }
      subtitleText ??=
          'JP ' + (summon.startTime.jp?.sec2date().toDateString() ?? '???');
      subtitle = Text(subtitleText);
    }
    return ListTile(
      title: title,
      subtitle: subtitle,
      contentPadding: filterData.showBanner
          ? const EdgeInsets.only(right: 8)
          : const EdgeInsets.only(left: 16, right: 8),
      minVerticalPadding: filterData.showBanner ? 0 : null,
      trailing: db2.onUserData(
        (context, snapshot) {
          final planned = db2.curUser.summons.contains(summon.id);
          return IconButton(
            icon: Icon(
              planned ? Icons.favorite : Icons.favorite_outline,
              color: planned ? Colors.redAccent : null,
            ),
            onPressed: () {
              db2.curUser.summons.toggle(summon.id);
              db2.notifyUserdata();
            },
          );
        },
      ),
      onTap: () {
        router.push(
          url: Routes.summonI(summon.id),
          child: SummonDetailPage(
            summon: summon,
            summonList: shownList.toList(),
          ),
        );
      },
    );
  }

  @override
  Widget gridItemBuilder(LimitedSummon datum) {
    throw UnimplementedError('GridView not designed');
  }

  @override
  String getSummary(LimitedSummon summon) {
    // return Utils.getSearchAlphabets(summon.name, summon.nameJp, summon.nameEn)
    //     .join('\t');
    return '';
  }

  @override
  bool filter(LimitedSummon summon) {
    if (filterData.favorite && !plans.contains(summon.id)) return false;
    // if (!filterData.showOutdated && summon.isOutdated() && !summon.isStory) {
    //   return false;
    // }
    if (!filterData.category.matchOne(summon.type)) {
      return false;
    }
    return true;
  }
}
