import 'package:flutter/material.dart';
import 'package:hnn_news_app/pages/favoritesPage.dart';
import 'package:hnn_news_app/pages/newsDetails.dart';
import 'package:hnn_news_app/ui/drawerPage.dart';
import 'package:mobx/mobx.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RSSDemo extends StatefulWidget {
  RSSDemo() : super();
  final String title = 'News App';
  @override
  RSSDemoState createState() => RSSDemoState();
}

class RSSDemoState extends State<RSSDemo> {
  //
  static const String FEED_URL =
      'https://www.ahaber.com.tr/rss/galeri/anasayfa.xml';
  RssFeed _feed;
  String _title;
  static const String loadingFeedMsg = 'Loading Feed...';
  static const String feedLoadErrorMsg = 'Error Loading Feed.';
  static const String feedOpenErrorMsg = 'Error Opening Feed.';
  static const String placeholderImg = 'assets/no_image.png';
  GlobalKey<RefreshIndicatorState> _refreshKey;
  TextEditingController searchController;
  int page = 1;
  final Function favoritesAccessor;
  RSSDemoState({this.favoritesAccessor});

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  searchNews(searchNews) {
    setState(() {
      searchNews = searchController;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(url = await Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return NewsDetailsPage();
      })));
    }
    updateTitle(feedOpenErrorMsg);
  }

  load() async {
    updateTitle(loadingFeedMsg);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        updateTitle(feedLoadErrorMsg);
        return;
      }
      updateFeed(result);
      updateTitle(_feed.title);
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(FEED_URL);
      return RssFeed.parse(response.body);
    } catch (e) {
      debugPrint(e);
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
    searchController = TextEditingController();
  }

  title(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  subtitle(subTitle) {
    return Text(
      '${subTitle ?? "default"}',
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  thumbnail(imageUrl) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset(placeholderImg),
        imageUrl: imageUrl,
        height: 50,
        width: 70,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }

  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.red[900],
      size: 30.0,
    );
  }

  list() {
    return ListView.builder(
      itemCount: _feed.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed.items[index];
        return ListTile(
          title: title(item.title),
          subtitle: subtitle(item.pubDate),
          leading: thumbnail(item.enclosure.url),
          trailing: rightIcon(),
          contentPadding: EdgeInsets.all(5.0),
          onTap: () => openFeed(item.link),
        );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @action
  void resetNews() {
    searchController.clear();
    load();
  }

  searchLoad() {
    try {} catch (e) {
      debugPrint(e);
    }
  }

  @observable
  String keyword = "";

  @observable
  bool loadingNews = false;

  @observable
  List<void> news = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: buildSearchField,
        actions: [buildIconButtonClose],
        //  title: Text(_title),
      ),
        drawer: DrawerPage(favoritesAccessor()),
      body: body(),
    );
  }

  TextField get buildSearchField {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
          hintText: "Buradan haber arayabilirsiniz...",
          border: InputBorder.none),
      //   onSubmitted: (String keyword) => viewModel.loadNews(keyword),
    );
  }

  IconButton get buildIconButtonClose {
    return IconButton(
      onPressed: () => resetNews(),
      icon: Icon(Icons.close, color: Colors.black),
    );
  }
}
