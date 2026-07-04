import 'package:flutter/material.dart';

/// Tracks the currently selected navigation destination and whether the
/// mobile drawer is open, so the nav bar / drawer / rail can all stay
/// in sync with the active go_router route.
class NavProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void select(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }
}
