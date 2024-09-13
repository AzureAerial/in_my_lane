import 'package:flutter/material.dart';
import 'log_drive_screen.dart';
import 'study_materials_screen.dart';
import 'view_progress_screen.dart';
import '../widgets/background_scaffold.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'In My Lane',
      appBar: AppBar(
        title: Text('In My Lane'),  // Add an AppBar here
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logolady.png',  // Your image path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
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
