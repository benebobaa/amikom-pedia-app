import 'package:amikompedia_app/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:amikompedia_app/data/repositories/auth_repository_impl.dart';
import 'package:amikompedia_app/domain/repositories/auth_repository.dart';
import 'package:amikompedia_app/domain/usecases/auth_usecase.dart';
import 'package:amikompedia_app/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amikompedia_app/data/data_sources/local_data_sources/weather_local_data_source.dart';
import 'package:amikompedia_app/data/data_sources/remote_data_sources/weather_remote_data_source.dart';
import 'package:amikompedia_app/data/repositories/weather_repository_impl.dart';
import 'package:amikompedia_app/domain/repositories/weather_repository.dart';
import 'package:amikompedia_app/domain/usecases/weather_usecase.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

class ServiceLocator {
  static Future<void> setup() async {
    //bloc
    locator.registerFactory(() => WeatherBloc(locator()));
    locator.registerFactory(() => SplashBloc());
    locator.registerFactory(() => SearchBloc(locator()));

    locator.registerFactory(() => LoginBloc(locator()));

    //usecase
    locator.registerLazySingleton(() => WeatherUsecase(locator()));
    locator.registerLazySingleton(() => AuthUsecase(locator()));

    //repository
    locator.registerLazySingleton<WeatherRepository>(() =>
        WeatherRepositoryImpl(
            remoteDataSource: locator(), localDataSource: locator()));

    locator.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: locator()));

    //datasource
    locator.registerLazySingleton<WeatherRemoteDataSource>(
        () => WeatherRemoteDataSourceImpl(client: locator()));

    locator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(client: locator()));

    locator.registerLazySingleton<WeatherLocalDataSource>(
        () => WeatherLocalDataSourceImpl(prefs: locator()));
    //http
    locator.registerLazySingleton(() => http.Client());

    //shared preference
    final sharedPreferences = await SharedPreferences.getInstance();
    locator.registerSingleton<SharedPreferences>(sharedPreferences);
  }
}
