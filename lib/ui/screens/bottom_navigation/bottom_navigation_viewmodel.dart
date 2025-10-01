import 'package:fam_chat/core/other/base_viewmodel.dart';

class BottomNavigationViewmodel extends BaseViewmodel {
  int _currentIndex = 1;

  int get currentIndex => _currentIndex;

  void onTap(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
