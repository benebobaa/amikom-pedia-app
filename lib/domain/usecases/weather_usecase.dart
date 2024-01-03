

import 'package:dartz/dartz.dart';
import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/domain/entities/forecast_entity.dart';
import 'package:amikompedia_app/domain/repositories/weather_repository.dart';

class WeatherUsecase{
  final WeatherRepository _repository;

  WeatherUsecase(this._repository);

  Future<Either<Failure, ForecastEntity>> getForecastByPosition(double lat, double lon) async {
    return await _repository.getForecastByPosition(lat, lon);
  }

  Future<Either<Failure, ForecastEntity>> getForecastByName(String name) async {
    return await _repository.getForecastByName(name);
  }

  Future<Either<Failure,void>> cacheRecentLocations(String key, List<String> locations) async {
    return await _repository.cacheRecentLocations(key, locations);
  }

  Future<Either<Failure,List<String>>> getRecentLocations(String key) async {
    return await _repository.getRecentLocations(key);
  }

  Future<Either<Failure,void>> cacheForecastData(String key, List<ForecastWeatherEntity> data) async {
    return await _repository.cacheForecastData(key, data);
  }

  Future<Either<Failure,List<ForecastWeatherEntity>>> getCacheForecastData(String key) async {
    return await _repository.getCacheForecastData(key);
  }

  Future<Either<Failure,String>> getCacheCityName() async {
    return await _repository.getCacheCityName();
  }
}