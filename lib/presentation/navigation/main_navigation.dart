import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/character_body/character_filter/character_filter_page.dart';
import 'package:rick_and_morty/presentation/location_body/location_details/location_details_page.dart';

import '../character_body/character_details/character_details_page.dart';
import '../episode_body/episode_body_model.dart';
import '../episode_body/episode_details/episode_details_page.dart';

abstract class MainNavigationRouteNames {
  static const splashScreen = '/splash_screen';
  static const mainScreen = '/main_screen';
  static const characterFilter = '/filter_character';
  static const characterDetails = '/character_details';
  static const locationDetails = '/location_details';
  static const episodeDetails = '/episode_details';
}

class MainNavigation {
  String initialRoute() => MainNavigationRouteNames.mainScreen;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.characterFilter: (context) =>
        const CharacterFilterPage(),
    MainNavigationRouteNames.characterDetails: (context) =>
        const CharacterDetailsPage(),
    MainNavigationRouteNames.locationDetails: (context) =>
        const LocationDetailsPage(),
    MainNavigationRouteNames.episodeDetails: (context) =>
        ChangeNotifierProvider(
            create: (BuildContext context) => EpisodeBodyModel(),
            child: const EpisodeDetailsPage()),
  };
}
