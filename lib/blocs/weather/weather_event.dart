import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  const FetchWeather({@required this.city}) : assert(city != null);

  final String city;

  @override
  List<Object> get props => [city];
}

class RefreshWeather extends WeatherEvent {
  RefreshWeather({@required this.city}) : assert(city != null);

  final String city;

  @override
  List<Object> get props => [city];
}
