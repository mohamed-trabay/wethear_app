import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.fetchWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(25),
                labelText: 'Search',
                hintText: 'Enter City Name',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
