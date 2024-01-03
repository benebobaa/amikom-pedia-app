import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:amikompedia_app/core/constants/media_res.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaRes.bgUnderConstruction),
            fit: BoxFit.cover,
          ),
        ),
        child: Lottie.asset(MediaRes.aniUnderConstruction),
      ),
    );
  }
}
