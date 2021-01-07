import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hnn_news_app/ui/splashPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.lime, primaryColor: Colors.red[900]),
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: SplashPage(),
    );
  }
}
