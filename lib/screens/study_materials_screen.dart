import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'flashcards_screen.dart';  // Import the flashcards screen
import 'driving_rules_screen.dart';  // Import the driving rules screen
import '../questions.dart';  // Import your questions

class StudyMaterialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Materials'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      quizTitle: 'General Knowledge Quiz',
                      questions: generalQuestions,
                    ),
                  ),
                );
              },
              child: Text('General Knowledge Quiz'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      quizTitle: 'Road Signs Quiz',
                      questions: roadSignsQuestions,
                    ),
                  ),
                );
              },
              child: Text('Road Signs Quiz'),
            ),
            SizedBox(height: 20),  // Space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlashcardsScreen(),  // Ensure FlashcardsScreen is implemented
                  ),
                );
              },
              child: Text('Flashcards'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrivingRulesScreen(),  // Ensure DrivingRulesScreen is implemented
                  ),
                );
              },
              child: Text('Driving Rules'),
            ),
          ],
        ),
      ),
    );
  }
}
