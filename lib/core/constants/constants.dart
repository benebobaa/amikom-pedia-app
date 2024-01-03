class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = 'a16de83051d54709d3e2b74486d176cf';
  static String currentWeatherByName(String cityName) =>
      '$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';

  static String currentWeatherByPosition(double lat, double lon) =>
      '$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

  static String currentForecastByPosition(double lat, double lon) =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

  static String currentForecastByName(String cityName) =>
      '$baseUrl/forecast?q=$cityName&appid=$apiKey&units=metric';
}
