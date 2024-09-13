import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_my_lane/widgets/background_scaffold.dart';

class ViewProgressScreen extends StatefulWidget {
  @override
  _ViewProgressScreenState createState() => _ViewProgressScreenState();
}

class _ViewProgressScreenState extends State<ViewProgressScreen> {
  double totalHours = 0.0;
  double nightHours = 0.0;
  List<String> quizScores = [];

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  void _loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      totalHours = prefs.getDouble('totalHours') ?? 0.0;
      nightHours = prefs.getDouble('nightHours') ?? 0.0;
      quizScores = prefs.getStringList('quizScores') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'View Progress',
      appBar: AppBar(
        title: Text('My Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Total Driving Hours: ${totalHours.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Night Driving Hours: ${nightHours.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Quiz Scores:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            quizScores.isEmpty
                ? Text('No quiz scores available.')
                : Expanded(
                    child: ListView.builder(
                      itemCount: quizScores.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(quizScores[index]),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
