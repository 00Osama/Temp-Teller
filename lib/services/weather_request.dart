import 'package:weatherapp/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final dio = Dio();

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '69fce037902242c2bcc03736240404';

  Future<List<Weather>> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10',
      );
      Map<String, dynamic> myJson = response.data;
      List<dynamic> daysList = myJson['forecast']['forecastday'];
      String city = myJson['location']['name'];
      List<Weather> weatherList = [];
      for (var day in daysList) {
        Weather myWeather = Weather.fromJson(day, city);
        weatherList.add(myWeather);
      }
      return weatherList;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'opps , there was an error, try again later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unknowen request Error');
    }
  }
}
