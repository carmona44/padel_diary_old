import 'package:flutter/material.dart';

class MatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20.0),
      itemCount: 10,
      itemBuilder: (context, index) => _createMatchContainer(),
    );
  }

  Widget _createMatchContainer() {
    TextStyle _setResultStyle = TextStyle(fontSize: 24.0);
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text('28/01/2021'),
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
                        child: Text('Daniel / Jose Javier',
                            textAlign: TextAlign.center),
                      ),
                      Icon(Icons.ac_unit), //SizedBox()
                      Text('6',
                          style: _setResultStyle, textAlign: TextAlign.center),
                      Text('7',
                          style: _setResultStyle, textAlign: TextAlign.center),
                      Text('6',
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
                        child:
                            Text('Jesús / Luis', textAlign: TextAlign.center),
                      ),
                      Icon(Icons.ac_unit), //SizedBox()
                      Text('4',
                          style: _setResultStyle, textAlign: TextAlign.center),
                      Text('5',
                          style: _setResultStyle, textAlign: TextAlign.center),
                      Text('3',
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
