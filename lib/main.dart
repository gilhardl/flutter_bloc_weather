import 'package:bloc_weather/blocs/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:bloc_weather/providers/weather_provider.dart';
import 'package:bloc_weather/repositories/weather_repository.dart';
import 'package:bloc_weather/blocs/weather.dart';
import 'package:bloc_weather/blocs/theme.dart';

import 'package:bloc_weather/screens/weather_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: App(
        weatherRepository: WeatherRepository(
          weatherProvider: WeatherProvider(
            httpClient: http.Client(),
          ),
        ),
      ),
    ),
  );
}

class App extends StatelessWidget {
  App({@required WeatherRepository weatherRepository})
      : assert(weatherRepository != null),
        _weatherRepository = weatherRepository;

  WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) => MaterialApp(
        title: 'BLoC Weather',
        theme: themeState.theme,
        home: BlocProvider<WeatherBloc>(
          create: (context) =>
              WeatherBloc(weatherRepository: _weatherRepository),
          child: WeatherScreen(),
        ),
      ),
    );
  }
}
