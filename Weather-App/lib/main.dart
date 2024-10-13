import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/search.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/weather.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Welcom to",
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white.withOpacity(0.55)),
              child: Text("Weather App",
                  style: GoogleFonts.breeSerif(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white.withOpacity(0.65),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => search()));
        },
        label: const Text("Search"),
      ),
    );
  }
}
