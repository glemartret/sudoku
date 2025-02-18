import 'package:i18n_extension/i18n_extension.dart';
import 'package:sudoku/src/localization/i18n.dart';
// ignore_for_file: lines_longer_than_80_chars

// Search Strings without .i18n '(?!\.i18n)[\n\w\d\s.]*?'(?!\.i18n)(?!\n\.i18n)
extension SettingsLocalization on String {
  static final _t = Translations.byText('en') +
      {
        'en': 'Settings',
        'fr': 'Réglages',
      } +
      {
        'en': 'System Theme',
        'fr': 'Thème du système',
      } +
      {
        'en': 'Light Theme',
        'fr': 'Thème clair',
      } +
      {
        'en': 'Dark Theme',
        'fr': 'Thème sombre',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      };

  static Translations get translations => RunnerLocalization.translations * _t;

  String get i18n => localize(this, translations);
  String fill(List<Object> params) => localizeFill(i18n, params);
  String plural(int value) => localizePlural(value, this, translations);
}
