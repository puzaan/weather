import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/network/network_handler.dart';


class WeatherByCity extends StatefulWidget {
  @override
  _WeatherByCityState createState() => _WeatherByCityState();
}

class _WeatherByCityState extends State<WeatherByCity> {
  String _cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('City Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(icon:Icon(Icons.done), onPressed: ()async{
              if(_cityName!=null && _cityName.isNotEmpty){
                //print (_cityName!=null );
                Weather weather = await NetworkHandler().getWeatherFromCityName(_cityName);
                Navigator.pop(context, weather);
              }else{
                print('City name not entered!!!! ');
              }



            },),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            contentPadding: EdgeInsets.all(8)
          ),
          onChanged: (value){
            _cityName = value;
          },
        ),
      ),
    );
  }
}
