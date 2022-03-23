import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/data/models/episode_model.dart';

import '../../data/api_client/api_client.dart';
import '../../data/models/character_model.dart';

class EpisodeBodyModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final List<Episode> _episodes = [];
  final List<Character> _characters = [];
  int _currentPage = 0;
  late int _totalPage = 1;
  var _isLoadInProgress = false;

  get isLoadInProgress => _isLoadInProgress;

  List<Episode> get episodes => _episodes;
  List<Character> get characters => _characters;

  void getEpisodes() async {
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _episodes.clear();
    await _loadNextPage();
  }

  void charactersOnEpisode(List urlList, int index) async {
    _isLoadInProgress = true;
    print('list: ${urlList.length}');
    // if (index < urlList.length) return;

    await _apiClient.charactersInEpisode(urlList[0]).then((value) {
      _characters.add(value);
      print('start: ${_characters.length}');
      _isLoadInProgress = false;
      notifyListeners();
    });
  }

  Future<void> _loadNextPage() async {
    if (_isLoadInProgress || _currentPage >= _totalPage) return;
    _isLoadInProgress = true;
    final nextPage = _currentPage + 1;

    await _apiClient.getEpisodes(nextPage).then((episodeResponse) {
      _currentPage++;
      _totalPage = episodeResponse.info.pages;
      _episodes.addAll(episodeResponse.results);
      _isLoadInProgress = false;
      notifyListeners();
    });
  }

  void showEpisodeAtIndex(int index) {
    if (index < _episodes.length - 1) return;
    _loadNextPage();
  }
}
