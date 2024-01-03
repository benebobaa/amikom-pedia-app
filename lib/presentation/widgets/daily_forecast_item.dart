// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amikompedia_app/core/constants/constants.dart';
import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:amikompedia_app/core/extension/get_dayname_date.dart';

import 'package:amikompedia_app/domain/entities/forecast_entity.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_event.dart';

class DailyForecastItem extends StatelessWidget {
  const DailyForecastItem({
    Key? key,
    required this.data,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  final ForecastWeatherEntity data;
  final int index;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        context.read<WeatherBloc>().add(OnChangeSelectDay(index: index));
      },
      child: Container(
        width: screenW * 0.25,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: index == selectedIndex ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(data.dateTxt.dayName,
                style: const TextStyle(color: Colors.grey)),
            SizedBox(
              height: screenH * 0.08,
              width: screenW * 0.17,
              child: FadeInImage.assetNetwork(
                  placeholder: MediaRes.placeholderImageGif,
                  image: Urls.weatherIcon(data.iconCode)),

              // Image.network(
              //   'http://openweathermap.org/img/wn/${data.iconCode}@2x.png',
              //   fit: BoxFit.cover,
              // ),
            ),
            Text(data.main),
          ],
        ),
      ),
    );
  }
}
