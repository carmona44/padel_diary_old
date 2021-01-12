import 'package:flutter/material.dart';
import 'package:padel_diary/models/player_model.dart';

class PlayerFormPage extends StatefulWidget {
  @override
  _PlayerFormPageState createState() => _PlayerFormPageState();
}

class _PlayerFormPageState extends State<PlayerFormPage> {
  final formKey = GlobalKey<FormState>();
  Player playerModel = Player();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                _levelInput(),
                _dominantHandInput(),
                _avatarInput(),
                _countryInput(),
                _regionInput(),
                _favouriteHitInput(),
                _racketInput(),
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
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nivel'),
      onSaved: (value) => playerModel.level = int.tryParse(value),
    );
  }

  Widget _dominantHandInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Mano dominante'),
      onSaved: (value) => playerModel.dominantHand = value,
    );
  }

  Widget _avatarInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Avatar'),
      onSaved: (value) => playerModel.avatar = value,
    );
  }

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
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Golpe estrella'),
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
      onPressed: _submit,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    print(playerModel.name);
    print(playerModel.surname);
    print(playerModel.position);
    print(playerModel.age);
  }
}
