import 'package:flutter_app2/fragment/profile.dart';
import 'package:flutter_app2/fragment/Setting.dart';
import 'package:flutter_app2/fragment/Transfer.dart';
import 'package:flutter_app2/fragment/ExchangeRate.dart';
//import 'package:flutter_app2/fragment/contastus.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);

}

class HomePage extends StatefulWidget {
  get drawerItems => [
    new DrawerItem("profile", Icons.account_box),
    new DrawerItem("Setting", Icons.settings),
    new DrawerItem("Transfer", Icons.compare_arrows),
    new DrawerItem("Exchange Rate ", Icons.rate_review),

  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new profile();
      case 1:
        return new Setting();
      case 2:
        return new Transfer();
      case 3:
        return new ExchangeRate();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Prince Bank "), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
