import 'package:flutter/material.dart';

class IconRoundButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function onPressed;
  const IconRoundButton(
      {Key key, @required this.color, @required this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(color: color, shape: CircleBorder()),
      child: IconButton(
          padding: EdgeInsets.all(6),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          onPressed: onPressed),
    );
  }
}
