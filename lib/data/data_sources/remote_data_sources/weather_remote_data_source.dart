import 'dart:convert';

import 'package:amikompedia_app/core/constants/constants.dart';
import 'package:amikompedia_app/core/error/exception.dart';
import 'package:amikompedia_app/data/models/forecast_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  
  Future<ForecastModel> getForecastByPosition(double lat, double lon);
  Future<ForecastModel> getForecastByName(String name);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;
  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<ForecastModel> getForecastByName(String name) async {
    final response =
        await client.get(Uri.parse(Urls.currentForecastByName(name))).timeout(
              const Duration(seconds: 5),
              onTimeout: () => throw TimeoutException(),
            );

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(jsonDecode(response.body));
    }
    if (response.statusCode == 404) {
      throw BadRequestException();
    }
    throw ServerException();
  }

  @override
  Future<ForecastModel> getForecastByPosition(double lat, double lon) async {
    final response = await client
        .get(Uri.parse(Urls.currentForecastByPosition(lat, lon)))
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException(),
        );

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(jsonDecode(response.body));
    }

    throw ServerException();
  }
}
