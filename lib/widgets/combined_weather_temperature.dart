import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_weather/models/weather.dart';
import 'package:bloc_weather/blocs/settings.dart';

import 'package:bloc_weather/widgets/weather_condition.dart';
import 'package:bloc_weather/widgets/temperature.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  final Weather weather;

  CombinedWeatherTemperature({
    Key key,
    @required this.weather,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: WeatherConditions(condition: weather.condition),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, settings) => Temperature(
                  temperature: weather.temp,
                  high: weather.maxTemp,
                  low: weather.minTemp,
                  units: settings.temperatureUnits,
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
