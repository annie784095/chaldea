//@dart=2.9
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chaldea/components/components.dart';

import '../limit_event_detail_page.dart';

class LimitEventTab extends StatefulWidget {
  final bool reverse;

  const LimitEventTab({Key key, this.reverse = false}) : super(key: key);

  @override
  _LimitEventTabState createState() => _LimitEventTabState();
}

class _LimitEventTabState extends State<LimitEventTab> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final limitEvents = db.gameData.events.limitEvents;
    final eventKeys = limitEvents.keys.toList();
    eventKeys.sort((a, b) {
      return (limitEvents[a].startTimeJp)
              .compareTo(limitEvents[b].startTimeJp) *
          (widget.reverse ? -1 : 1);
    });
    return Scrollbar(
      controller: _scrollController,
      child: ListView.separated(
        controller: _scrollController,
        itemCount: eventKeys.length,
        separatorBuilder: (context, index) => Divider(height: 1, indent: 16),
        itemBuilder: (context, index) {
          final event = limitEvents[eventKeys[index]];
          final plan = db.curUser.events.limitEventOf(event.indexKey);
          bool outdated = event.isOutdated();
          return ListTile(
            title: AutoSizeText(
              event.localizedName,
              maxFontSize: 16,
              maxLines: 2,
              style: outdated ? TextStyle(color: Colors.grey) : null,
            ),
            subtitle: AutoSizeText(
              event.startTimeJp.split(' ').first,
              maxLines: 1,
              style: outdated ? TextStyle(color: Colors.grey[400]) : null,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (event.extra?.isNotEmpty == true ||
                    event.lottery?.isNotEmpty == true)
                  Icon(Icons.star, color: Colors.yellow[700]),
                Switch.adaptive(
                  value: plan.enable,
                  onChanged: (v) => setState(
                    () {
                      plan.enable = v;
                      db.itemStat.updateEventItems();
                    },
                  ),
                )
              ],
            ),
            onTap: () {
              SplitRoute.push(
                context: context,
                builder: (context, _) =>
                    LimitEventDetailPage(name: eventKeys[index]),
                popDetail: true,
              );
            },
          );
        },
      ),
    );
  }
}
