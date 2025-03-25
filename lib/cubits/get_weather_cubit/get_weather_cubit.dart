import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wethear/models/weather_model.dart';

import '../../services/weather_sevice.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit():super(InitialState());
   WeatherModel? weatherModel;

  fetchWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherService().getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
