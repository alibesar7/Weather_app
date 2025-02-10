import '../../model/weatherModel.dart';

class WeatherState {}
class WeatherInitialState extends WeatherState {}
class WeatherLoadingState extends WeatherState {}
class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends WeatherState {}
