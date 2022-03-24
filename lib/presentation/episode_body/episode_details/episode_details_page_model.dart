import 'package:flutter/cupertino.dart';

import '../../../data/api_client/api_client.dart';
import '../../../data/models/character_model.dart';

class EpisodeDetailsPageModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final List<Character> _characters = [];
  var _isLoadInProgress = false;

  get isLoadInProgress => _isLoadInProgress;

  List<Character> get characters => _characters;

  void charactersOnEpisode(List uri) async {
    _isLoadInProgress = true;
    // notifyListeners();
    uri.map((e) async => await _apiClient.charactersInEpisode(e).then((value) {
          _characters.add(value);
          _isLoadInProgress = false;
          notifyListeners();
        }));
    /* for (int i = 0; i < length; i++) {
      print('i: $i');

    }*/
  }
}
