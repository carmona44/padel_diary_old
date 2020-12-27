import 'package:flutter/material.dart';
import 'package:padel_diary/pages/home_page.dart';
import 'package:padel_diary/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
      ],
      child: MaterialApp(
        title: 'Diario de pádel',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
