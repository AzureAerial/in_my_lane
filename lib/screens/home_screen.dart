import 'package:flutter/material.dart';
import 'log_drive_screen.dart';
import 'study_materials_screen.dart';
import 'view_progress_screen.dart'; // Make sure to create and import this screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In My Lane'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/image.png',  // Make sure this matches your working image path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),  // Space between image and buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogDriveScreen()),
                );
              },
              child: Text('Log Drive Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudyMaterialsScreen()),
                );
              },
              child: Text('Study Materials'),
            ),
            SizedBox(height: 20),  // Space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewProgressScreen()),
                );
              },
              child: Text('View My Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
