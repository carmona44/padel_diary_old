import 'package:flutter/material.dart';
import 'package:padel_diary/pages/matches_page.dart';
import 'package:padel_diary/pages/my_data_page.dart';
import 'package:padel_diary/providers/match_provider.dart';
//import 'package:padel_diary/pages/rankings_page.dart';
//import 'package:padel_diary/pages/stats_page.dart';
import 'package:padel_diary/providers/player_provider.dart';
import 'package:padel_diary/providers/ui_provider.dart';
import 'package:padel_diary/widgets/add_floating_button.dart';
import 'package:padel_diary/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diario de pádel'),
        centerTitle: true,
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: AddFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final _selectedTabIndex = uiProvider.selectedTabIndex;

    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    playerProvider.getAllPlayers();
    final matchProvider = Provider.of<MatchProvider>(context, listen: false);
    matchProvider.getAllMatches();

    switch (_selectedTabIndex) {
      case 0:
        return MyDataPage();
        break;

      case 1:
        return MatchesPage();
        break;

      /*case 2:
        return StatsPage();
        break;

      case 3:
        return RankingsPage();
        break;*/

      default:
        return MatchesPage();
    }
  }
}
