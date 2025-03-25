part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class InitialState extends GetWeatherState{}
class WeatherFailureState extends GetWeatherState{}
class WeatherLoadedState extends GetWeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
