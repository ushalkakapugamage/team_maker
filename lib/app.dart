import 'package:flutter/material.dart';

import 'package:team_maker_application/home_page.dart';

class TeamMaker extends StatefulWidget {
  const TeamMaker({super.key});

  @override
  State<TeamMaker> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TeamMaker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 54, 93),
        title: const Text('Team Maker'),
      ),
      body: const HomePage()
    ));
  }
}

// TeamDivider(studentList: ["a","b","c","d","e","f","g","h","i"])
