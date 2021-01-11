import 'package:flutter/material.dart';
import 'package:padel_diary/pages/forms/balls_form_page.dart';
import 'package:padel_diary/pages/forms/club_form_page.dart';
import 'package:padel_diary/pages/forms/match_form_page.dart';
import 'package:padel_diary/pages/forms/player_form_page.dart';
import 'package:padel_diary/pages/forms/tournament_form_page.dart';
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
          'balls-form': (BuildContext context) => BallsFormPage(),
          'club-form': (BuildContext context) => ClubFormPage(),
          'match-form': (BuildContext context) => MatchFormPage(),
          'tournament-form': (BuildContext context) => TournamentFormPage(),
          'player-form': (BuildContext context) => PlayerFormPage(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
