import 'package:firstapp/ui/screans/repo.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final dynamic data;

  UserCard({required this.data});

  @override
  Widget build(BuildContext context) {
    //capteur de click
    return GestureDetector(
      onTap: () {
        // Navigate to UserDetailsPage when user card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Repo(
              login: data['login'],
              avatarurl: data['avatar_url'],
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(data['avatar_url']),
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Text(data['login']),
                ],
              ),
              CircleAvatar(
                child: Text("${data['score']}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
