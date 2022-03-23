import 'package:flutter/cupertino.dart';

class MainScreenModel extends ChangeNotifier {
  int selectIndex = 0;
  String title = 'Character';

  void onSelect(int index) {
    selectIndex = index;
    print(selectIndex);
    notifyListeners();

    switch (index) {
      case 0:
        title = 'Character';
        notifyListeners();
        break;
      case 1:
        title = 'Location';
        notifyListeners();
        break;
      case 2:
        title = 'Episode';
        notifyListeners();
        break;
    }
  }
}
