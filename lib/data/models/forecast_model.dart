import 'package:amikompedia_app/domain/entities/forecast_entity.dart';

class ForecastModel extends ForecastEntity {
  const ForecastModel({
    required String cityName,
    required List<ForecastWeatherModel> list,
  }) : super(
          cityName: cityName,
          list: list,
        );

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      cityName: json['city']['name'],
      list: (json['list'] as List)
          .map((e) => ForecastWeatherModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': {
        'name': cityName,
      },
      'list': list.map((e) => e.toJson()).toList(),
    };
  }

  ForecastEntity toEntity() => ForecastEntity(
        cityName: cityName,
        list: list.map((e) => e.toEntity()).toList(),
      );
}

class ForecastWeatherModel extends ForecastWeatherEntity {
  const ForecastWeatherModel({
    required String main,
    required String iconCode,
    required String dateTxt,
    required double temperature,
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int humidity,
  }) : super(
          main: main,
          iconCode: iconCode,
          dateTxt: dateTxt,
          temperature: temperature,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity,
        );

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
      main: json['weather'][0]['main'],
      iconCode: json['weather'][0]['icon'],
      dateTxt: json['dt_txt'],
      temperature: json['main']['temp'].runtimeType == int
          ? (json['main']['temp'] as int).toDouble()
          : json['main']['temp'],
      tempMin: json['main']['temp_min'].runtimeType == int
          ? (json['main']['temp_min'] as int).toDouble()
          : json['main']['temp_min'],
      tempMax: json['main']['temp_max'].runtimeType == int
          ? (json['main']['temp_max'] as int).toDouble()
          : json['main']['temp_max'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
    );
  }
}
