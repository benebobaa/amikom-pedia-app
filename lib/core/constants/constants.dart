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

  // Amikompedia
  static const String apiUrl = 'https://amikompedia.beneboba.me';

  static const String login = '$apiUrl/api/v1/auth/_login';

  static const String register = '$apiUrl/api/v1/auth/_register';

  static const String renewToken = '$apiUrl/api/v1/auth/_renew-token';

  static const String forgotPassword = '$apiUrl/api/v1/users/_forgot-password';

  static const String otpValidate = '$apiUrl/api/v1/otp/_validation';

  static const String otpResend = '$apiUrl/api/v1/otp/_resend';

  static const String updateUser = '$apiUrl/api/v1/users';

  static const String profileUser = '$apiUrl/api/v1/users/profile';

  static const String allPosts = '$apiUrl/api/v1/posts';
}
