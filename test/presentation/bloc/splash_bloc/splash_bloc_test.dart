import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:amikompedia_app/core/services/locator.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_event.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_state.dart';

import '../../../helpers/constants/test_weather_data.dart';

void main() {
  late SplashBloc splashBloc;
  setUp(() {
    splashBloc = SplashBloc();
    
  });

  blocTest<SplashBloc, SplashState>(
    'emits [SplashLoading, SplashLoaded] when OnGetLocation is added.',
    build: () {
      when(LocationService.getCurrentLocation())
          .thenAnswer((_) async => testPosition);
      return splashBloc;
    },
    act: (bloc) => bloc.add(OnGetLocation()),
    expect: () => <SplashState>[
      SplashLoading(),
      SplashLoaded(result: testPosition),
    ],
  );
}
