import 'package:dio/dio.dart';
import 'package:wethear/models/weather_model.dart';

class WeatherService {
  final dio = Dio();
  final baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '7e0e339238db416eb2e05512250903';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ?? 'error';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception('error gdn');
    }
  }
}
