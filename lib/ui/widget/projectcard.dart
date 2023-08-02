import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioProjectCard extends StatelessWidget {
  final String projectName;
  final String projectDescription;
  final String projectImage;

  PortfolioProjectCard({
    required this.projectName,
    required this.projectDescription,
    required this.projectImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // Use a custom color for the card background to match the theme
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.8, // Adjust this value to control the image size
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    projectImage,
                    height: 100, // You can adjust the height here
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projectName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  projectDescription,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Align buttons to the right
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // Add action for View Project button
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12), // Adjust button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(
                          color: Color(0xFF33CCCC),
                        ), // Border color
                      ),
                      child: Text(
                        'View Project',
                        style: TextStyle(
                          color: Color(0xFF33CCCC),
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Add spacing between buttons
                    ElevatedButton(
                      onPressed: () async {
                        final githubURL =
                            'https://github.com/soueip/smart-house-mobile-app/tree/master';
                        if (await canLaunch(githubURL)) {
                          await launch(githubURL);
                        } else {
                          // Handle the case if the URL couldn't be launched
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12), // Adjust button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Color.fromARGB(
                            255, 58, 58, 58), // Button background color
                      ),
                      child: Text(
                        'GitHub',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
