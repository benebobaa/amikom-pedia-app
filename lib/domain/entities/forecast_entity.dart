import 'package:equatable/equatable.dart';
import 'package:amikompedia_app/data/models/forecast_model.dart';

class ForecastEntity extends Equatable {
  final String cityName;
  final List<ForecastWeatherEntity> list;

  const ForecastEntity({
    required this.cityName,
    required this.list,
  });

  @override
  List<Object?> get props => [cityName, list];
}

class ForecastWeatherEntity extends Equatable {
  const ForecastWeatherEntity({
    required this.main,
    required this.iconCode,
    required this.dateTxt,
    required this.temperature,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  final String main;
  final String iconCode;
  final String dateTxt;
  final double temperature;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  ForecastWeatherEntity toEntity() => ForecastWeatherEntity(
        main: main,
        iconCode: iconCode,
        dateTxt: dateTxt,
        temperature: temperature,
        tempMin: tempMin,
        tempMax: tempMax,
        pressure: pressure,
        humidity: humidity,
      );

  ForecastWeatherModel toModel() => ForecastWeatherModel(
        main: main,
        iconCode: iconCode,
        dateTxt: dateTxt,
        temperature: temperature,
        tempMin: tempMin,
        tempMax: tempMax,
        pressure: pressure,
        humidity: humidity,
      );

  @override
  List<Object?> get props => [
        main,
        iconCode,
        dateTxt,
        temperature,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];

  Map<String, dynamic> toJson() {
    return {
      'dt_txt': dateTxt,
      'weather': [
        {
          'main': main,
          'icon': iconCode,
        }
      ],
      'main': {
        'temp': temperature,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      },
    };
  }
}
