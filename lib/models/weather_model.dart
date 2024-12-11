class Weather {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  Weather({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory Weather.fromJson(json, jsonCityName) {
    return Weather(
      cityName: jsonCityName,
      date: DateTime.parse(json['date']),
      image: json['day']['condition']['icon'],
      temp: json['day']['avgtemp_c'],
      maxTemp: json['day']['maxtemp_c'],
      minTemp: json['day']['mintemp_c'],
      weatherCondition: json['day']['condition']['text'],
    );
  }
}
