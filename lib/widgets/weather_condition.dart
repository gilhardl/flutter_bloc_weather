import 'package:bloc_weather/models/weather.dart';
import 'package:flutter/material.dart';

class WeatherConditions extends StatelessWidget {
  final WeatherCondition condition;

  WeatherConditions({Key key, @required this.condition})
      : assert(condition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Image _mapConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset('images/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset('images/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('images/cloudy.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset('images/rainy.png');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('images/thunderstorm.png');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('images/clear.png');
        break;
    }
    return image;
  }
}
