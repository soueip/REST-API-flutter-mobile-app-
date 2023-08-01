import 'package:firstapp/ui/widget/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('home'),
        ),
        body: Center(
            child: Text('ahla',
                style: Theme.of(context).textTheme.headlineLarge)));
  }
}
