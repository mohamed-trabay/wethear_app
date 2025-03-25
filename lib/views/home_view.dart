import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wethear/views/search_view.dart';
import 'package:wethear/widgets/weather_Info_body.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchView()));
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(weather:state.weatherModel ,);
            } else {
              return const Text('oops there was an error');
            }
          },
        ));
  }
}
