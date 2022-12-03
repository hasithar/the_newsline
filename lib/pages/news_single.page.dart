import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      appBar: AppBar(
        title: Text('title'),
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.newsUrl,
          onWebViewCreated: (WebViewController webViewController) => {
            _completer.complete(webViewController)
          },
        ),
      ),
    );
  }
}
