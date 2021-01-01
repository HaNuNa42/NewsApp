import 'package:flutter/material.dart';
import 'package:hnn_news_app/pages/loginPage.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SignInPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Image.asset(
                  'assets/text835.png',
                  scale: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
