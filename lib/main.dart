import 'package:firstapp/ui/provider/counterpro.dart';
import 'package:firstapp/ui/screans/counter.dart';
import 'package:firstapp/ui/screans/home.dart';
import 'package:firstapp/ui/screans/meteo.dart';
import 'package:firstapp/ui/screans/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// can you generate a code for home page with fluuter
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CounterState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => HomePage(),
          "/profile": (context) => Profile(),
          "/counter": (context) => CounterProviderPage(),
          "/meteo": (context) => meteo(),
        },
        theme: ThemeData(primaryColor: Color.fromARGB(192, 255, 1, 1)),
        initialRoute: "/ ",
      ),
    );
  }
}
