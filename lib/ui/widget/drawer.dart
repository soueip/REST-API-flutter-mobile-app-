import 'package:firstapp/config/global.parm.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.white,
              ]),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 50,
              ),
            ),
          ),
          ...(GlobalParams.menus as List).map((e) {
            return ListTile(
              title: Text(
                '${e['title']}',
                style: TextStyle(fontSize: 22),
              ),
              leading: e['icon'],
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.amber,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "${e['route']}");
              },
            );
          })
        ],
      ),
    );
  }
}
