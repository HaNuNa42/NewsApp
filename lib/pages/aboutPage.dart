import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Geliştirici Hakkında"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text("Hatice Nur Nalbant",
                        style: TextStyle(color: Colors.grey, fontSize: 24.0)),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 100),
                    ),
                    SignInButton(
                      Buttons.GitHub,
                      text: "Takip Et GitHub",
                      onPressed: () => launch("https://github.com/HaNuNa42/"),
                    ),
                    SignInButton(
                      Buttons.LinkedIn,
                      text: "Takip Et LinkedIn",
                      onPressed: () => launch(
                          "https://www.linkedin.com/in/hatice-nur-n-916b7517a/"),
                    ),
                    SignInButtonBuilder(
                        icon: Icons.enhance_photo_translate_outlined,
                        text: "Takip Et Instagram",
                        onPressed: () => launch(
                            "https://www.instagram.com/birdeliprogramci/"),
                        backgroundColor: Colors.pink[400]),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 250),
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
