import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/data/models/episode_model.dart';
import 'package:rick_and_morty/data/models/location_model.dart';

class ApiClient {
  final String _baseUrl = 'https://rickandmortyapi.com/api';

  Future<CharacterModel> getAllCharacters(int page) async {
    final url = Uri.parse('$_baseUrl/character/?page=$page');
    final response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    final result = CharacterModel.fromMap(map);
    return result;
  }

  Future<Character> charactersInEpisode(String uri) async {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    print(response.body);
    final result = Character.fromMap(map);
    return result;
  }

  Future<EpisodeModel> getEpisodes(int page) async {
    final url = Uri.parse('$_baseUrl/episode/?page=$page');
    final response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    final result = EpisodeModel.fromMap(map);
    return result;
  }

  Future<LocationModel> getLocations(int page) async {
    final url = Uri.parse('$_baseUrl/location/?page=$page');
    final response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    final result = LocationModel.fromMap(map);
    return result;
  }
}
