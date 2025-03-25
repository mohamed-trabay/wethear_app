import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethear/views/home_view.dart';

import 'cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) {
            return BlocBuilder<GetWeatherCubit, GetWeatherState>(
              builder: (context, state) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        primarySwatch: getWeatherColor(
                          BlocProvider
                              .of<GetWeatherCubit>(context)
                              .weatherModel
                              ?.condition,
                        ), useMaterial3: false
                    ),
                    home: const HomeView());
              },
            );
          }
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  Map<List<String>, MaterialColor> weatherGroups = {
    ["Sunny", "Clear", "Partly cloudy"]: Colors.amber,
    ["Cloudy", "Overcast", "Mist", "Fog", "Freezing fog"]: Colors.grey,
    [
      "Patchy rain possible",
      "Light rain",
      "Moderate rain",
      "Heavy rain",
      "Thundery outbreaks possible",
      "Patchy light rain with thunder",
      "Moderate or heavy rain with thunder",
      "Light drizzle",
      "Patchy light drizzle",
      "Light rain shower",
      "Moderate or heavy rain shower",
      "Torrential rain shower"
    ]: Colors.blue,
    [
      "Patchy snow possible",
      "Patchy sleet possible",
      "Patchy freezing drizzle possible",
      "Patchy light snow",
      "Light snow",
      "Moderate snow",
      "Heavy snow",
      "Blowing snow",
      "Blizzard",
      "Freezing drizzle",
      "Heavy freezing drizzle",
      "Light sleet",
      "Moderate or heavy sleet",
      "Ice pellets",
      "Moderate or heavy snow with thunder",
      "Light showers of ice pellets",
      "Moderate or heavy showers of ice pellets"
    ]: Colors.cyan,
  };

  for (var entry in weatherGroups.entries) {
    if (entry.key.contains(condition)) {
      return entry.value;
    }
  }

  return Colors.blue;
}
