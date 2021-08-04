import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

import 'AppLevel.dart';
import 'AppLevelStatus.dart';

class AppRuleList extends StatefulWidget {
  final AppLevel level;
  final bool scrollable;

  AppRuleList({required this.level, this.scrollable = false}) : super();

  @override
  _AppRuleListState createState() => _AppRuleListState();
}

class _AppRuleListState extends State<AppRuleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: widget.scrollable ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // the first tile displays the rule list info text
        if (index == 0) {
          return ListTile(
            title: Text(AppSettingStatus.currentLanguage.level.ruleListInfoText),
          );
        }

        // between two "normal" tiles (either a rule or the rule list info text tile) is a divider
        if (index % 2 == 1) {
          return Divider();
        }

        return AppRuleTile(
          level: widget.level,
          index: index ~/ 2 - 1,
        );
      },
      // one info text tile + rule tiles + dividers as much as rules
      itemCount: widget.level.rules.length * 2 + 1,
    );
  }
}

class AppRuleTile extends StatefulWidget {
  final AppLevel level;
  final int index;

  AppRuleTile({required this.level, required this.index}) : super();

  @override
  _AppRuleTileState createState() => _AppRuleTileState();
}

class _AppRuleTileState extends State<AppRuleTile> {
  late AppLevelStatus _levelStatus = AppLevelStatus.of(widget.level);

  @override
  Widget build(BuildContext context) {
    String rule = widget.level.rules[widget.index];
    return Container(
      child: ListTile(
        onTap: () {
          setState(() {
            _levelStatus.invertRuleStatus(widget.index);
          });
        },
        title: Text(
          rule,
          style: TextStyle(
              decoration:
                  (_levelStatus.getRuleStatus(widget.index)) ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        leading: Text(
          widget.index.toString(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
