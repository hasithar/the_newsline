import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:the_newsline/widgets/bottom_navigation.widget.dart';

class NewsSingle extends StatefulWidget {
  final String newsUrl;

  const NewsSingle({Key? key, required this.newsUrl}) : super(key: key);

  @override
  State<NewsSingle> createState() => _NewsSingleState();
}

class _NewsSingleState extends State<NewsSingle> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text('Back'),
          centerTitle: false,
          backgroundColor: const Color.fromRGBO(0, 21, 69, 1),
          foregroundColor: Colors.white,
        ),
      ),
      body: WebView(
        initialUrl: widget.newsUrl,
        onWebViewCreated: (WebViewController webViewController) => {
          _completer.complete(webViewController)
        },
      ),
      bottomNavigationBar: const BottomNavigation()
    );
  }
}
