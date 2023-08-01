import 'package:firstapp/ui/screans/counter.dart';
import 'package:firstapp/ui/screans/home.dart';
import 'package:firstapp/ui/screans/meteo.dart';
import 'package:firstapp/ui/screans/profile.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "/profile": (context) => Profile(),
        "/counter": (context) => CounterPage(),
        "/meteo": (context) => meteo(),
      },
      theme: ThemeData(primaryColor: Color.fromARGB(192, 255, 1, 1)),
      initialRoute: "/ ",
    );
  }
}
