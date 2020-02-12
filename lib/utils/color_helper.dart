import 'package:flutter/material.dart';

List<Color> getIconColors() {
  List<Color> colors = [];
  Colors.primaries.asMap().forEach((index, value) {
    colors.add(value);
    if (index < 16) {
      colors.add(Colors.accents[index]);
    }
  });
  return colors;
}
