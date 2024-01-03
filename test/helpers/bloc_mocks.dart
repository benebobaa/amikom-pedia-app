import 'package:bloc_test/bloc_test.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_event.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_state.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_event.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_state.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_state.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

class MockSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

  class MockSplashBloc extends MockBloc<SplashEvent, SplashState>
    implements SplashBloc {}
