import 'package:flutter/material.dart';
import 'package:team_maker_application/app.dart';
import 'package:team_maker_application/divider.dart';
import 'package:team_maker_application/messege.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<_HomePageState> rootKey = GlobalKey<_HomePageState>();

  final _textController = TextEditingController();

  String stName = '';

  List<String> studentList = [];

  void addStudent() {
    if (studentList.contains(_textController.text)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Message(message: "${_textController.text} is already added.");
        },
      );
      _textController.clear();
    } else {
      setState(() {
        studentList.add(_textController.text);
        stName += "${_textController.text}, ";
        _textController.clear();
      });
    }
  }

  void moveToDivider() {
    if (studentList.length >= 8) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TeamDivider(studentList: studentList)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Message(
              message: "Please add minimum of 8 students to continue");
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
          child: Text(
            "Student Names",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 218, 218, 218),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  stName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: "Enter Student Name",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              addStudent();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              moveToDivider();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        TextButton(
            onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeamMaker(key: rootKey)),
                  )
                },
            child: const Text("Reset"))
      ],
    );
  }
}
