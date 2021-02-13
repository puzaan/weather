import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/ui/weather_by_city.dart';

class WeatherUI extends StatefulWidget {
  final Weather weather;
  WeatherUI({this.weather});
  @override
  _WeatherUIState createState() => _WeatherUIState();
}

class _WeatherUIState extends State<WeatherUI> {
  String description = '';
  String date = '';
  String conditionImage = '';
  String temp = '';
  String wind = '';
  String humid = '';
  String locationName = '';

  @override
  void initState() {
    updateUi(widget.weather);
    super.initState();
  }

  void updateUi(Weather weather) {
    setState(() {
      description = weather.description;
      date = weather.date;
      conditionImage = weather.conditionImage;
      temp = weather.temp;
      wind = weather.wind;
      humid = weather.humid;
      locationName = weather.locationName;
    });
  }

  String getIconFromCondition(String condition) {
    switch (condition) {
      case "01d":
        return 'assets/026-sun.png';
        break;

      case "02d":
        return 'assets/024-hail.png';
        break;
      case "03d":
        return 'assets/028-cloudy.png';
        break;
      case "04d":
        return 'assets/004-storm.png';
        break;
      case "09d":
        return 'assets/002-rain.png';
        break;
      case "10d":
        return 'assets/003-rain.png';
        break;
      case "011d":
        return 'assets/004-storm.png';
        break;
      case "013d":
        return 'assets/016-thermometer.png';
        break;
      case "50d":
        return 'assets/027-moon.png';
        break;

      case "01n":
        return 'assets/026-sun.png';
        break;

      case "02n":
        return 'assets/024-hail.png';
        break;
      case "03n":
        return 'assets/028-cloudy.png';
        break;
      case "04n":
        return 'assets/004-storm.png';
        break;
      case "09n":
        return 'assets/002-rain.png';
        break;
      case "10n":
        return 'assets/003-rain.png';
        break;
      case "011n":
        return 'assets/004-storm.png';
        break;
      case "013n":
        return 'assets/016-thermometer.png';
        break;
      case "50n":
        return 'assets/027-moon.png';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    //widget.weather.date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.map,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      var weatherData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeatherByCity()));
                      if (weatherData != null) {
                        setState(() {
                          updateUi(weatherData);
                        });

                      }
                    },
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    // widget.weather.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          Expanded(
              flex: 2,
              child: Center(
                  child: Image(
                image: AssetImage(
                    getIconFromCondition(conditionImage)
                    //'assets/028-cloudy.png'
                ),
                width: MediaQuery.of(context).size.width / 2,
              ))),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    Text(
                      locationName,
                      //widget.weather.locationName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30.0),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 15.0),
                      child: Text(
                        ' $temp°C',
                        // '${widget.weather.temp}°C',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '\n wind',
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                Text(
                                  '$wind m/s',
                                  // '${widget.weather.wind}m/s',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(FontAwesomeIcons.wind),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '\nHumidity',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  '$humid%',
                                  //'${widget.weather.humid}%',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(FontAwesomeIcons.temperatureHigh),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
