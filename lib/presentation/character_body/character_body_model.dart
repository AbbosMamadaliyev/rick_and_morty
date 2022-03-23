import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/api_client/api_client.dart';
import 'package:rick_and_morty/data/models/character_model.dart';

// jami personaj soni: 826
// pagelar soni: 42
// xar bitta listda: 20  , oxirgi listda 42-listda 6 ta, shunda jami 826
class CharacterBodyModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  List<Character> _characters = [];
  int _currentPage = 0;
  late int _totalPage = 1;
  var _isLoadInProgress = false;

  get isLoadInProgress => _isLoadInProgress;

  List<Character> get characters => _characters;

  void getAllCharacters() async {
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _characters.clear();
    await _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    if (_isLoadInProgress || _currentPage >= _totalPage) return;
    _isLoadInProgress = true;
    final nextPage = _currentPage + 1;

    await _apiClient.getAllCharacters(nextPage).then((characterResponse) {
      _currentPage++;
      _totalPage = characterResponse.info.pages;
      _characters.addAll(characterResponse.results);
      _isLoadInProgress = false;
      print('total page: $_totalPage');
      print('current page: $_currentPage');
      notifyListeners();
    });
  }

  void showMovieAtIndex(int index) {
    if (index < _characters.length - 1) return;
    _loadNextPage();
  }
}
