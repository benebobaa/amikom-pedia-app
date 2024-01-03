// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:amikompedia_app/core/error/exception.dart';
import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/data/data_sources/local_data_sources/weather_local_data_source.dart';
import 'package:amikompedia_app/data/data_sources/remote_data_sources/weather_remote_data_source.dart';
import 'package:amikompedia_app/domain/entities/forecast_entity.dart';
import 'package:amikompedia_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, ForecastEntity>> getForecastByName(String name) async {
    try {
      final result = await remoteDataSource.getForecastByName(name);
      return Right(result.toEntity());
    } on BadRequestException {
      return const Left(NotFoundFailure('City not found'));
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while getting weather data'));
    } on TimeoutException {
      return const Left(
          ConnectionFailure('Timeout, failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ForecastEntity>> getForecastByPosition(
      double lat, double lon) async {
    try {
      final result = await remoteDataSource.getForecastByPosition(lat, lon);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while getting weather data'));
    } on TimeoutException {
      return const Left(
          ConnectionFailure('Timeout, failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheRecentLocations(
      String key, List<String> locations) async {
    try {
      await localDataSource.cacheRecentLocations(key, locations);
      return const Right(null);
    } on LocalDatabaseException {
      return const Left(
          DatabaseFailure('An error occurred while caching data'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getRecentLocations(String key) async {
    try {
      final result = await localDataSource.getRecentLocations(key);
      return Right(result);
    } on LocalDatabaseException {
      return const Left(
          DatabaseFailure('An error occurred while getting data'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheForecastData(
      String key, List<ForecastWeatherEntity> data) async {
    try {
      await localDataSource.cacheForecastData(
          key, data.map((e) => e.toModel()).toList());
      return const Right(null);
    } on LocalDatabaseException {
      return const Left(
          DatabaseFailure('An error occurred while caching data'));
    }
  }

  @override
  Future<Either<Failure, String>> getCacheCityName() async {
    try {
      final result = await localDataSource.getCacheCityName();
      return Right(result);
    } on LocalDatabaseException {
      return const Left(
          DatabaseFailure('An error occurred while getting data'));
    }
  }

  @override
  Future<Either<Failure, List<ForecastWeatherEntity>>> getCacheForecastData(
      String key) async {
    try {
      final result = await localDataSource.getCacheForecastData(key);
      List<ForecastWeatherEntity> resultEntity =
          result.map((e) => e.toEntity()).toList();
      return Right(resultEntity);
    } on LocalDatabaseException {
      return const Left(
          DatabaseFailure('An error occurred while getting data'));
    }
  }
}
