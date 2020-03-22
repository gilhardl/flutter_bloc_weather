import 'package:bloc_weather/models/weather.dart';
import 'package:bloc_weather/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:bloc_weather/providers/weather_provider.dart';
import 'package:bloc_weather/blocs/weather.dart';

import 'package:bloc_weather/screens/weather_screen.dart';

void main() {
  runApp(
    App(
      weatherRepository: WeatherRepository(
        weatherProvider: WeatherProvider(
          httpClient: http.Client(),
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
    return MaterialApp(
      title: 'BLoC Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: _weatherRepository),
        child: WeatherScreen(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello world !',
            ),
          ],
        ),
      ),
    );
  }
}
