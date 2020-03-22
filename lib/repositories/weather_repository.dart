import 'dart:async';

import 'package:meta/meta.dart';

import 'package:bloc_weather/models/weather.dart';
import 'package:bloc_weather/providers/weather_provider.dart';

class WeatherRepository {
  final WeatherProvider _weatherProvider;

  WeatherRepository({@required WeatherProvider weatherProvider})
      : assert(weatherProvider != null),
        _weatherProvider = weatherProvider;

  Future<Weather> getWeather(String city) async {
    final int locationId = await _weatherProvider.getLocationId(city);
    return _weatherProvider.fetchWeather(locationId);
  }
}
