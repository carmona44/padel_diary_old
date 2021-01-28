import 'package:flutter/material.dart';
import 'package:padel_diary/models/player_model.dart';
import 'package:padel_diary/providers/player_provider.dart';
import 'package:provider/provider.dart';
/*import 'package:padel_diary/models/club_model.dart';
import 'package:padel_diary/models/tournament_model.dart';
import 'package:padel_diary/models/ball_model.dart';*/

class MyDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);
    final players = playerProvider.players;

    return ListView(
      children: [
        ..._playerList(players),
        //..._clubList([]),
        //..._tournamentList([]),
        //..._ballList([]),
      ],
    );
  }

  List<Widget> _playerList(List<Player> players) {
    List<Widget> widgets = [];

    widgets..add(ListTile(title: Text('Jugadores')))..add(Divider());

    for (var i = 0; i < players.length; i++) {
      widgets.add(ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text('${players[i].name} ${players[i].surname}'),
        subtitle: Text('${players[i].position}'),
      ));
    }

    return widgets;
  }

  /*List<Widget> _clubList(List<Club> clubs) {
    List<Widget> widgets = [];

    widgets..add(ListTile(title: Text('Clubes')))..add(Divider());

    for (var i = 0; i < clubs.length; i++) {
      widgets.add(ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text('${clubs[i].name}'),
        subtitle: Text('${clubs[i].city}'),
      ));
    }

    return widgets;
  }

  List<Widget> _tournamentList(List<Tournament> tournament) {
    List<Widget> widgets = [];

    widgets..add(ListTile(title: Text('Torneos')))..add(Divider());

    for (var i = 0; i < tournament.length; i++) {
      widgets.add(ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text('${tournament[i].name}'),
        subtitle: Text('${tournament[i].city}'),
      ));
    }

    return widgets;
  }

  List<Widget> _ballList(List<Ball> balls) {
    List<Widget> widgets = [];

    widgets..add(ListTile(title: Text('Bolas')))..add(Divider());

    for (var i = 0; i < balls.length; i++) {
      widgets.add(ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text('${balls[i].brand}'),
        subtitle: Text('${balls[i].model}'),
      ));
    }

    return widgets;
  }*/
}
