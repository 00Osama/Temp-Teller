import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';
import 'package:weatherapp/widgets/loading.dart';
import 'package:weatherapp/widgets/no_weather.dart';
import 'package:weatherapp/widgets/show_weather.dart';

class MyWeather extends StatefulWidget {
  const MyWeather({super.key});

  @override
  State<MyWeather> createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is NoWeatherState) {
          return const NoWeather();
        } else if (state is WeatherBodyState) {
          return ShowWeather(
            myWeather: state.weatherModel,
          );
        } else if (state is DataLoadingState) {
          return const Loading();
        } else {
          return const Center(
            child: Text('Unknowen cubit Error'),
          );
        }
      },
    );
  }
}
