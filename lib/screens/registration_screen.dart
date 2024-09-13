import 'package:flutter/material.dart';
import '../user_models.dart';
import 'home_screen.dart';
import 'package:in_my_lane/widgets/background_scaffold.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  late Student student; // Define the student

  void _register() {
    String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      student = Student(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        totalHoursDriven: 0.0,
        nightHoursDriven: 0.0,
        quizScores: [],
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(user: student, allStudents: []),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Registration Screen',
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
