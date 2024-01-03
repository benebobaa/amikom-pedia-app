import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amikompedia_app/domain/entities/forecast_entity.dart';
import 'package:amikompedia_app/domain/usecases/weather_usecase.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_state.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase _usecase;
  int selectedIndex = 0;
  String cityName = '';
  late ForecastEntity forecastEntity;
  List<List<ForecastWeatherEntity>> resultData = [];

  WeatherBloc(this._usecase) : super(WeatherEmpty()) {
    on<OnForecastByPosition>((event, emit) async {
      emit(WeatherLoading());
      final hasConnected = await InternetConnectionChecker().hasConnection;
      if (hasConnected) {
        final result =
            await _usecase.getForecastByPosition(event.lat, event.lon);
        result.fold((failure) => emit(WeatherError(message: failure.message)),
            (data) {
          forecastEntity = data;
          resultData = _groupByDate(data);
          cityName = data.cityName;
          emit(WeatherLoaded(
              cityName: data.cityName,
              data: resultData,
              selectedIndex: selectedIndex));
        });
      } else {
        final result = await _usecase.getCacheCityName();
        result.fold((failure) => emit(WeatherError(message: failure.message)),
            (data) {
          if (data == '') {
            emit(const WeatherError(message: 'No internet connection'));
          } else {
            add(OnGetCacheForecast(key: data));
          }
        });
      }
    });

    on<OnChangeSearch>((event, emit) async {
      emit(WeatherLoading());
      final hasConnected = await InternetConnectionChecker().hasConnection;
      if (hasConnected) {
        final result = await _usecase.getForecastByName(event.name);

        result.fold((failure) => emit(WeatherError(message: failure.message)),
            (data) {
          forecastEntity = data;
          resultData.clear();
          resultData = _groupByDate(data);
          cityName = data.cityName;
          selectedIndex = 0;

          emit(WeatherLoaded(
              cityName: data.cityName,
              data: resultData,
              selectedIndex: selectedIndex));
        });
      } else {
        add(OnGetCacheForecast(key: event.name.toLowerCase()));
      }
    });

    //
    on<OnChangeSelectDay>((event, emit) {
      selectedIndex = event.index;
      emit(WeatherLoaded(
          cityName: cityName, data: resultData, selectedIndex: selectedIndex));
    });

    on<OnCacheForecast>((event, emit) async {
      final result = await _usecase.cacheForecastData(
          forecastEntity.cityName, forecastEntity.list);
      result.fold((failure) => emit(WeatherError(message: failure.message)),
          (data) => null);
    });

    on<OnGetCacheForecast>((event, emit) async {
      final result = await _usecase.getCacheForecastData(event.key);
      result.fold((failure) => emit(WeatherError(message: failure.message)),
          (data) {
        forecastEntity = ForecastEntity(cityName: event.key, list: data);
        resultData = _groupByDate(forecastEntity);
        cityName = event.key;
        selectedIndex = 0;

        emit(WeatherLoaded(
            cityName: event.key,
            data: resultData,
            selectedIndex: selectedIndex));
      });
    });
  }

  List<List<ForecastWeatherEntity>> _groupByDate(ForecastEntity data) {
    Map<String, List<ForecastWeatherEntity>> groupedData = {};

    for (var item in data.list) {
      String dateString = item.dateTxt;
      String dateKey = dateString.split(' ')[0];

      if (groupedData.containsKey(dateKey)) {
        groupedData[dateKey]!.add(item);
      } else {
        groupedData[dateKey] = [item];
      }
    }

    return groupedData.values.toList();
  }
}
