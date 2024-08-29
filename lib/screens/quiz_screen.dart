import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizScreen extends StatefulWidget {
  final String quizTitle;
  final List<Map<String, Object>> questions;

  QuizScreen({required this.quizTitle, required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<String> _scoreHistory = [];

  @override
  void initState() {
    super.initState();
    _loadScoreHistory();
  }

  void _loadScoreHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _scoreHistory = prefs.getStringList('quizScores') ?? [];
    });
  }

  // This is the method that saves the quiz score to SharedPreferences
  void _saveScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String quizResult = '${widget.quizTitle}: $score/${widget.questions.length}';
    _scoreHistory.add(quizResult);
    await prefs.setStringList('quizScores', _scoreHistory);
  }

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _currentQuestionIndex++;
    });

    // When all questions are answered, save the score
    if (_currentQuestionIndex >= widget.questions.length) {
      _saveScore(_score);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizTitle),
      ),
      body: _currentQuestionIndex < widget.questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.questions[_currentQuestionIndex]['question'] as String,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ...(widget.questions[_currentQuestionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer['score'] as int),
                    child: Text(answer['text'] as String),
                  );
                }).toList(),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You scored $_score/${widget.questions.length}',
                    style: TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go Back'),
                  ),
                ],
              ),
            ),
    );
  }
}
