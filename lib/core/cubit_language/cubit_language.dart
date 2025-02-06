import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super('en') {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('appLanguage') ?? 'en';
    emit(savedLanguage);
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (state == newLanguage) return;
    emit(newLanguage);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', newLanguage);
  }
}