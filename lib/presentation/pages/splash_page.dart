import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_event.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_state.dart';
import 'package:amikompedia_app/presentation/pages/weather_page.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = '/';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<SplashBloc>().add(OnGetLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.deepPurple,
            Colors.blue,
            Colors.lightBlue,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SplashLocationDenied) {
                showAdaptiveDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Permission Denied'),
                    content: const Text('Allow access to the location service'),
                    actions: [
                      TextButton(
                        onPressed: () => SystemNavigator.pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => openAppSettings(),
                        child: const Text('Settings'),
                      ),
                    ],
                  ),
                );
              }
              if (state is SplashLoaded) {
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    WeatherPage.routeName,
                    arguments: state.result,
                    (route) => false);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(MediaRes.aniSplashPage),
                const Text('Jojo Weather',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
