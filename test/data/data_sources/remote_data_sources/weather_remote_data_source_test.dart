import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:amikompedia_app/core/constants/constants.dart';
import 'package:amikompedia_app/core/error/exception.dart';
import 'package:amikompedia_app/data/data_sources/remote_data_sources/weather_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:amikompedia_app/data/models/forecast_model.dart';
import '../../../helpers/constants/dummy_data_json.dart';
import '../../../helpers/json_reader.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl remoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSourceImpl = WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  const tCityName = 'Jakarta';

  group('get current forecast weather by name', () {
    test(
      'should return [WeatherModel] when the response code is 200',
      () async {
        //arrange
        when(
          mockHttpClient.get(
            Uri.parse(Urls.currentForecastByName(tCityName)),
          ),
        ).thenAnswer(
          (_) async => http.Response(readJson(DummyData.forecastJson), 200),
        );

        //act
        final result = await remoteDataSourceImpl.getForecastByName(tCityName);

        //assert
        expect(result, isA<ForecastModel>());
      },
    );

    test(
      'should throw [ServerException] when the response code is 500',
      () async {
        //arrange
        when(
          mockHttpClient.get(
            Uri.parse(Urls.currentForecastByName(tCityName)),
          ),
        ).thenAnswer(
          (_) async => http.Response('Something went wrong', 500),
        );

        //act
        final result = remoteDataSourceImpl.getForecastByName(tCityName);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );

    test('should throw [BadRequestException] when the response code is 404',
        () async {
      //arrange
      when(
        mockHttpClient.get(
          Uri.parse(Urls.currentForecastByName(tCityName)),
        ),
      ).thenAnswer(
        (_) async => http.Response('City not found', 404),
      );

      //act
      final result = remoteDataSourceImpl.getForecastByName(tCityName);

      //assert
      expect(result, throwsA(isA<BadRequestException>()));
    });
  });

  group('get current forecast weather by position', () {
    test(
      'should return [WeatherModel] when the response code is 200',
      () async {
        //arrange
        when(
          mockHttpClient.get(
            Uri.parse(Urls.currentForecastByPosition(0, 0)),
          ),
        ).thenAnswer(
          (_) async => http.Response(readJson(DummyData.forecastJson), 200),
        );

        //act
        final result = await remoteDataSourceImpl.getForecastByPosition(0, 0);

        //assert
        expect(result, isA<ForecastModel>());
      },
    );

    test(
      'should throw [ServerException] when the response code is 500',
      () async {
        //arrange
        when(
          mockHttpClient.get(
            Uri.parse(Urls.currentForecastByPosition(0, 0)),
          ),
        ).thenAnswer(
          (_) async => http.Response('Something went wrong', 500),
        );

        //act
        final result = remoteDataSourceImpl.getForecastByPosition(0, 0);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
