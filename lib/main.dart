import 'package:flutter/material.dart';
import 'package:padel_diary/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diario de pádel',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
