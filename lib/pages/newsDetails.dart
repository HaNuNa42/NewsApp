import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';

class NewsDetailsPage extends StatefulWidget {
  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  String _platformVersion = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("haber detayı"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                SocialShare.shareOptions(_platformVersion);
              },
            )
          ],
        ),
        body: Container());
  }
}
