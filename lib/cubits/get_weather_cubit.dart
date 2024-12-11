import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_request.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class DataLoadingState extends WeatherState {}

class WeatherBodyState extends WeatherState {
  final List<Weather> weatherModel;
  WeatherBodyState({required this.weatherModel});
}

class WeatherErrorState extends WeatherState {}

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());
  List<Weather>? myWeather;

  getWeather({required String cityName}) async {
    if (myWeather == null) {
      emit(DataLoadingState());
    }
    try {
      myWeather = await WeatherService().getCurrentWeather(
        cityName: cityName,
      );
      emit(
        WeatherBodyState(weatherModel: myWeather!),
      );
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(WeatherErrorState());
    }
  }
}
