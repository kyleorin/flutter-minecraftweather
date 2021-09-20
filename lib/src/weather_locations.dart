import 'package:flutter/material.dart';

class WeatherLocations {
  late final String city;
  late final String temprature;
  late final String background;
  late final String visability;
  late final String humidity;
  late final String uvindex;

  WeatherLocations(
      {required this.city,
      required this.temprature,
      required this.background,
      required this.visability,
      required this.humidity,
      required this.uvindex});
}

final locations = [
  WeatherLocations(
      city: 'London',
      temprature: '14\u2103',
      background: 'assets/lake-night.mp4',
      visability: '16.1km',
      humidity: '84%',
      uvindex: '0'),
  WeatherLocations(
      city: 'Tel Aviv',
      temprature: '23\u2103',
      background: 'assets/swamp-day.mp4',
      visability: '9.7km',
      humidity: '75%',
      uvindex: '0'),
  WeatherLocations(
      city: 'Vancouver',
      temprature: '13\u2103',
      background: 'assets/mountin-day-snow.mp4',
      visability: '14.5km',
      humidity: '92%',
      uvindex: '0'),
  WeatherLocations(
      city: 'California',
      temprature: '20\u2103',
      background: 'assets/lake-sunny.mp4',
      visability: '16.1km',
      humidity: '47%',
      uvindex: '0'),
  WeatherLocations(
      city: 'Paris',
      temprature: '14\u2103',
      background: 'assets/swamp-day-rain.mp4',
      visability: '11.3km',
      humidity: '91%',
      uvindex: '0'),
  WeatherLocations(
      city: 'Oslo',
      temprature: '9\u2103',
      background: 'assets/mountin-night-snow.mp4',
      visability: '12.9km',
      humidity: '75%',
      uvindex: '0'),
  WeatherLocations(
      city: 'Puerto Rico',
      temprature: '27\u2103',
      background: 'assets/lake-night-rain.mp4',
      visability: '11.3km',
      humidity: '84%',
      uvindex: '0'),
];
