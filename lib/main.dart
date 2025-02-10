import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:wethear/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wethear/views/home_view.dart';
import 'cubits/get_weather_cubit/get_current_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          MaterialColor themeColor = Colors.blue;
          if (state is WeatherLoadedState) {
            themeColor = getColor(state.weatherModel.weatherCondition);
          }
          return MaterialApp(
            theme: ThemeData(primarySwatch: themeColor),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getColor(String condition) {
  if (["Sunny"].contains(condition)) return Colors.orange;
  if (["Partly cloudy", "Overcast"].contains(condition)) return Colors.blueGrey;
  if (["Cloudy"].contains(condition)) return Colors.grey;
  if (["Mist", "Patchy snow possible"].contains(condition)) return Colors.blue;
  if (["Patchy rain possible", "Light drizzle", "Light rain"].contains(condition)) return Colors.blue;
  if (["Thundery outbreaks possible"].contains(condition)) return Colors.purple;
  return Colors.blue;
}
