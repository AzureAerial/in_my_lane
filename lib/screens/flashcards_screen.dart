import 'package:flutter/material.dart';

class FlashcardsScreen extends StatefulWidget {
  @override
  _FlashcardsScreenState createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  final List<Map<String, String>> _flashcards = [
    {'question': 'What does a red traffic light mean?', 'answer': 'Stop'},
    {'question': 'What is the speed limit in a school zone?', 'answer': 'Usually 20-25 mph, but it varies by location.'},
    {'question': 'Who has the right of way at a four-way stop?', 'answer': 'The first vehicle to stop or the vehicle on the right.'},
    {'question': 'What does a yellow traffic light mean?', 'answer': 'Prepare to stop; the light is about to turn red.'},
    {'question': 'What should you do when you see a pedestrian crossing?', 'answer': 'Yield to the pedestrian.'},
    {'question': 'What does a flashing red light mean?', 'answer': 'Treat it as a stop sign; come to a complete stop.'},
    {'question': 'How far should you park from a fire hydrant?', 'answer': 'At least 15 feet.'},
    {'question': 'What does a green traffic light mean?', 'answer': 'Go, but only if the intersection is clear.'},
    {'question': 'What is the purpose of a seat belt?', 'answer': 'To keep you safe by restraining you during a collision.'},
    {'question': 'What does a yield sign indicate?', 'answer': 'Slow down and be prepared to stop if necessary.'},
    {'question': 'What should you do if your car starts to skid?', 'answer': 'Turn your steering wheel in the direction of the skid.'},
    {'question': 'What does a one-way sign mean?', 'answer': 'Traffic flows only in the direction of the arrow.'},
    {'question': 'When should you use your headlights?', 'answer': 'When visibility is low, such as at night or in fog.'},
    {'question': 'What should you do if an emergency vehicle is approaching with its lights and siren on?', 'answer': 'Pull over to the right and stop until it passes.'},
    {'question': 'What is the legal blood alcohol concentration (BAC) limit for drivers over 21 in most states?', 'answer': '0.08%'},
  ];

  int _currentIndex = 0;
  bool _showAnswer = false;

  void _nextFlashcard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
      _showAnswer = false;
    });
  }

  void _toggleAnswer() {
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                _flashcards[_currentIndex]['question']!,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (_showAnswer)
                Text(
                  _flashcards[_currentIndex]['answer']!,
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleAnswer,
                child: Text(_showAnswer ? 'Hide Answer' : 'Show Answer'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _nextFlashcard,
                child: Text('Next Flashcard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
