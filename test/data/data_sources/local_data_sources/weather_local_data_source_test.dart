import 'package:flutter_test/flutter_test.dart';
import 'package:amikompedia_app/data/data_sources/local_data_sources/weather_local_data_source.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late WeatherLocalDataSourceImpl localDataSourceImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSourceImpl =
        WeatherLocalDataSourceImpl(prefs: mockSharedPreferences);
  });

  const tKey = 'jakarta';
  const tListValue = ['jakarta', 'bandung'];
  group('cache and get recent cache searches location', () {
    test('should call [SharedPreferences] to cache the data', () async {
      //arrange
      when(() => mockSharedPreferences.setStringList(any(), any()))
          .thenAnswer((_) async => true);

      //act
      await localDataSourceImpl.cacheRecentLocations(tKey, tListValue);

      //assert
      verify(() => mockSharedPreferences.setStringList(tKey, tListValue));

      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });
}
