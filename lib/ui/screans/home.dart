import 'package:flutter/material.dart';
import 'package:firstapp/ui/widget/drawer.dart';
import 'package:firstapp/ui/widget/projectcard.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
        backgroundColor: Colors.blue,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF755EE8),
                    Color(0xFF846AFF),
                    Colors.purpleAccent,
                    Colors.amber,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        AssetImage('assets/images/profile_picture.jpeg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Mohamed Souei',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Front-end Developer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hello, I\'m a front-end developer passionate about creating beautiful and user-friendly web applications.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 32),

            // Projects Section
            Text(
              'Projects',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            PortfolioProjectCard(
              projectName: 'Smart home Application',
              projectDescription:
                  'SmartHouseApp: Voice-controlled smart home. Lights, thermostats... and more at your command',
              projectImage: 'assets/logo.png',
            ),
            // Custom card for projects

            SizedBox(height: 32),

            Text(
              'Contact',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'soueimed1@gmail.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Phone: +216 5666027',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final email =
                    'soueimed1@gmail.com'; // Replace with your email address
                final subject =
                    'Hello, Mohamed!'; // Replace with the desired subject line
                final emailURL =
                    'mailto:$email?subject=${Uri.encodeComponent(subject)}';
                if (await canLaunch(emailURL)) {
                  await launch(emailURL);
                } else {
                  // Handle the case if the email couldn't be launched
                }
              },
              // Remaining properties of the button...
              child: Text(
                'Get in Touch',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
