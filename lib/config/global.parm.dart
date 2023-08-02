import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "home",
      "icon": Icon(Icons.home, color: Color(0xFF33CCCC)),
      "route": "/home"
    },
    {
      "title": "Provider state",
      "icon": Icon(
        Icons.add,
        color: Color(0xFF33CCCC),
      ),
      "route": "/counter"
    },
    {
      "title": "cubit state",
      "icon": Icon(
        Icons.add,
        color: Color(0xFF33CCCC),
      ),
      "route": "/counter cubit"
    },
    {
      "title": "bloc  state",
      "icon": Icon(
        Icons.add,
        color: Color(0xFF33CCCC),
      ),
      "route": "/counter bloc"
    },
    {
      "title": "Rest Api",
      "icon": Icon(
        Icons.person,
        color: Color(0xFF33CCCC),
      ),
      "route": "/profile"
    },
  ];
}
