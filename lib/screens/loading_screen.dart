import 'package:flutter/material.dart';
import 'package:flutter_counter/screens/report_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var weatherData = await WeatherModel().getWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherReportScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();

    print('initState called');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF051747),
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
