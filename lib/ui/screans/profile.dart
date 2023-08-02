import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:firstapp/ui/widget/usercard.dart';

class Restapi extends StatefulWidget {
  @override
  State<Restapi> createState() => _Restapi();
}

class _Restapi extends State<Restapi> {
  String query = "";
  bool visible = false;
  TextEditingController queryTextEditingController =
      TextEditingController(); // declaration hez valeur mta3 zone de text
  dynamic data; // declaration conver json to dart
  int currentPage = 0;
  int totalPage = 0;
  int pageSize = 20;
  List<dynamic> olduserscroll = []; // save old info varibal
  ScrollController scrlconttrol = new ScrollController();
  void _search(String query) {
    // recherche dapres api git
    String url =
        "https://api.github.com/search/users?q=${query}&per_page=$pageSize&page=$currentPage";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        data = json.decode(resp.body); //convertion jason to dart
        this.olduserscroll.addAll(data['items']); // put old info
        if (data['total_count'] % pageSize == 0) {
          totalPage = data['total_count'] ~/ pageSize;
        } else
          totalPage = (data['total_count'] / pageSize).floor() + 1;
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    // scroll end page ++
    scrlconttrol.addListener(() {
      if (scrlconttrol.position.pixels ==
          scrlconttrol.position.maxScrollExtent) {
        setState(() {
          if (currentPage < totalPage - 1) {
            ++currentPage;
            _search(query);
          }
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'GitHub User Search  ${currentPage + 1} / $totalPage'), // Display current page and total pages in the app bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Input Field
            TextFormField(
              obscureText: visible,
              onChanged: (value) => setState(() {
                this.query = value;
              }),
              controller: queryTextEditingController,
              decoration: InputDecoration(
                labelText: "GitHub Users",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible; // Toggle password visibility
                    });
                  },
                  icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  this.query = queryTextEditingController.text;
                  // Reset page varibles when performing a new search
                  olduserscroll = [];
                  currentPage = 0;
                  _search(this.query);
                });
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: (data == null)
                  ? Center(
                      child: Text("No results found"),
                    )
                  : ListView.builder(
                      controller: scrlconttrol,
                      itemCount: olduserscroll.length,
                      itemBuilder: (context, index) {
                        // UserCard result item
                        return UserCard(data: olduserscroll[index]);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
