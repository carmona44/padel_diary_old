import 'package:flutter/material.dart';
import 'package:padel_diary/widgets/add_floating_button.dart';
import 'package:padel_diary/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diario de pádel'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Home page'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: AddFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
