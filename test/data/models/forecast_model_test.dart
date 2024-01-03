import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:amikompedia_app/data/models/forecast_model.dart';
import 'package:amikompedia_app/domain/entities/forecast_entity.dart';

import '../../helpers/constants/dummy_data_json.dart';
import '../../helpers/constants/test_weather_data.dart';
import '../../helpers/json_reader.dart';

void main() {
  

  test('should be subclass of [ForecastEntity]', () {
    //assert
    expect(testForecastModel, isA<ForecastEntity>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson(DummyData.forecastJson));

    //act
    final result = ForecastModel.fromJson(jsonMap);

    //assert
    expect(result, testForecastModel);
  });

  test('should return a json map containing proper data', () async {
    //act
    final result = testForecastModel.toJson();

    //assert
    final expectedMap = {
      "city": {"name": "Jakarta"},
      "list": [
        {
          "weather": [
            {"main": "Rain", "icon": "10d"}
          ],
          "dt_txt": "2023-11-29 09:00:00",
          "main": {
            "temp": 32.52,
            "temp_min": 31.73,
            "temp_max": 32.52,
            "pressure": 1006,
            "humidity": 67
          }
        },
        {
          "weather": [
            {"main": "Rain", "icon": "10n"}
          ],
          "dt_txt": "2023-11-29 12:00:00",
          "main": {
            "temp": 30.96,
            "temp_min": 29.98,
            "temp_max": 30.96,
            "pressure": 1007,
            "humidity": 67
          }
        },
      ]
    };

    expect(result, expectedMap);
  });
}
