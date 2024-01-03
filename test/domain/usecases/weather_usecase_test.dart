import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:amikompedia_app/domain/usecases/weather_usecase.dart';

import '../../helpers/constants/test_weather_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late WeatherUsecase weatherUsecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    weatherUsecase = WeatherUsecase(mockWeatherRepository);
  });

  const tKey = 'jakarta';
  const tListValue = ['jakarta', 'bandung'];
  test(
      'should get forecast weather data from repository [getForecastByPosition]',
      () async {
    //arrange
    when(mockWeatherRepository.getForecastByPosition(0, 0))
        .thenAnswer((_) async => Right(testForecastModel));

    //act
    final result = await weatherUsecase.getForecastByPosition(0, 0);

    //assert
    expect(result, Right(testForecastModel));
  });

  test('should get forecast weather data from repository [getForecastByName]',
      () async {
    //arrange
    when(mockWeatherRepository.getForecastByName(testCityName))
        .thenAnswer((_) async => Right(testForecastModel));

    //act
    final result = await weatherUsecase.getForecastByName(testCityName);

    //assert
    expect(result, Right(testForecastModel));
  });

  test('should get first cache city name from repository [getCacheCityName]',
      () async {
    //arrange
    when(mockWeatherRepository.getCacheCityName())
        .thenAnswer((_) async => const Right(testCityName));

    //act
    final result = await weatherUsecase.getCacheCityName();

    //assert
    expect(result, const Right(testCityName));
  });

  test('should cache recent locations and return [null]', () async {
    //arrange
    when(mockWeatherRepository.cacheRecentLocations(tKey, tListValue))
        .thenAnswer((_) async => const Right(null));

    //act
    final result = await weatherUsecase.cacheRecentLocations(tKey, tListValue);

    //assert
    expect(result, const Right(null));
  });

  test('should get cache recent locations return [List<String>]', () async {
    //arrange
    when(mockWeatherRepository.getRecentLocations(tKey))
        .thenAnswer((_) async => const Right(tListValue));

    //act
    final result = await weatherUsecase.getRecentLocations(tKey);

    //assert
    expect(result, const Right(tListValue));
  });

  test('should cache forecast data and return [null]', () async {
    //arrange
    when(mockWeatherRepository.cacheForecastData(tKey, testForecastModel.list))
        .thenAnswer((_) async => const Right(null));

    //act
    final result =
        await weatherUsecase.cacheForecastData(tKey, testForecastModel.list);

    //assert
    expect(result, const Right(null));
  });

  test(
      'should get cache forecast data and return [List<ForecastWeatherEntity>]',
      () async {
    //arrange
    when(mockWeatherRepository.getCacheForecastData(tKey))
        .thenAnswer((_) async => Right(testForecastModel.list));

    //act
    final result = await weatherUsecase.getCacheForecastData(tKey);

    //assert
    expect(result, Right(testForecastModel.list));
  });
}
