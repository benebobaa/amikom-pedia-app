import 'package:dartz/dartz.dart';
import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/domain/entities/forecast_entity.dart';

abstract class WeatherRepository {
  
  Future<Either<Failure, ForecastEntity>> getForecastByPosition(
      double lat, double lon);
  Future<Either<Failure, ForecastEntity>> getForecastByName(String name);

  //local

  Future<Either<Failure,void>> cacheRecentLocations(String key, List<String> locations);
  Future<Either<Failure,List<String>>> getRecentLocations(String key);

  Future<Either<Failure,void>> cacheForecastData(String key, List<ForecastWeatherEntity> data);
  Future<Either<Failure,List<ForecastWeatherEntity>>> getCacheForecastData(String key);
  Future<Either<Failure,String>> getCacheCityName();
}
