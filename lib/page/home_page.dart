import 'package:flutter_app2/fragment/profile.dart';
import 'package:flutter_app2/fragment/Setting.dart';
import 'package:flutter_app2/fragment/Transfer.dart';
import 'package:flutter_app2/fragment/ExchangeRate.dart';
import 'package:flutter_app2/fragment/contast_us.dart';
import 'package:flutter_app2/fragment/Any_suggestion.dart';
import 'package:flutter_app2/fragment/Term.dart';
//import 'package:flutter_app2/fragment/Faq.dart';
//import 'package:flutter_app2/fragment/View_Benefiainries.dart';
import 'package:flutter_app2/fragment/Log Out.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
    new DrawerItem("contast Us ", Icons.contact_phone),
    new DrawerItem("Any Suggestion ", Icons.comment),
    new DrawerItem("Terms & Condition", Icons.assessment),
    new DrawerItem("Log Out ", Icons.feedback),
   // new DrawerItem("View Benefiainries", Icons.movie),
   // new DrawerItem("MyQR", Icons.settings_overscan),
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
      case 4:
        return new contastUs();
      case 5:
        return new anysuggestion();
      case 6:
       return new Term();
      case 7:
          return new LogOut();
      /*case 8:
          return new View_Benefiainries();
      case 9:
        return new LogOut();*/
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
                accountName: new Text("Prince Bank ",
                style : TextStyle(
                  fontSize: 30.0),
        ),
                decoration : BoxDecoration(
                  color:Colors.indigo,
                ),
                 accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
