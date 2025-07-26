import 'package:fam_chat/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseViewmodel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
