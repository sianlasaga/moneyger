import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  OverviewScreen({Key key}) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Overview'),
      ),
    );
  }
}
