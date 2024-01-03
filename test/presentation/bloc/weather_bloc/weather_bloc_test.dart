import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_state.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../helpers/constants/test_weather_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockWeatherUsecase mockWeatherUsecase;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockWeatherUsecase = MockWeatherUsecase();
    weatherBloc = WeatherBloc(mockWeatherUsecase);
  });

  test('initial state should be [WeatherEmpty] state', () {
    //assert
    expect(weatherBloc.state, WeatherEmpty());
  });

  blocTest<WeatherBloc, WeatherState>(
    'emits [WeatherLoading, WeatherLoaded] when OnForecastByPosition is added.',
    build: () {
      when(mockWeatherUsecase.getForecastByPosition(0, 0))
          .thenAnswer((_) async => const Right(testForecastEntity));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnForecastByPosition(lat: 0, lon: 0)),
    expect: () => <WeatherState>[
      WeatherLoading(),
      WeatherLoaded(
          cityName: testCityName, data: testLoadedData, selectedIndex: 0)
    ],
  );
}
