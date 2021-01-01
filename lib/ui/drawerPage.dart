import 'package:flutter/material.dart';

import 'package:hnn_news_app/pages/loginPage.dart';
import 'package:hnn_news_app/pages/newsDetails.dart';
import 'package:hnn_news_app/pages/settings.dart';
import 'package:hnn_news_app/ui/RSS.dart';

class DrawerPage extends StatefulWidget {
  final String mailState;

  DrawerPage({Key key, this.mailState}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/account.png"),
            ),
            accountName: Text("Merhaba "),
            accountEmail: Text(
              "${widget.mailState}",
            ),
          ),
          ListTile(
            title: Text("Ana Sayfa"),
            leading: Icon(Icons.home, color: Colors.orange),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RSSDemo()));
            },
          ),
          Divider(
            color: Colors.red[900],
            thickness: 1,
            endIndent: 10,
            indent: 10,
          ),
          ListTile(
            title: Text("Ayarlar"),
            leading: Icon(Icons.settings, color: Colors.blue),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          Divider(
            color: Colors.red[900],
            thickness: 1,
            endIndent: 10,
            indent: 10,
          ),
          ListTile(
            title: Text("Çıkış Yap"),
            leading: Icon(Icons.logout, color: Colors.grey),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
            },
          ),
          Divider(
            color: Colors.red[900],
            thickness: 1,
            endIndent: 10,
            indent: 10,
          ),
          ListTile(
            title: Text("Haber Detayı"),
            leading: Icon(Icons.logout, color: Colors.grey),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsDetailsPage()));
            },
          ),
        ],
      ),
    );
  }
}
