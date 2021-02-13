import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather/network/locatn_servcees.dart';
import 'package:weather/network/network_handler.dart';
import 'package:weather/ui/weather_lat_lon.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Weather _weather = Weather();

  @override
  void initState() {
    requestWeather();
    super.initState();
  }

  // static String getFormattedDate(DateTime dateTime) {
  //   return new DateFormat('EEEE, MMM d, y').format(dateTime);
  // }

  void requestWeather() async {
    // var userLocation = await Geolocator.getCurrentPosition();
    // var response = await http.get(
    //     'http://api.openweathermap.org/data/2.5/weather?lat=${userLocation
    //         .latitude}&lon=${userLocation
    //         .longitude}&appid=bd060958ef3d4045c35e269d41265856&units=metric'
    // );
    // print('http://api.openweathermap.org/data/2.5/weather?lat=${userLocation
    //     .latitude}&lon=${userLocation
    //     .longitude}&appid=bd060958ef3d4045c35e269d41265856&units=metric');
    //
    // var result = jsonDecode(response.body);
    //
    // _weather.description = result['weather'][0]['description'];
    // _weather.date = getFormattedDate(
    //               new DateTime.fromMillisecondsSinceEpoch(result['dt'] * 1000))
    //           .toString();
    // _weather.temp = result['main']['temp'].toString();
    // _weather.wind = result['wind']['speed'].toString();
    // _weather.locationName = result['name'];
    // _weather.humid = result['main']['humidity'].toString();
    // _weather.conditionImage= result['weather'][0]['icon'];
    //
    //
    //
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> WeatherUI(
    //   weather: _weather,
    // )));

    try {
      UserLocation _userLocation = UserLocation();
      NetworkHandler _networkHandler = NetworkHandler();
      Position _position = await _userLocation.getUserPosition();

      if (_position != null) {
        Weather _weather = await _networkHandler.getWeatherResultFromGps(
            _position.latitude, _position.longitude);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WeatherUI(
                      weather: _weather,
                    )));
      }
    } catch (e) {
      print("did not get url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading Weather From Api>>>>>",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          SpinKitSquareCircle(
            color: Colors.red,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
