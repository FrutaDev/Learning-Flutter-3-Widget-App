import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widget_app/config/app_theme.dart';

final StateProvider<bool> isDarkModeProvider = StateProvider((ref) => false);

final Provider<List<Color>> colorListProvider = Provider((ref) => colorList);

final StateProvider<int> selectedIndexColorProvider = StateProvider((ref) => 0);

final StateNotifierProvider<ThemeNotifier, AppTheme> themeNotifierProvider =
    StateNotifierProvider((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleThemeMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeSelectedTheme(int indexColor) {
    state = state.copyWith(selectedColor: indexColor);
  }
}
