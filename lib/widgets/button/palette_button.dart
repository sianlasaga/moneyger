import 'package:flutter/material.dart';

class PaletteButton extends StatelessWidget {
  final Color color;
  final Function onTap;
  final Color borderColor;
  final double size;
  final double borderWidth;
  final bool isSelected;
  final double shadowRadius;

  PaletteButton(
      {Key key,
      @required this.color,
      this.borderColor = Colors.white,
      this.size = 45,
      this.onTap,
      this.borderWidth = 4,
      this.isSelected = false,
      this.shadowRadius = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                spreadRadius: isSelected ? shadowRadius : 0,
                color: color,
                blurRadius: isSelected ? shadowRadius : 0,
              )
            ],
            shape: CircleBorder(
                side: BorderSide(
                    color: borderColor, width: isSelected ? borderWidth : 0)),
            color: color),
      ),
    );
  }
}
