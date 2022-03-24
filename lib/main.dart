import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/character_body/character_body_model.dart';
import 'package:rick_and_morty/presentation/episode_body/episode_body_model.dart';
import 'package:rick_and_morty/presentation/location_body/location_body_model.dart';
import 'package:rick_and_morty/presentation/main_screen/main_screen.dart';
import 'package:rick_and_morty/presentation/main_screen/main_screen_model.dart';
import 'package:rick_and_morty/presentation/navigation/main_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => MainScreenModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  CharacterBodyModel()..getAllCharacters()),
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  EpisodeBodyModel()..getEpisodes()),
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  LocationBodyModel()..getAllLocations()),
        ],
        child: const MainScreen(),
      ),
      routes: mainNavigation.routes,
    );
  }
}
