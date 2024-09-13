import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_my_lane/widgets/background_scaffold.dart';

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
      _scoreHistory = prefs.getStringList('${widget.quizTitle}_scoreHistory') ?? [];
    });
  }

  void _saveScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _scoreHistory.add('Score: $score/${widget.questions.length}');
    await prefs.setStringList('${widget.quizTitle}_scoreHistory', _scoreHistory);
  }

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= widget.questions.length) {
      _saveScore(_score);
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'quiz screen',
      appBar: AppBar(
        title: Text(widget.quizTitle),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,  // Ensures all buttons and text fill the width
            children: [
              if (_currentQuestionIndex < widget.questions.length)
                ...[
                  Text(
                    widget.questions[_currentQuestionIndex]['question'] as String,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ...(widget.questions[_currentQuestionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(answer['score'] as int),
                        child: Text(answer['text'] as String),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.0),  // Add padding for button
                        ),
                      ),
                    );
                  }).toList(),
                ]
              else
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You scored $_score/${widget.questions.length}',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _restartQuiz,
                      child: Text('Restart Quiz'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
