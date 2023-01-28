import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:sweater_weather/services/lcoation.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    getData();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  void getData() async {
    Response response;
    var dio = Dio();

    response = await dio.get(
      'http://api.weatherapi.com/v1/current.json?key=e230b33051ba43309f7150708232801&q=London&aqi=no',
    );
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
