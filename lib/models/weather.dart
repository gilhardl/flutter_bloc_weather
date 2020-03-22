import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class Weather extends Equatable {
  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;

  const Weather({
    this.condition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
  });

  @override
  List<Object> get props => [
        condition,
        formattedCondition,
        minTemp,
        temp,
        maxTemp,
        locationId,
        created,
        lastUpdated,
        location,
      ];

  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
      condition:
          _getWeatherCondition(consolidatedWeather['weather_state_abbr']),
      formattedCondition: consolidatedWeather['weather_state_name'],
      minTemp: consolidatedWeather['min_temp'] as double,
      temp: consolidatedWeather['the_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      locationId: json['woeid'] as int,
      created: consolidatedWeather['created'],
      lastUpdated: DateTime.now(),
      location: json['title'],
    );
  }

  static WeatherCondition _getWeatherCondition(String input) {
    switch (input) {
      case 'sn':
        return WeatherCondition.snow;
        break;
      case 'sl':
        return WeatherCondition.sleet;
        break;
      case 'h':
        return WeatherCondition.hail;
        break;
      case 't':
        return WeatherCondition.thunderstorm;
        break;
      case 'hr':
        return WeatherCondition.heavyRain;
        break;
      case 'lr':
        return WeatherCondition.lightRain;
        break;
      case 's':
        return WeatherCondition.showers;
        break;
      case 'hc':
        return WeatherCondition.heavyCloud;
        break;
      case 'lc':
        return WeatherCondition.lightCloud;
        break;
      case 'c':
        return WeatherCondition.clear;
        break;
      default:
        return WeatherCondition.unknown;
    }
  }
}
