import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/generated/l10n.dart';
import 'package:weather_you_like_it/resources/routes_manager.dart';
import 'package:weather_you_like_it/resources/theme_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(
    ProviderScope(
      child: initAppModule(),
    ),
  );
}

Widget initAppModule() {
  final routesManager = instanceGetIt.get<RoutesManager>();
  return MaterialApp.router(
    theme: ThemeManager.getApplicationTheme(),
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    debugShowCheckedModeBanner: false,
    routerConfig: routesManager.router,
  );
}
