import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';
import 'package:weatherapp/widgets/get_weather_color.dart';
import 'package:weatherapp/widgets/my_weather.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.grey[400],
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: getWeatherColor(
                BlocProvider.of<WeatherCubit>(context)
                    .myWeather?[0]
                    .weatherCondition,
              ),
            ),
            home: const Scaffold(
              body: MyWeather(),
            ),
          ),
        ),
      ),
    );
  }
}
