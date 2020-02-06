import 'package:flutter/material.dart';

class AccountsScreen extends StatefulWidget {
  AccountsScreen({Key key}) : super(key: key);

  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Accounts'),
      ),
    );
  }
}
