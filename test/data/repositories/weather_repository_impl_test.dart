import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:amikompedia_app/data/repositories/weather_repository_impl.dart';

import '../../helpers/constants/test_weather_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockWeatherLocalDataSource mockWeatherLocalDataSource;
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockWeatherLocalDataSource = MockWeatherLocalDataSource();
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(
        localDataSource: mockWeatherLocalDataSource,
        remoteDataSource: mockWeatherRemoteDataSource);
  });

  group('api calls get forecast weather', () {
    test(
        'should return current forecast weather when a call to data source is successful [getForecastByPosition]]',
        () async {
      //arrange
      when(mockWeatherRemoteDataSource.getForecastByPosition(0, 0))
          .thenAnswer((_) async => testForecastModel);

      //act
      final result = await weatherRepositoryImpl.getForecastByPosition(0, 0);

      //assert
      expect(result, equals(const Right(testForecastEntity)));
    });

    test(
        'should return current forecast weather when a call to data source is successful [getForecastByName]',
        () async {
      //arrange
      when(mockWeatherRemoteDataSource.getForecastByName(testCityName))
          .thenAnswer((_) async => testForecastModel);

      //act
      final result =
          await weatherRepositoryImpl.getForecastByName(testCityName);

      //assert
      expect(result, equals(const Right(testForecastEntity)));
    });
  });

  // group('cache forecast data', () async {
  test(
      'should return cache forecast weather data when a call to data source is successful and data not empty',
      () async {
    //arrange
    when(mockWeatherLocalDataSource.getCacheForecastData(testCityName))
        .thenAnswer((_) async => testListForecastModel);

    //act
    final result =
        await weatherRepositoryImpl.getCacheForecastData(testCityName);

    //assert
    expect(result, equals(const Right(testListForecastEntity)));
  });

  test('should return null when success cache forecast data', () async {
    //arrange
    when(mockWeatherLocalDataSource.cacheForecastData(
            testCityName, testListForecastModel))
        .thenAnswer((_) async {});

    //act
    final result = await weatherRepositoryImpl.cacheForecastData(
        testCityName, testListForecastEntity);

    //assert
    expect(result, equals(const Right(null)));
  });
  // });
}
