import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.blue,
          title: const Text("Search Your City", style: TextStyle(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              var wcubit = BlocProvider.of<GetWeatherCubit>(context);
              wcubit.getWeather(cityname: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              suffixIcon: Icon(Icons.search, size: 35),
              labelText: "Search",
              border: OutlineInputBorder(),
              hintText: "Enter Your City",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 23),
            ),
          ),
        ),
      ),
    );
  }
}