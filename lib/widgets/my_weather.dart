import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';
import 'package:weatherapp/widgets/loading.dart';
import 'package:weatherapp/widgets/no_weather.dart';
import 'package:weatherapp/widgets/show_weather.dart';
import 'package:weatherapp/widgets/srearch_weaher.dart';

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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/page-lost.png'),
                const Text(
                  'Unknowen city name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SearchWeather();
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.grey.shade800,
                    ),
                  ),
                  child: const Text(
                    'search weather',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
