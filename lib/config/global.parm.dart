import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "home",
      "icon": Icon(Icons.home, color: Colors.amber),
      "route": "/home"
    },
    {
      "title": "Counter",
      "icon": Icon(
        Icons.add,
        color: Colors.amber,
      ),
      "route": "/counter"
    },
    {
      "title": "Meteo",
      "icon": Icon(
        Icons.camera,
        color: Colors.amber,
      ),
      "route": "/meteo"
    },
    {
      "title": "profile",
      "icon": Icon(
        Icons.person,
        color: Colors.amber,
      ),
      "route": "/profile"
    },
  ];
}
