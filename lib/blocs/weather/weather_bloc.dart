import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:bloc_weather/models/weather.dart';
import 'package:bloc_weather/repositories/weather_repository.dart';
import 'package:bloc_weather/blocs/weather/weather_event.dart';
import 'package:bloc_weather/blocs/weather/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc({@required WeatherRepository weatherRepository})
      : assert(weatherRepository != null),
        _weatherRepository = weatherRepository;

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield* _fetchWeather(event);
    }
    if (event is RefreshWeather) {
      yield* _refreshWeather(event);
    }
  }

  Stream<WeatherState> _fetchWeather(FetchWeather event) async* {
    yield WeatherLoading();
    try {
      final Weather weather = await _weatherRepository.getWeather(event.city);
      yield WeatherLoaded(weather: weather);
    } catch (_) {
      yield WeatherError();
    }
  }

  Stream<WeatherState> _refreshWeather(RefreshWeather event) async* {
    try {
      final Weather weather = await _weatherRepository.getWeather(event.city);
      yield WeatherLoaded(weather: weather);
    } catch (_) {
      yield state;
    }
  }
}
