import 'package:flutter/material.dart';
import 'package:padel_diary/models/match_model.dart';
import 'package:padel_diary/providers/match_provider.dart';
import 'package:provider/provider.dart';

class MatchFormPage extends StatefulWidget {
  @override
  _MatchFormPageState createState() => _MatchFormPageState();
}

class _MatchFormPageState extends State<MatchFormPage> {
  final formKey = GlobalKey<FormState>();
  Match matchModel = Match();

  TextEditingController _dateController = new TextEditingController();

  double _effortSliderValue = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir nuevo partido'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                /*_inputTeamALeft(),
                _inputTeamARight(),
                _inputTeamAFirstSet(),
                _inputTeamASecondSet(),
                _inputTeamAThirdSet(),
                _inputTeamBLeft(),
                _inputTeamBRight(),
                _inputTeamBFirstSet(),
                _inputTeamBSecondSet(),
                _inputTeamBThirdSet(),*/
                //_inputClub(),
                //_inputTournament(),
                //_inputBall(),
                _dateInput(context),
                //_durationInput(),
                _temperatureInput(),
                _effortInput(),
                //_mvpInput(),
                _commentsInput(),
                SizedBox(height: 25.0),
                _submitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateInput(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _dateController,
      decoration: InputDecoration(hintText: 'Fecha', labelText: 'Fecha'),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final String pickedDate = picked.toString().split(' ')[0];
      final List<String> dateNumbers = pickedDate.split('-');
      final String dateToPrint =
          '${dateNumbers[2]}-${dateNumbers[1]}-${dateNumbers[0]}';
      setState(() {
        matchModel.date = picked.microsecondsSinceEpoch;
        _dateController.text = dateToPrint;
      });
    }
  }

  Widget _effortInput() {
    return Row(
      children: [
        Text('Esfuerzo'),
        Expanded(
          child: Slider(
            value: _effortSliderValue,
            min: 1.0,
            max: 10.0,
            label: _effortSliderValue.toInt().toString(),
            divisions: 9,
            onChanged: (value) {
              setState(() {
                _effortSliderValue = value;
                matchModel.effort = value.toInt();
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _temperatureInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Temperatura ºC'),
      onSaved: (value) => matchModel.temperature = int.tryParse(value),
    );
  }

  Widget _commentsInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        labelText: 'Comentarios',
        hintText:
            '¿Cómo te has encontrado? ¿Te has entendido bien con tu pareja? ¿La meteorología ha sido dura?',
      ),
      onSaved: (value) => matchModel.comments = value,
    );
  }

  Widget _submitButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.save),
      label: Text('Crear partido'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: _submit,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    final matchProvider = Provider.of<MatchProvider>(context, listen: false);
    matchProvider.createMatch(matchModel);

    formKey.currentState.reset();
    setState(() {
      matchModel = Match();
    });
  }
}
