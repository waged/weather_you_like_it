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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Stay Updated, Anytime, Anywhere`
  String get onBoardingTitle1 {
    return Intl.message(
      'Stay Updated, Anytime, Anywhere',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Get real-time weather updates for your favorite locations at your fingertips.`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Get real-time weather updates for your favorite locations at your fingertips.',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Seamless Access to Weather Data`
  String get onBoardingTitle2 {
    return Intl.message(
      'Seamless Access to Weather Data',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Switch effortlessly between cities or use your current location to get accurate weather details instantly.`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'Switch effortlessly between cities or use your current location to get accurate weather details instantly.',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Never Miss a Weather Update`
  String get onBoardingTitle3 {
    return Intl.message(
      'Never Miss a Weather Update',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Even offline, view the last updated weather data and stay prepared for any weather condition.`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'Even offline, view the last updated weather data and stay prepared for any weather condition.',
      name: 'onBoardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Your Personalized Weather Companion`
  String get onBoardingTitle4 {
    return Intl.message(
      'Your Personalized Weather Companion',
      name: 'onBoardingTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Customize your weather experience with a sleek design and features tailored to your needs.`
  String get onBoardingSubTitle4 {
    return Intl.message(
      'Customize your weather experience with a sleek design and features tailored to your needs.',
      name: 'onBoardingSubTitle4',
      desc: '',
      args: [],
    );
  }

  /// `No data available. Please check your connection.`
  String get noDataFound {
    return Intl.message(
      'No data available. Please check your connection.',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
