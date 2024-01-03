

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/annotations.dart';
import 'package:amikompedia_app/core/services/locator.dart';
import 'package:amikompedia_app/data/data_sources/local_data_sources/weather_local_data_source.dart';
import 'package:amikompedia_app/data/data_sources/remote_data_sources/weather_remote_data_source.dart';
import 'package:amikompedia_app/domain/repositories/weather_repository.dart';
import 'package:amikompedia_app/domain/usecases/weather_usecase.dart';

@GenerateMocks(
  [
    WeatherRepository,
    WeatherRemoteDataSource,
    WeatherLocalDataSource,
    WeatherUsecase,
    LocationService,
  ],
)
@GenerateNiceMocks(
  [
    MockSpec<http.Client>(as: #MockHttpClient),
    MockSpec<SharedPreferences>(as: #MockSharedPreferences),
  ],
)
void main() {}
