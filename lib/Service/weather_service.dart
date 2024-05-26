import 'package:flutter/foundation.dart';
import 'package:sd/api/api_repository.dart';
import 'package:sd/models/current_weather_data.dart';
import 'package:sd/models/five_days_data.dart';

class WeatherService {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=8e959f5fe67468d412527da3c650f5a0';

  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function() ?beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error) ?onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    //print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {
          if (beforSend != null)
            {
              beforSend(),
            },
        },
        onSuccess: (data) => {
          onSuccess!(CurrentWeatherData.fromJson(data)),
        },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }

  void getFiveDaysThreeHoursForcastData({
    Function() ?beforSend,
    Function(List<FiveDayData> fiveDayData) ?onSuccess,
    Function(dynamic error) ?onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {},
        onSuccess: (data) => {
          onSuccess!((data['list'] as List)
              ?.map((t) => FiveDayData.fromJson(t))
              ?.toList() ??
              List.empty()),
        },
        onError: (error) => {
          print(error),
          onError!(error),
        });
  }


}