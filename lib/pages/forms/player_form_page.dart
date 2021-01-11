import 'package:flutter/material.dart';

class PlayerFormPage extends StatelessWidget {
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
                _favouriteHintInput(),
                _racketInput(),
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
    );
  }

  Widget _surnameInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellidos'),
    );
  }

  Widget _positionInput() {
    final _dropdownItems = [
      DropdownMenuItem(child: Text('Revés / Izquierda')),
      DropdownMenuItem(child: Text('Drive / Derecha'))
    ];

    return DropdownButtonFormField(
      value: 0,
      items: _dropdownItems,
      onChanged: (value) => {},
    );
  }

  Widget _ageInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Edad'),
    );
  }

  Widget _levelInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nivel'),
    );
  }

  Widget _dominantHandInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Mano dominante'),
    );
  }

  Widget _avatarInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Avatar'),
    );
  }

  Widget _countryInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'País'),
    );
  }

  Widget _regionInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Región'),
    );
  }

  Widget _favouriteHintInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Golpe estrella'),
    );
  }

  Widget _racketInput() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Pala'),
    );
  }

  Widget _submitButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.save),
      label: Text('Crear jugador'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: () {},
    );
  }
}
