import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/api_client/api_client.dart';

import '../../data/models/location_model.dart';

class LocationBodyModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  List<Location> _locations = [];
  int _currentPage = 0;
  late int _totalPage = 1;
  var _isLoadInProgress = false;

  get isLoadInProgress => _isLoadInProgress;

  List<Location> get locations => _locations;

  void getAllLocations() async {
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _locations.clear();
    await _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    if (_isLoadInProgress || _currentPage >= _totalPage) return;
    _isLoadInProgress = true;
    final nextPage = _currentPage + 1;

    await _apiClient.getLocations(nextPage).then((locationResponse) {
      _currentPage++;
      _totalPage = locationResponse.info.pages;
      _locations.addAll(locationResponse.results);
      _isLoadInProgress = false;
      notifyListeners();
    });
  }

  void showMovieAtIndex(int index) {
    if (index < _locations.length - 1) return;
    _loadNextPage();
  }
}
