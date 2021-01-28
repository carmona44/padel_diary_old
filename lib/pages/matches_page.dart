import 'package:flutter/material.dart';

class MatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Matches page'),
    );
  }

  Widget _createMatchContainer() {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text('Nombre1'),
              Text('Nombre2'),
              Icon(Icons.ac_unit), //SizedBox()
              Text('6'),
              Text('7'),
              Text('6'),
            ],
          ),
          Row(
            children: [
              Text('Nombre3'),
              Text('Nombre4'),
              Icon(Icons.ac_unit), //SizedBox()
              Text('4'),
              Text('5'),
              Text('3'),
            ],
          ),
        ],
      ),
    );
  }
}
