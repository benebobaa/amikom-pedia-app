import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:amikompedia_app/core/constants/key.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_event.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_state.dart';

import '../../../helpers/constants/test_weather_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockWeatherUsecase mockWeatherUsecase;
  late SearchBloc searchBloc;

  setUp(() {
    mockWeatherUsecase = MockWeatherUsecase();
    searchBloc = SearchBloc(mockWeatherUsecase);
  });

  blocTest('emits [RecentSearchLoaded] when OnInitCacheLocations is added',
      build: () {
        when(mockWeatherUsecase.getRecentLocations(Key.recentLocations))
            .thenAnswer((_) async => const Right(testRecentLocations));
        return searchBloc;
      },
      act: (bloc) => bloc.add(const OnInitCacheLocations()),
      expect: () => <SearchState>[
            const RecentSearchLoaded(locations: testRecentLocations),
          ]);
}
