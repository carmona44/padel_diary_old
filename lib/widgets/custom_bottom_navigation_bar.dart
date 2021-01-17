import 'package:flutter/material.dart';
import 'package:padel_diary/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final _currentIndex = uiProvider.selectedTabIndex;

    return SizedBox(
      height: 75.0,
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_baseball),
            label: 'Partidos',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            label: 'Estadísticas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Rankings',
          ),*/
        ],
        onTap: (int tabIndex) => uiProvider.selectedTabIndex = tabIndex,
      ),
    );
  }
}
