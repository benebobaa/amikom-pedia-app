import 'package:geolocator/geolocator.dart';
import 'package:amikompedia_app/data/models/forecast_model.dart';
import 'package:amikompedia_app/domain/entities/forecast_entity.dart';

var testForecastModel = const ForecastModel(
  cityName: 'Jakarta',
  list: [
    ForecastWeatherModel(
        main: 'Rain',
        iconCode: '10d',
        dateTxt: '2023-11-29 09:00:00',
        temperature: 32.52,
        tempMin: 31.73,
        tempMax: 32.52,
        pressure: 1006,
        humidity: 67),
    ForecastWeatherModel(
        main: 'Rain',
        iconCode: '10n',
        dateTxt: '2023-11-29 12:00:00',
        temperature: 30.96,
        tempMin: 29.98,
        tempMax: 30.96,
        pressure: 1007,
        humidity: 67),
  ],
);

const testCityName = 'Jakarta';
const testForecastEntity = ForecastEntity(
  cityName: 'Jakarta',
  list: [
    ForecastWeatherEntity(
        main: 'Rain',
        iconCode: '10d',
        dateTxt: '2023-11-29 09:00:00',
        temperature: 32.52,
        tempMin: 31.73,
        tempMax: 32.52,
        pressure: 1006,
        humidity: 67),
    ForecastWeatherEntity(
        main: 'Rain',
        iconCode: '10n',
        dateTxt: '2023-11-29 12:00:00',
        temperature: 30.96,
        tempMin: 29.98,
        tempMax: 30.96,
        pressure: 1007,
        humidity: 67),
  ],
);

var testLoadedData = const [
  [
    ForecastWeatherEntity(
        main: 'Rain',
        iconCode: '10d',
        dateTxt: '2023-11-29 09:00:00',
        temperature: 32.52,
        tempMin: 31.73,
        tempMax: 32.52,
        pressure: 1006,
        humidity: 67),
    ForecastWeatherEntity(
        main: 'Rain',
        iconCode: '10n',
        dateTxt: '2023-11-29 12:00:00',
        temperature: 30.96,
        tempMin: 29.98,
        tempMax: 30.96,
        pressure: 1007,
        humidity: 67),
  ],
  [
    ForecastWeatherEntity(
        main: 'Rain',
        iconCode: '10d',
        dateTxt: '2023-11-29 09:00:00',
        temperature: 32.52,
        tempMin: 31.73,
        tempMax: 32.52,
        pressure: 1006,
        humidity: 67),
    ForecastWeatherEntity(
        main: 'Rain',
        iconCode: '10n',
        dateTxt: '2023-11-29 12:00:00',
        temperature: 30.96,
        tempMin: 29.98,
        tempMax: 30.96,
        pressure: 1007,
        humidity: 67),
  ]
];

var testPosition = Position(
  altitudeAccuracy: 0,
  headingAccuracy: 0,
  latitude: 0,
  longitude: 0,
  timestamp: DateTime.now(),
  accuracy: 0,
  altitude: 0,
  heading: 0,
  speed: 0,
  speedAccuracy: 0,
  floor: null,
  isMocked: false,
);

const testListForecastEntity = [
  ForecastWeatherEntity(
      main: 'Rain',
      iconCode: '10d',
      dateTxt: '2023-11-29 09:00:00',
      temperature: 32.52,
      tempMin: 31.73,
      tempMax: 32.52,
      pressure: 1006,
      humidity: 67),
  ForecastWeatherEntity(
      main: 'Rain',
      iconCode: '10n',
      dateTxt: '2023-11-29 12:00:00',
      temperature: 30.96,
      tempMin: 29.98,
      tempMax: 30.96,
      pressure: 1007,
      humidity: 67),
];

const testListForecastModel = [
  ForecastWeatherModel(
      main: 'Rain',
      iconCode: '10d',
      dateTxt: '2023-11-29 09:00:00',
      temperature: 32.52,
      tempMin: 31.73,
      tempMax: 32.52,
      pressure: 1006,
      humidity: 67),
  ForecastWeatherModel(
      main: 'Rain',
      iconCode: '10n',
      dateTxt: '2023-11-29 12:00:00',
      temperature: 30.96,
      tempMin: 29.98,
      tempMax: 30.96,
      pressure: 1007,
      humidity: 67),
];

const testRecentLocations = [
  'Jakarta',
  'Bandung',
  'Surabaya',
];
