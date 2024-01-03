import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:amikompedia_app/presentation/pages/search_page.dart';

class CityNotFound extends StatelessWidget {
  const CityNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('city not found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        Lottie.asset(MediaRes.aniNotFound),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              side: const BorderSide(color: Colors.blueAccent),
            ),
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            child: const Text('Back to search')),
      ],
    );
  }
}
