import 'package:flutter/material.dart';

class PaletteButton extends StatelessWidget {
  final Color color;
  final Function onTap;
  final Color borderColor;
  final double size;

  PaletteButton(
      {Key key, @required this.color, this.borderColor, this.size, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: 45,
        height: 45,
        decoration: ShapeDecoration(
            shape: CircleBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 2)),
            color: color),
      ),
    );
  }
}
