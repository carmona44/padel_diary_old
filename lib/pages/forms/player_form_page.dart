import 'package:flutter/material.dart';
import 'package:padel_diary/models/player_model.dart';
import 'package:padel_diary/providers/player_provider.dart';
import 'package:provider/provider.dart';

class PlayerFormPage extends StatefulWidget {
  @override
  _PlayerFormPageState createState() => _PlayerFormPageState();
}

class _PlayerFormPageState extends State<PlayerFormPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Player playerModel = Player();
  bool _saving = false;
  double _sliderValue = 5.0;
  int _dominantHand = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Añadir jugador'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _nameInput(),
                _surnameInput(),
                _positionInput(),
                _ageInput(),
                //_avatarInput(),
                _countryInput(),
                _regionInput(),
                _favouriteHitInput(),
                _racketInput(),
                _levelInput(),
                _dominantHandInput(),
                SizedBox(height: 25.0),
                _submitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      validator: (value) =>
          value.length < 1 ? 'El nombre del jugador es obligatorio' : null,
      onSaved: (value) => playerModel.name = value,
    );
  }

  Widget _surnameInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellidos'),
      onSaved: (value) => playerModel.surname = value,
    );
  }

  Widget _positionInput() {
    final _dropdownItems = [
      DropdownMenuItem(
        child: Text('Revés / Izquierda'),
        value: 'Revés / Izquierda',
      ),
      DropdownMenuItem(
        child: Text('Drive / Derecha'),
        value: 'Drive / Derecha',
      )
    ];
    return DropdownButtonFormField(
      hint: Text('Posición preferida'),
      items: _dropdownItems,
      onChanged: (value) => setState(() {
        playerModel.position = value;
      }),
      onSaved: (value) => playerModel.position = value,
    );
  }

  Widget _ageInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => playerModel.age = int.tryParse(value),
    );
  }

  Widget _levelInput() {
    final _labels = ['PRO', '1ª', '2ª', '3ª', '4ª', '5ª'];

    return Row(
      children: [
        Text('Nivel'),
        Expanded(
          child: Slider(
            value: _sliderValue,
            min: 0.0,
            max: 5.0,
            divisions: 5,
            label: _labels[_sliderValue.toInt()],
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
                playerModel.level = value.toInt();
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _dominantHandInput() {
    final _leftOption = Radio(
      value: 1,
      groupValue: _dominantHand,
      onChanged: (value) {
        setState(() {
          _dominantHand = value;
          playerModel.dominantHand = 'zurdo';
        });
      },
    );

    final _rightOption = Radio(
      value: 2,
      groupValue: _dominantHand,
      onChanged: (value) {
        setState(() {
          _dominantHand = value;
          playerModel.dominantHand = 'diestro';
        });
      },
    );

    return Row(
      children: [
        _leftOption,
        Text('Zurdo'),
        _rightOption,
        Text('Diestro'),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  /*Widget _avatarInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Avatar'),
      onSaved: (value) => playerModel.avatar = value,
    );
  }*/

  Widget _countryInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'País'),
      onSaved: (value) => playerModel.country = value,
    );
  }

  Widget _regionInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Región'),
      onSaved: (value) => playerModel.region = value,
    );
  }

  Widget _favouriteHitInput() {
    final _hits = ['Volea', 'Bandeja', 'Smash', 'Derecha', 'Revés', 'Saque'];
    List<DropdownMenuItem> _dropdownItems = [];

    _hits.forEach((hit) {
      final _dropDownItem = DropdownMenuItem(
        child: Text(hit),
        value: hit,
      );
      _dropdownItems.add(_dropDownItem);
    });

    return DropdownButtonFormField(
      hint: Text('Golpe estrella'),
      items: _dropdownItems,
      onChanged: (value) => setState(() {
        playerModel.favouriteHit = value;
      }),
      onSaved: (value) => playerModel.favouriteHit = value,
    );
  }

  Widget _racketInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Pala'),
      onSaved: (value) => playerModel.racket = value,
    );
  }

  Widget _submitButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.save),
      label: Text('Crear jugador'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: _saving ? null : _submit,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    setState(() {
      if (playerModel.level == null) playerModel.level = 5;
      _saving = true;
    });
    formKey.currentState.save();

    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    playerProvider.createPlayer(playerModel);

    formKey.currentState.reset();
    showSnackbar('Jugador creado con éxito');

    setState(() {
      _saving = false;
      playerModel = Player();
    });
  }

  void showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 3000),
      backgroundColor: Colors.green,
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
