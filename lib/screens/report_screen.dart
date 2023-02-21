import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../services/weather.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';

class WeatherReportScreen extends StatefulWidget {
  WeatherReportScreen({this.locationWeather});

  final locationWeather;

  @override
  State<WeatherReportScreen> createState() => _WeatherReportScreenState();
}

class _WeatherReportScreenState extends State<WeatherReportScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherMessage;
  late String weatherIcon;
  late String cityName;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get Weather Data at the moment..';
        cityName = '';

        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);

      cityName = weatherData['name'];
    });
  }

  final List<String> _items = [];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize the _items list with three items
    _items.addAll(['Item 4', 'Item 5', 'Item 6']);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFF051747),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(

                      onPressed: () async {
                        var weatherData = await weather.getWeatherLocation();
                        updateUI(weatherData);
                      },
                      child: Column(
                        children: const [
                           Icon(
                            Icons.near_me,
                            size: 50.0,
                          ),
                          Text('Get weather')
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                        print(typedName);
                        if (typedName != null) {
                          var weatherData = await weather.getCity(typedName);
                          return updateUI(weatherData);
                        }
                      },
                      child: Column(
                        children: const[
                           Icon(
                            Icons.location_city,
                            size: 50.0,
                          ),
                          Text('Choose location')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, top:70.0, left: 30),
                child: Column(

                  children: [
                    Row(
                      children: [
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                    Text(
                      '$weatherMessage in $cityName',
                      textAlign: TextAlign.left,
                      style: kMessageTextStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}
