import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: test(),
    ));

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asyn & Await"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text("Press")),
      ),
    );
  }
}
