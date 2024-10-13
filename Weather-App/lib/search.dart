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

// import 'package:flutter/material.dart';
// import 'package:weather/weather.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Search(),
//     ));

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   Weather? weather;
//   final openWeather = WeatherFactory('38abc8954fdad7e90da2539b0e586bcd');
//   String cityName = "";
//   bool isLoading = false;

//   void fetchWeather() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       Weather w = await openWeather.currentWeatherByCityName(cityName);
//       setState(() {
//         weather = w;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         weather = null;
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching weather: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         elevation: 0,
//         title: Text("Search by City Name"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(22.0),
//             child: TextField(
//               onChanged: (value) {
//                 cityName = value;
//               },
//               decoration: InputDecoration(
//                   hintText: "Search by City",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12.0)),
//                   suffixIcon: IconButton(
//                       onPressed: () {
//                         fetchWeather();
//                       },
//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.cyan,
//                       ))),
//             ),
//           ),
//           Expanded(
//               child: Center(
//             child: isLoading
//                 ? CircularProgressIndicator()
//                 : weather != null
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             '${weather!.temperature?.celsius?.toStringAsFixed(1)}°C',
//                             style: TextStyle(fontSize: 35.0),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             '${weather!.weatherDescription}',
//                             style: TextStyle(fontSize: 20.0),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             'Humidity: ${weather!.humidity}%',
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                           Text(
//                             'Wind Speed: ${weather!.windSpeed} m/s',
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                         ],
//                       )
//                     : Text(
//                         'Enter a city name to get weather details',
//                          style: TextStyle(fontSize: 18.0),
//                       ),
//           ))
//         ],
//       ),
//     );
//   }
// }
