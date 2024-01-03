// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_state.dart';
import 'package:amikompedia_app/presentation/widgets/daily_forecast_item.dart';
import 'package:amikompedia_app/presentation/widgets/hourly_forecast_item.dart';
import 'package:amikompedia_app/presentation/widgets/main_top_section.dart';
import 'package:amikompedia_app/presentation/widgets/not_found_search.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({
    Key? key,
    required this.position,
  }) : super(key: key);

  final Position position;

  static const routeName = '/weather';

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    context.read<WeatherBloc>().add(OnForecastByPosition(
        lat: widget.position.latitude, lon: widget.position.longitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
          if (state is WeatherLoaded) {
            context.read<WeatherBloc>().add(OnCacheForecast());
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherNotFound || state is WeatherError) {
            return const CityNotFound();
          }
          if (state is WeatherLoaded) {
            return Column(
              children: [
                MainTopSection(
                    cityName: state.cityName,
                    weatherEntity: state.data[state.selectedIndex].first),
                Expanded(
                  child: Container(
                    color: Colors.grey.withOpacity(0.08),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Text(
                              'DAILY FORECAST',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: screenH * 0.19,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              return DailyForecastItem(
                                data: state.data[index].first,
                                index: index,
                                selectedIndex: state.selectedIndex,
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Text(
                            'HOURLY FORECAST',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            height: screenH * 0.15,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.data[state.selectedIndex].length,
                              itemBuilder: (context, index) {
                                return HourlyForecastItem(
                                    forecast: state.data[state.selectedIndex]
                                        [index]);
                              },
                            ))
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
