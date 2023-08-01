import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Repo extends StatefulWidget {
  final String login;
  String? avatarurl;

  Repo({required this.login, this.avatarurl});

  @override
  State<Repo> createState() => _RepoState();
}

class _RepoState extends State<Repo> {
  dynamic datarepo; // Holds the list of repositories loaded from the API

  @override
  void initState() {
    super.initState();
    loadData(); // Load repositories data when the widget is first initialized
  }

  // Method to load the repositories for the provided user login from the API
  void loadData() async {
    String url = "https://api.github.com/users/${widget.login}/repos";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If API call is successful, update the state with the loaded data
      setState(() {
        datarepo = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repositories'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when back button is pressed
          },
        ),
        actions: [
          if (widget.avatarurl != null)
            CircleAvatar(
              backgroundImage: NetworkImage(widget.avatarurl!),
            ),
        ],
      ),
      body: datarepo == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : datarepo.isEmpty
              ? Center(
                  child: Text(
                    'No repositories found',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              // Display the list of repositories
              : ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      "${datarepo[index]['name']}", // Repository name
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(datarepo[index]['description'] ??
                        'No description'), // Repository description (if available)
                  ),
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.black45,
                  ),
                  itemCount:
                      datarepo.length, // Number of repositories in the list
                ),
    );
  }
}
