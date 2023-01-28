import 'package:flutter/material.dart';

import 'package:sweater_weather/services/lcoation.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sweater_weather/services/networking.dart';

const apiKey = 'e230b33051ba43309f7150708232801';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    getLocationData();

    super.initState();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitute;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude&aqi=no');
    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
