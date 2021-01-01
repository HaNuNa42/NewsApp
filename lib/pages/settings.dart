import 'package:flutter/material.dart';
import 'package:hnn_news_app/pages/aboutPage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ayarlar"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    FlatButton(
                        onPressed: () {},
                        child: Text("Lisanslar",
                            style: TextStyle(
                                color: Colors.black, fontSize: 24.0))),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutPage()));
                        },
                        child: Text("Geliştirici",
                            style: TextStyle(
                                color: Colors.black, fontSize: 24.0))),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 400),
                    ),
                    Text("2020, News App v1.0",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
