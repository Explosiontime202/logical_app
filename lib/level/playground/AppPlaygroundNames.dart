import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevel.dart';

class AppPlaygroundItems extends StatefulWidget {
  final AppLevel level;
  final bool rot;
  final int index;

  AppPlaygroundItems({@required this.level, @required this.rot, @required this.index}) : super();

  @override
  _AppPlaygroundItemsState createState() => _AppPlaygroundItemsState();
}

class _AppPlaygroundItemsState extends State<AppPlaygroundItems> {
  @override
  Widget build(BuildContext context) {
    List<String> items = widget.level.items[widget.index];
    assert(items.length == 5);
    double itemExtent = MediaQuery.of(context).size.width / 20;
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: widget.rot ? Axis.horizontal : Axis.vertical,
        itemCount: 5,
        itemExtent: itemExtent,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5)),
            child: RotatedBox(
              quarterTurns: widget.rot ? 3 : 0,
              child: Padding(
                padding: EdgeInsets.only(right: widget.rot ? 0 : 5, left: widget.rot ? 5 : 0),
                child: Text(
                  items[index],
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: widget.rot ? TextAlign.left : TextAlign.right,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
