import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDarkMode: false)) {
    _loadTheme();
  }

  static const String _themeKey = 'theme_mode';

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool(_themeKey) ?? false;
      emit(ThemeState(isDarkMode: isDarkMode));
    } catch (e) {
      // Если ошибка, используем тему по умолчанию
      emit(ThemeState(isDarkMode: false));
    }
  }

  Future<void> toggleTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final newMode = !state.isDarkMode;
      await prefs.setBool(_themeKey, newMode);
      emit(ThemeState(isDarkMode: newMode));
    } catch (e) {
      // Если ошибка, все равно меняем тему
      emit(ThemeState(isDarkMode: !state.isDarkMode));
    }
  }

  Future<void> setTheme(bool isDarkMode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, isDarkMode);
      emit(ThemeState(isDarkMode: isDarkMode));
    } catch (e) {
      emit(ThemeState(isDarkMode: isDarkMode));
    }
  }
}