import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/main_screen/main_screen_model.dart';

import '../character_body/character_body_widget.dart';
import '../episode_body/episode_body_widget.dart';
import '../location_body/location_body_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();

    return Scaffold(
      body: bodies[model.selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: model.selectIndex,
        onTap: model.onSelect,
        selectedItemColor: Color(0xff5856D6),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_character.png',
                color: model.selectIndex == 0 ? Color(0xff5856D6) : Colors.grey,
              ),
              label: 'Character'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_location.png',
                color: model.selectIndex == 1 ? Color(0xff5856D6) : Colors.grey,
              ),
              label: 'Location'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_episode.png',
                color: model.selectIndex == 2 ? Color(0xff5856D6) : Colors.grey,
              ),
              label: 'Episode'),
        ],
      ),
    );
  }

  List<Widget> bodies = [
    const CharacterBodyWidget(),
    const LocationBodyWidget(),
    const EpisodeBodyWidget(),
  ];
}
