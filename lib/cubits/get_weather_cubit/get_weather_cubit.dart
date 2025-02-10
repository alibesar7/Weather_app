import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear/cubits/get_weather_cubit/get_current_states.dart';
import 'package:wethear/model/weatherModel.dart';
import '../../services/servicesWeather.dart';
class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  Future<void> getWeather({required String cityname}) async {
    emit(WeatherLoadingState()); // Show loading indicator
    try {
      WeatherModel weatherModel = await WeatherServices(Dio()).getCurrentWeather(cityname: cityname);
      emit(WeatherLoadedState(weatherModel)); // Load new weather data
    } catch (e) {
      emit(WeatherFailureState()); // Handle errors
    }
  }
}
