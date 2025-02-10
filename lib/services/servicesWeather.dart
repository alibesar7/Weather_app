import 'package:dio/dio.dart';

import '../model/weatherModel.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com";
  final String apiKey = "b9dd1c9f49ae4e2ca3f104536252001";

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio.get("$baseUrl/v1/forecast.json?key=$apiKey&q=$cityname&days=10");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error']['message'] ?? "Oops, there was an error.");
    }
  }
}