import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:weather/model/weather.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  String _basUrl = 'http://api.openweathermap.org/data/2.5/weather';
  String _apiKey = 'bd060958ef3d4045c35e269d41265856';

  String getLcationUrl(double lat, double lon) {
    return '$_basUrl?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
  }
  String getCtyUrl(String cityName){
    return '$_basUrl?q=$cityName&appid=$_apiKey&units=metric';
  }

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat('EEEE, MMM d, y').format(dateTime);
  }

  Future<Weather> getWeatherResultFromGps(double lat, double lon) async {
    Weather _weather = Weather();

    try {

      var response = await http.get(getLcationUrl(lat, lon));

      print(getLcationUrl(lat, lon));

      var result = jsonDecode(response.body);

      _weather.description = result['weather'][0]['description'];
      _weather.date = getFormattedDate(
          new DateTime.fromMillisecondsSinceEpoch(result['dt'] * 1000))
          .toString();
      _weather.temp = result['main']['temp'].toString();
      _weather.wind = result['wind']['speed'].toString();
      _weather.locationName = result['name'];
      _weather.humid = result['main']['humidity'].toString();
      _weather.conditionImage = result['weather'][0]['icon'];
      return _weather;
    }
    catch (e) {
      print("Error getting data");
    }
  }



  Future<Weather> getWeatherFromCityName(String cityName)async{
    Weather _weather = Weather();

    try {

      var response = await http.get(getCtyUrl(cityName));

      print(getCtyUrl(cityName));

      var result = jsonDecode(response.body);

      _weather.description = result['weather'][0]['description'];
      _weather.date = getFormattedDate(
          new DateTime.fromMillisecondsSinceEpoch(result['dt'] * 1000))
          .toString();
      _weather.temp = result['main']['temp'].toString();
      _weather.wind = result['wind']['speed'].toString();
      _weather.locationName = result['name'];
      _weather.humid = result['main']['humidity'].toString();
      _weather.conditionImage = result['weather'][0]['icon'];
      return _weather;
    }
    catch (e) {
      print("Error getting data");
    }


  }

}