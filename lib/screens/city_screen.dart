import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String _selectedCity = 'Lagos' ;


  List <String> spinnerItems = [

    'Lagos',
    'Abuja',
    'Onitsha',
    'Warri',
    'Enugu',
    'Uyo',
    'Kano',
    'Eket',
    'Etinan',
    'Bori',
    'Maiduguri',
    'Owerri',
    'Benin City',
    'Ibadan',
    'Port Harcourt'

  ];

  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF051747),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton(
                  iconEnabledColor: Colors.white,
                  value: _selectedCity,
                  style: const TextStyle(color: Colors.purple, fontSize: 16),
                  underline: Container(

                    height: 0,
                    color: Colors.blue,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value.toString();
                    });
                  },
                  items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                // child: TextField(
                //   style: const TextStyle(
                //     color: Colors.black,
                //   ),
                //   decoration: const InputDecoration(
                //     filled: true,
                //     fillColor: Colors.white,
                //     icon: Icon(
                //       Icons.location_city,
                //       color: Colors.white,
                //     ),
                //     hintText: 'Enter City Name',
                //     hintStyle: TextStyle(
                //       color: Colors.grey,
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(10.0),
                //       ),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                //   onChanged: (value) {
                //     print(value);
                //     cityName = value;
                //   },
                // ),
              ),
              TextButton(
                onPressed: () {
                  if (_selectedCity != null) {
                      print('Selected value: $_selectedCity');
                      Navigator.pop(context, _selectedCity);
                  } else {
                      print('No value selected');

                    }
                  },

                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
