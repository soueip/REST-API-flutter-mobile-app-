import 'package:flutter/material.dart';

class meteo extends StatelessWidget {
  const meteo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('meto'),
        ),
        body: Center(
          child: Text(
            'meto page',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ));
  }
}
