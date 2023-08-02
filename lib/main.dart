import 'package:firstapp/ui/block/cubit.dart';
import 'package:firstapp/ui/provider/counter%20bloc.dart';
import 'package:firstapp/ui/provider/countr%20provider.dart';
import 'package:firstapp/ui/screans/counter%20bloc.dart';
import 'package:firstapp/ui/screans/counter%20provider.dart';
import 'package:firstapp/ui/screans/home.dart';
import 'package:firstapp/ui/screans/counter%20cubit.dart';
import 'package:firstapp/ui/screans/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// bloc state mangment
void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit(0)),
        BlocProvider(create: (context) => ContrBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => HomePage(),
          "/profile": (context) => Restapi(),
          "/counter": (context) => CounterProviderPage(),
          "/cubit": (context) => CountercubitPage(),
          "/bloc": (context) => CounterblocPage(),
        },
        theme: ThemeData(primaryColor: Color.fromARGB(192, 255, 1, 1)),
        initialRoute: "/",
      ),
    );
  }
}

// provider state mangment
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
          "/profile": (context) => Restapi(),
          "/counter": (context) => CounterProviderPage(),
          "/meteo": (context) => CountercubitPage(),
        },
        theme: ThemeData(primaryColor: Color.fromARGB(192, 255, 1, 1)),
        initialRoute: "/ ",
      ),
    );
  }
}
