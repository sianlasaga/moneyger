import 'package:flutter/material.dart';

import 'package:moneyger/utils/icon_helper.dart';
import 'package:moneyger/utils/color_helper.dart';
import 'package:moneyger/widgets/button/palette_button.dart';
import 'package:moneyger/widgets/button/icon_round_button.dart';

class IconSelectionDialog extends StatefulWidget {
  IconSelectionDialog({Key key}) : super(key: key);

  @override
  _IconSelectionDialogState createState() => _IconSelectionDialogState();
}

class _IconSelectionDialogState extends State<IconSelectionDialog>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int selectedIconIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  void _handleIconPressed(int index) {
    setState(() {
      selectedIconIndex = index;
    });
  }

  List<Widget> _generateAccountIcons() {
    return accountIconNames.asMap().entries.map((entry) {
      int index = entry.key;
      return IconRoundButton(
        color: index == selectedIconIndex ? Colors.red : Colors.grey,
        icon: getIconByString(entry.value),
        onPressed: () => _handleIconPressed(index),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: BeveledRectangleBorder(),
      child: Container(
        height: 500,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: TabBar(
                controller: controller,
                labelColor: Theme.of(context).primaryColor,
                tabs: <Widget>[
                  Tab(
                    text: 'ICON',
                  ),
                  Tab(
                    text: 'COLOR',
                  )
                ],
              ),
            ),
            Container(
              height: 450,
              child: TabBarView(
                controller: controller,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Accounts',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: _generateAccountIcons(),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(10)),
                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: getIconColors()
                            .map((e) => PaletteButton(
                                  color: e,
                                ))
                            .toList(),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
