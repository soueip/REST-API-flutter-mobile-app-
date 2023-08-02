import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "home",
      "icon": Icon(Icons.home, color: Colors.amber),
      "route": "/home"
    },
    {
      "title": "Provider state",
      "icon": Icon(
        Icons.add,
        color: Colors.amber,
      ),
      "route": "/counter"
    },
    {
      "title": "cubit state",
      "icon": Icon(
        Icons.add,
        color: Colors.amber,
      ),
      "route": "/counter cubit"
    },
    {
      "title": "bloc  state",
      "icon": Icon(
        Icons.add,
        color: Colors.amber,
      ),
      "route": "/counter bloc"
    },
    {
      "title": "Rest Api",
      "icon": Icon(
        Icons.person,
        color: Colors.amber,
      ),
      "route": "/profile"
    },
  ];
}
