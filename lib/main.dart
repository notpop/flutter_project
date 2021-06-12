import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'webveber',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'webnever Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _tweet() async {
    final Map<String, dynamic> tweetQuery = {
      "text": "My best tap count is " +
          _counter.toString() +
          " !\nLet's play a game with me.\n",
      "url": "https://webnever.com/" + "\n",
      "hashtags": "webnever\n",
      "via": "webnever_com",
    };

    final Uri tweetScheme =
        Uri(scheme: "twitter", host: "post", queryParameters: tweetQuery);

    final Uri tweetIntentUrl =
        Uri.https("twitter.com", "/intent/tweet", tweetQuery);

    await canLaunch(tweetScheme.toString())
        ? await launch(tweetScheme.toString())
        : await launch(tweetIntentUrl.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: false,
        titleSpacing: 20.0,
        title: const Text('webnever.com'),
        actions: <Widget>[
          IconButton(
            onPressed: _tweet,
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 140,
              child: const Text('Tap! Tap! Tap!',
                  style: TextStyle(
                    fontSize: 50,
                  )),
            ),
            Container(
              height: 20,
            ),
            SizedBox(
              height: 160,
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 120,
                ),
              ),
            ),
            Container(
              height: 160,
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        height: 120,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            size: 120,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
