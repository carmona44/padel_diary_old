import 'package:flutter/material.dart';
import 'package:padel_diary/models/match_model.dart';
import 'package:padel_diary/providers/match_provider.dart';
import 'package:provider/provider.dart';

class MatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final matchProvider = Provider.of<MatchProvider>(context);
    final matches = matchProvider.matches;

    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20.0),
      itemCount: matches.length,
      itemBuilder: (context, i) => _createMatchContainer(matches[i]),
    );
  }

  Widget _createMatchContainer(Match match) {
    TextStyle _setResultStyle = TextStyle(fontSize: 24.0);
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(DateTime(match.date).toString()),
          Card(
            elevation: 12.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Table(
                columnWidths: {0: FractionColumnWidth(.40)},
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('${match.teamALeft} / ${match.teamARight}',
                            textAlign: TextAlign.center),
                      ),
                      Icon(Icons.emoji_events,
                          color: Colors.amberAccent), //SizedBox()
                      Text('${match.teamAFirstSet}',
                          style: _setResultStyle, textAlign: TextAlign.center),
                      Text('${match.teamASecondSet}',
                          style: _setResultStyle, textAlign: TextAlign.center),
                      Text('${match.teamAThirdSet}',
                          style: _setResultStyle, textAlign: TextAlign.center),
                    ],
                  ),
                  TableRow(children: [
                    SizedBox(height: 20.0),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    SizedBox()
                  ]),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('${match.teamBLeft} / ${match.teamBRight}',
                            textAlign: TextAlign.center),
                      ),
                      /*Icon(Icons.emoji_events),*/ SizedBox(),
                      Text('${match.teamBFirstSet}',
                          style: _setResultStyle, textAlign: TextAlign.center),
                      Text('${match.teamBSecondSet}',
                          style: _setResultStyle, textAlign: TextAlign.center),
                      Text('${match.teamBThirdSet}',
                          style: _setResultStyle, textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
