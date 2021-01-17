import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Añadir:'),
          ),
          /*ListTile(
            title: Text('Bolas'),
            leading: Icon(Icons.sports_baseball),
            onTap: () => Navigator.pushNamed(context, 'balls-form'),
          ),
          ListTile(
            title: Text('Club'),
            leading: Icon(Icons.home),
            onTap: () => Navigator.pushNamed(context, 'club-form'),
          ),*/
          ListTile(
            title: Text('Partido'),
            leading: Icon(Icons.sports_tennis),
            onTap: () => Navigator.pushNamed(context, 'match-form'),
          ),
          /*ListTile(
            title: Text('Torneo'),
            leading: Icon(Icons.emoji_events),
            onTap: () => Navigator.pushNamed(context, 'tournament-form'),
          ),*/
          ListTile(
            title: Text('Jugador'),
            leading: Icon(Icons.emoji_people),
            onTap: () => Navigator.pushNamed(context, 'player-form'),
          )
        ],
      ),
    ));
  }
}
