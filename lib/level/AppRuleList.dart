import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppBorderWidth.dart';
import 'package:logical_app/constants/AppColors.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

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
    return ListView(
      shrinkWrap: true,
      physics: widget.scrollable ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      children: _getChildren(),
    );
  }

  List<Widget> _getChildren() {
    List<Widget> list = List.generate(
      widget.level.rules.length,
      (index) => AppRuleTile(
        level: widget.level,
        index: index,
      ),
    );

    // Add info bar
    list.insert(
      0,
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor, width: AppBorderWidth.thick),
            color: AppColors.guiBackgroundColor),
        child: ListTile(
          title: Text(AppSettingStatus.currentLanguage.level.ruleListInfoText),
        ),
      ),
    );
    return list;
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
