// @dart=2.9
import 'package:flutter/material.dart';
import 'View/form_entry.dart';
import 'View/list_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Sheet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedbackListPage(),
    );
  }
}

