import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear/views/search_view.dart';

import '../cubits/get_weather_cubit/get_current_states.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getAppBarColor(context), // Set dynamic AppBar color
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SearchView()),
              );
            },
            icon: const Icon(Icons.search, color: Colors.white, size: 40),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weatherModel: state.weatherModel);
          } else {
            return const Center(child: Text("Oops, there was an error!"));
          }
        },
      ),
    );
  }

  Color getAppBarColor(BuildContext context) {
    final state = context.watch<GetWeatherCubit>().state;

    if (state is WeatherLoadedState) {
      return getDominantColor(state.weatherModel.temp);
    }
    return Colors.blue; // Default color before search
  }
  Color getDominantColor(double temp) {
    if (temp < 10) {
      return Colors.indigo;
    } else if (temp < 20) {
      return Colors.blue;
    } else if (temp < 30) {
      return Colors.orangeAccent;
    } else {
      return Colors.red;
    }
  }
}
