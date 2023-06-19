import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapsQuality extends StatefulWidget {
  const MapsQuality({Key? key}) : super(key: key);

  @override
  State<MapsQuality> createState() => _MapsQualityState();
}

class _MapsQualityState extends State<MapsQuality> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: "http://101.128.81.83:3385/app/air#",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
