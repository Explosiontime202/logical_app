import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppBorderWidth.dart';

import 'AppLevel.dart';
import 'AppLevelStatus.dart';

class AppRuleList extends StatefulWidget {
  final AppLevel level;
  final bool scrollable;

  AppRuleList({@required this.level, this.scrollable = false}) : super();

  @override
  _AppRuleListState createState() => _AppRuleListState();
}

class _AppRuleListState extends State<AppRuleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: widget.scrollable ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      itemCount: widget.level.rules.length,
      itemBuilder: (BuildContext context, int index) {
        return new AppRuleTile(
          level: widget.level,
          index: index,
        );
      },
    );
  }
}

class AppRuleTile extends StatefulWidget {
  final AppLevel level;
  final int index;

  AppRuleTile({@required this.level, @required this.index}) : super();

  @override
  _AppRuleTileState createState() => _AppRuleTileState();
}

class _AppRuleTileState extends State<AppRuleTile> {
  AppLevelStatus _levelStatus;

  @override
  Widget build(BuildContext context) {
    if (_levelStatus == null) _levelStatus = AppLevelStatus.of(widget.level);
    String rule = widget.level.rules[widget.index];
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: AppBorderWidth.thick)),
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
