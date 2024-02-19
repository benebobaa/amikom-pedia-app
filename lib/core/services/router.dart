import 'package:amikompedia_app/presentation/module/otp/otp_page.dart';
import 'package:amikompedia_app/presentation/module/otp/otp_success_page.dart';
import 'package:amikompedia_app/presentation/module/otp/widgets/otp_form_lib.dart';
import 'package:amikompedia_app/presentation/module/stepper/stepper_one_page.dart';
import 'package:amikompedia_app/presentation/module/stepper/stepper_three_page.dart';
import 'package:amikompedia_app/presentation/module/stepper/stepper_two_page.dart';
import 'package:amikompedia_app/presentation/module/login/login_page.dart';
import 'package:amikompedia_app/presentation/module/register/register_page.dart';
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

    //stepper one
    case StepperOnePage.routeName:
      return _pageBuilder((_) => const StepperOnePage(), settings: settings);

    //stepper two
    case StepperTwoPage.routeName:
      return _pageBuilder((_) => StepperTwoPage(), settings: settings);

    //stepper three
    case StepperThreePage.routeName:
      return _pageBuilder((_) => StepperThreePage(), settings: settings);

    case PinCodeVerificationScreen.routeName:
      return _pageBuilder((_) => PinCodeVerificationScreen(),
          settings: settings);

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
