import 'package:flutter/material.dart';

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  }
  switch (weatherCondition) {
    case "Sunny":
      return Colors.yellow;
    case "Partly cloudy":
      return Colors.blueGrey;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
      return Colors.blue;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Blowing snow":
    case "Blizzard":
      return Colors.grey;
    case "Fog":
      return Colors.blueGrey;
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Ice pellets":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.grey;
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}
