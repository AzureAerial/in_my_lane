import 'package:flutter/material.dart';
import '../widgets/background_scaffold.dart';

class DrivingRulesScreen extends StatelessWidget {
  final List<Map<String, String>> _rules = [
    {
      'title': 'Stop Signs',
      'description': 'Always stop at a stop sign and yield to other vehicles and pedestrians.'
    },
    {
      'title': 'Speed Limits',
      'description': 'Adhere to the posted speed limits. Reducing speed is necessary in adverse conditions.'
    },
    {
      'title': 'Right of Way',
      'description': 'Yield the right of way to other vehicles and pedestrians as specified by traffic rules.'
    },
    {
      'title': 'Traffic Lights',
      'description': 'Obey all traffic lights. Stop at red lights, and only proceed on green when it is safe to do so.'
    },
    {
      'title': 'Pedestrian Crosswalks',
      'description': 'Always yield to pedestrians at crosswalks and be prepared to stop.'
    },
    {
      'title': 'Seat Belts',
      'description': 'Always wear your seat belt while driving. Make sure all passengers are buckled up as well.'
    },
    {
      'title': 'Cell Phone Use',
      'description': 'Avoid using your cell phone while driving. Use hands-free devices if necessary.'
    },
    {
      'title': 'No U-Turn',
      'description': 'Do not make a U-turn where prohibited by signs or where visibility is limited.'
    },
    {
      'title': 'Emergency Vehicles',
      'description': 'Pull over and stop for emergency vehicles with flashing lights and sirens.'
    },
    {
      'title': 'Blind Spots',
      'description': 'Check your blind spots before changing lanes or merging with traffic.'
    },
    {
      'title': 'School Zones',
      'description': 'Slow down and be extra cautious when driving through school zones, especially during school hours.'
    },
    {
      'title': 'Railroad Crossings',
      'description': 'Always stop for trains at railroad crossings. Never attempt to cross when a train is approaching.'
    },
    {
      'title': 'Yield Sign',
      'description': 'Slow down and be prepared to stop at yield signs. Give way to traffic in the intersection or on the main road.'
    },
    {
      'title': 'Overtaking',
      'description': 'Only overtake when it is safe to do so. Make sure the road ahead is clear before passing another vehicle.'
    },
    {
      'title': 'Roundabouts',
      'description': 'Yield to traffic already in the roundabout and follow the directional signs for exiting.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Driving Rules & Guidelines',
      appBar: AppBar(
        title: Text('Driving Rules & Guidelines'),
      ),
      body: ListView.builder(
        itemCount: _rules.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(_rules[index]['title']!),
              subtitle: Text(_rules[index]['description']!),
            ),
          );
        },
      ),
    );
  }
}
