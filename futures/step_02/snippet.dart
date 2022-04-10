import 'package:flutter/material.dart';

const hostingUrl = 'https://dartpad-workshops-io2021.web.app';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Image.network('$hostingUrl/example_flutter/images/dash.png'),
      ),
    );
  }
}
