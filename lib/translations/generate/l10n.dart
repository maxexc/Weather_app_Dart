// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class IntlLocate {
  IntlLocate();

  static IntlLocate? _current;

  static IntlLocate get current {
    assert(_current != null,
        'No instance of IntlLocate was loaded. Try to initialize the IntlLocate delegate before accessing IntlLocate.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<IntlLocate> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = IntlLocate();
      IntlLocate._current = instance;

      return instance;
    });
  }

  static IntlLocate of(BuildContext context) {
    final instance = IntlLocate.maybeOf(context);
    assert(instance != null,
        'No instance of IntlLocate present in the widget tree. Did you add IntlLocate.delegate in localizationsDelegates?');
    return instance!;
  }

  static IntlLocate? maybeOf(BuildContext context) {
    return Localizations.of<IntlLocate>(context, IntlLocate);
  }

  /// `Enter the city`
  String get enterTheCity {
    return Intl.message(
      'Enter the city',
      name: 'enterTheCity',
      desc: '',
      args: [],
    );
  }

  /// `You will need 🧣 and 🧤 in`
  String get describeWeather {
    return Intl.message(
      'You will need 🧣 and 🧤 in',
      name: 'describeWeather',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<IntlLocate> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<IntlLocate> load(Locale locale) => IntlLocate.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
