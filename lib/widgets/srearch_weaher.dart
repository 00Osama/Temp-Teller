import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';

class SearchWeather extends StatelessWidget {
  const SearchWeather({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('you can search weather by city name'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controller,
                  cursorColor: Colors.grey.shade800,
                  decoration: InputDecoration(
                    hintText: 'city name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(7),
                child: SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<WeatherCubit>(context).getWeather(
                        cityName: controller.text,
                      );
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.grey.shade800,
                      ),
                    ),
                    child: const Text(
                      'show weather',
                    ),
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
