import 'dart:math';

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
  int _selectedIconIndex = 0;
  int _selectedColorIndex;
  List<IconData> _categoryIcons = [];
  List<IconData> _accountIcons = [];
  final double dialogWidth = 400;
  final double dialogHeight = 600;

  @override
  void initState() {
    super.initState();
    _categoryIcons = getCategoryIcons();
    _accountIcons = getAccountIcons();
    _selectedColorIndex = Random().nextInt(getIconColors().length - 1);
    controller = TabController(length: 2, vsync: this);
  }

  Color get _selectedColor {
    return getIconColors()[_selectedColorIndex];
  }

  void _handleIconPressed(int index) {
    setState(() {
      _selectedIconIndex = index;
    });
  }

  void _handleColorPressed(int index) {
    setState(() {
      _selectedColorIndex = index;
    });
  }

  IconData get _selectedIcon {
    if (_selectedIconIndex < _accountIcons.length) {
      return _accountIcons[_selectedIconIndex];
    }
    return _categoryIcons[_selectedIconIndex - _categoryIcons.length + 1];
  }

  List<Widget> _generateAccountIcons() {
    return _accountIcons.asMap().entries.map((entry) {
      int index = entry.key;
      return IconRoundButton(
        color: index == _selectedIconIndex ? _selectedColor : Colors.grey,
        icon: entry.value,
        onPressed: () => _handleIconPressed(index),
      );
    }).toList();
  }

  List<Widget> _generateCategoryIcons() {
    int startingIndex = _categoryIcons.length - 1;
    return _categoryIcons.asMap().entries.map((entry) {
      int index = entry.key + startingIndex;
      return IconRoundButton(
        color: index == _selectedIconIndex ? _selectedColor : Colors.grey,
        icon: entry.value,
        onPressed: () => _handleIconPressed(index),
      );
    }).toList();
  }

  List<Widget> _generateColors() {
    List<Widget> palettes = [];
    getIconColors().asMap().forEach((key, value) {
      palettes.add(PaletteButton(
        color: value,
        onTap: () => _handleColorPressed(key),
        isSelected: _selectedColorIndex == key,
      ));
    });
    return palettes;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: BeveledRectangleBorder(),
      child: Container(
        height: dialogHeight,
        width: dialogWidth,
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
              height: 550,
              child: Stack(
                children: <Widget>[
                  TabBarView(
                    controller: controller,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(),
                          child: Column(
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
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Category',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Wrap(
                                spacing: 15,
                                runSpacing: 15,
                                direction: Axis.horizontal,
                                children: _generateCategoryIcons(),
                              ),
                              SizedBox(
                                height: 60,
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(),
                          child: Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(10)),
                              Wrap(
                                spacing: 15,
                                runSpacing: 15,
                                direction: Axis.horizontal,
                                children: _generateColors(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          width: dialogWidth - 80,
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Wrap(
                                  spacing: 10,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    IconRoundButton(
                                        color: _selectedColor,
                                        icon: _selectedIcon),
                                    Text(
                                      'TITLE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: ButtonBar(
                                  alignment: MainAxisAlignment.end,
                                  buttonPadding: EdgeInsets.all(0),
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: null,
                                      padding: EdgeInsets.all(0),
                                      child: Text('CANCEL'),
                                    ),
                                    FlatButton(
                                      onPressed: null,
                                      padding: EdgeInsets.all(0),
                                      child: Text('DONE'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
