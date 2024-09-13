// questions.dart

// Define general knowledge quiz questions
List<Map<String, Object>> generalQuestions = [
  {
    'question': 'What should you do at a red traffic light?',
    'answers': [
      {'text': 'Stop', 'score': 1},
      {'text': 'Go', 'score': 0},
      {'text': 'Slow down', 'score': 0},
    ],
  },
  {
    'question': 'Who has the right of way at a four-way stop?',
    'answers': [
      {'text': 'The first vehicle to stop', 'score': 1},
      {'text': 'The vehicle on the left', 'score': 0},
      {'text': 'The vehicle on the right', 'score': 0},
    ],
  },
  {
    'question': 'What is the speed limit in a residential area?',
    'answers': [
      {'text': '25 mph', 'score': 1},
      {'text': '35 mph', 'score': 0},
      {'text': '45 mph', 'score': 0},
    ],
  },
  {
    'question': 'What does a stop sign mean?',
    'answers': [
      {'text': 'Stop', 'score': 1},
      {'text': 'Yield', 'score': 0},
      {'text': 'Go', 'score': 0},
    ],
  },
];

// Define road signs quiz questions
List<Map<String, Object>> roadSignsQuestions = [
  {
    'question': 'What does a yellow traffic light mean?',
    'answers': [
      {'text': 'Speed up', 'score': 0},
      {'text': 'Prepare to stop', 'score': 1},
      {'text': 'Stop', 'score': 0},
    ],
  },
  {
    'question': 'What does a stop sign indicate?',
    'answers': [
      {'text': 'Proceed with caution', 'score': 0},
      {'text': 'Stop completely and yield', 'score': 1},
      {'text': 'Slow down', 'score': 0},
    ],
  },
  // Add more questions here as needed
];

// Function to get a random set of questions
List<Map<String, Object>> getRandomQuestions(List<Map<String, Object>> questions, int numberOfQuestions) {
  questions.shuffle();
  return questions.take(numberOfQuestions).toList();
}
