class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String condition;

  WeatherModel({required this.cityName,
    required this.date,
    required this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
    required this.condition});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['location']['localtime']),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
