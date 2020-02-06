import 'package:flutter/material.dart';

import 'package:moneyger/screens/Home/accounts_screen.dart';
import 'package:moneyger/screens/Home/overview_screen.dart';
import 'package:moneyger/screens/Home/transactions_screen.dart';
import 'package:moneyger/screens/Home/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currTabIndex = 0;
  List<TabContent> _tabContents = [
    TabContent('Transactions', TransactionsScreen()),
    TabContent('Overview', OverviewScreen()),
    TabContent('Accounts', AccountsScreen()),
    TabContent('Settings', SettingsScreen())
  ];

  void _onTabTapped(index) {
    setState(() {
      _currTabIndex = index;
    });
  }

  TabContent get _currContent {
    return _tabContents[_currTabIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_currContent.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currTabIndex,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text('Transactions')),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), title: Text('Overview')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                title: Text('Accounts')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Settings')),
          ],
        ),
        floatingActionButton: _currTabIndex == 0
            ? FloatingActionButton(
                onPressed: null,
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(Icons.add),
              )
            : null,
        body: _currContent.child);
  }
}

class TabContent {
  final String title;
  final Widget child;

  TabContent(this.title, this.child);
}
