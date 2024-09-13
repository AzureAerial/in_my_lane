import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/background_scaffold.dart';

class LogDriveScreen extends StatefulWidget {
  @override
  _LogDriveScreenState createState() => _LogDriveScreenState();
}

class _LogDriveScreenState extends State<LogDriveScreen> {
  Timer? _timer;
  int _start = 0;
  bool isDriving = false;
  bool isNightDrive = false;
  List<String> driveSessions = [];
  double totalHours = 0.0;
  double nightHours = 0.0;

  @override
  void initState() {
    super.initState();
    _loadSessions();
  }

  void startTimer() {
    _start = 0; // Reset the timer for a new session
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _start++;
      });
    });
  }

  void stopTimer() async {
    if (_timer != null) {
      _timer!.cancel();
      double sessionHours = _start / 3600;
      String session = 'Drive: ${sessionHours.toStringAsFixed(2)}h (${isNightDrive ? "Night" : "Day"})';

      setState(() {
        driveSessions.add(session);
        totalHours += sessionHours;
        if (isNightDrive) {
          nightHours += sessionHours;
        }
      });

      // Save the session to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('driveSessions', driveSessions);
      prefs.setDouble('totalHours', totalHours);
      prefs.setDouble('nightHours', nightHours);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Drive time saved!'),
      ));
    }
  }

  void _loadSessions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      driveSessions = prefs.getStringList('driveSessions') ?? [];
      totalHours = prefs.getDouble('totalHours') ?? 0.0;
      nightHours = prefs.getDouble('nightHours') ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Log Drive Time',  // Title moved to be above the appBar
      appBar: AppBar(
        title: const Text('Log Drive Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Time: ${_start ~/ 3600}:${(_start % 3600) ~/ 60}:${_start % 60}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isDriving ? null : () {
                setState(() {
                  isDriving = true;
                  isNightDrive = false;
                });
                startTimer();
              },
              child: const Text('Start Day Drive'),
            ),
            ElevatedButton(
              onPressed: isDriving ? null : () {
                setState(() {
                  isDriving = true;
                  isNightDrive = true;
                });
                startTimer();
              },
              child: const Text('Start Night Drive'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: !isDriving ? null : () {
                setState(() {
                  isDriving = false;
                });
                stopTimer();
              },
              child: const Text('Stop Drive'),
            ),
            const SizedBox(height: 40),
            const Text(
              'Drive Sessions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: driveSessions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(driveSessions[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('Total Hours: ${totalHours.toStringAsFixed(2)}/60'),
            LinearProgressIndicator(
              value: totalHours / 60,
            ),
            const SizedBox(height: 10),
            Text('Night Hours: ${nightHours.toStringAsFixed(2)}/10'),
            LinearProgressIndicator(
              value: nightHours / 10,
            ),
          ],
        ),
      ),
    );
  }
}
