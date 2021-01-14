import 'package:flutter/material.dart';
import 'package:padel_diary/providers/player_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);
    final players = playerProvider.players;

    return ListView.builder(
        itemCount: players.length,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('${players[i].name} ${players[i].surname}'),
              subtitle: Text('${players[i].position}'),
              onTap: () => {},
            ));
  }
}
