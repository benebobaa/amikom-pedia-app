import 'package:amikompedia_app/presentation/pages/login_page.dart';
import 'package:amikompedia_app/presentation/pages/otp_page.dart';
import 'package:amikompedia_app/presentation/pages/otp_success_page.dart';
import 'package:amikompedia_app/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:amikompedia_app/core/pages/under_construction_page.dart';
import 'package:amikompedia_app/presentation/pages/search_page.dart';
import 'package:amikompedia_app/presentation/pages/splash_page.dart';
import 'package:amikompedia_app/presentation/pages/weather_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    //splash
    case SplashPage.routeName:
      return _pageBuilder((_) => const SplashPage(), settings: settings);
    //weather
    case WeatherPage.routeName:
      return _pageBuilder((_) => WeatherPage(position: args as Position),
          settings: settings);
    //search
    case SearchPage.routeName:
      return _pageBuilder((_) => const SearchPage(), settings: settings);

    //login
    case LoginPage.routeName:
      return _pageBuilder((_) => LoginPage(), settings: settings);

    //register
    case RegisterPage.routeName:
      return _pageBuilder((_) => RegisterPage(), settings: settings);

    //otp
    case OtpPage.routeName:
      return _pageBuilder((_) => const OtpPage(), settings: settings);

    //otp success
    case OtpSuccessPage.routeName:
      return _pageBuilder((_) => const OtpSuccessPage(), settings: settings);

    default:
      return _pageBuilder(
        (_) => const UnderConstructionPage(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
