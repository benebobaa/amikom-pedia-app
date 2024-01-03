// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:amikompedia_app/domain/entities/forecast_entity.dart';

import 'package:amikompedia_app/presentation/pages/search_page.dart';

class MainTopSection extends StatelessWidget {
  const MainTopSection({
    Key? key,
    required this.cityName,
    required this.weatherEntity,
  }) : super(key: key);

  final String cityName;
  final ForecastWeatherEntity weatherEntity;
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepPurpleAccent, Colors.blue, Colors.lightBlue],
        ),
      ),
      height: screenH * 0.4,
      child: Padding(
        padding: EdgeInsets.only(top: screenH * 0.04, left: screenH * 0.02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cityName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14 * screenH / screenW,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchPage.routeName);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                      child: Text(
                        '${weatherEntity.temperature.toInt()}°C',
                        style: const TextStyle(
                          height: 0.77,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Text(
                    //   '18°C',
                    //   style: TextStyle(
                    //       fontSize: 20 * screenH / screenW,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    Text(
                      weatherEntity.main,
                      style: TextStyle(
                          fontSize: 20 * screenH / screenW,
                          color: Colors.white),
                    ),
                    SizedBox(height: screenH * 0.02),
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        Text(
                          '${weatherEntity.tempMin.toInt()}',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(width: screenW * 0.02),
                        const Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                        Text(
                          '${weatherEntity.tempMax.toInt()}',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                    height: screenH * 0.25,
                    width: screenW * 0.45,
                    child: FadeInImage.assetNetwork(
                        placeholder: MediaRes.placeholderImagePng,
                        image:
                            'http://openweathermap.org/img/wn/${weatherEntity.iconCode}@4x.png')
                    // Image.network(
                    //   'http://openweathermap.org/img/wn/${weatherEntity.iconCode}@4x.png',
                    //   fit: BoxFit.cover,
                    // ),
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
