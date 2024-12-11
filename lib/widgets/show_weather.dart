import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/widgets/get_weather_color.dart';
import 'package:weatherapp/widgets/srearch_weaher.dart';

class ShowWeather extends StatefulWidget {
  const ShowWeather({
    super.key,
    required this.myWeather,
  });

  final List<Weather> myWeather;

  @override
  State<ShowWeather> createState() => _ShowWeatherState();
}

class _ShowWeatherState extends State<ShowWeather> {
  String getDayOfWeek(DateTime date) {
    List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return weekdays[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                getWeatherColor(
                  BlocProvider.of<WeatherCubit>(context)
                      .myWeather?[0]
                      .weatherCondition,
                ).shade500,
                getWeatherColor(
                  BlocProvider.of<WeatherCubit>(context)
                      .myWeather?[0]
                      .weatherCondition,
                ).shade300,
                getWeatherColor(
                  BlocProvider.of<WeatherCubit>(context)
                      .myWeather?[0]
                      .weatherCondition,
                ).shade100
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(flex: 1),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SearchWeather();
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(flex: 2),
                  Text(
                    '${widget.myWeather[0].cityName} Weather',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(flex: 4),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  "https:${widget.myWeather[0].image}",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.myWeather[0].temp.round()}°',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    widget.myWeather[0].weatherCondition,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 200,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: widget.myWeather.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https:${widget.myWeather[index].image}",
                                fit: BoxFit.contain,
                              ),
                              Text(
                                getDayOfWeek(
                                  DateTime(
                                    widget.myWeather[index].date.year,
                                    widget.myWeather[index].date.month,
                                    widget.myWeather[index].date.day,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: Row(
                              children: [
                                Text(
                                  '${widget.myWeather[index].maxTemp.round()}°',
                                ),
                                const Text('/'),
                                Text(
                                  '${widget.myWeather[index].minTemp.round()}°',
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
