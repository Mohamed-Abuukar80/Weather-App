import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  Weather? weather;
  final openWeather = WeatherFactory('38abc8954fdad7e90da2539b0e586bcd');
  String CityName = "";

  getWeather() async {
    try {
      weather = await openWeather.currentWeatherByCityName(CityName);
      setState(() {});
    } catch (e) {
      print("THE ERROR $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Text("Search by City Name"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(22.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  CityName = value;
                });
              },
              decoration: InputDecoration(
                  hintText: "Search by City",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        getWeather();
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.cyan,
                      ))),
            ),
          ),
          Expanded(
            child: weather != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather!.temperature!.celsius!.round()} °C',
                        style: TextStyle(fontSize: 35.0),
                      ),
                      Text('${weather!.weatherDescription}'),
                      Text('Humidity: ${weather!.humidity}%'),
                      Text(
                        'Wind Speed: ${weather!.windSpeed} m/s',
                      )
                    ],
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}


