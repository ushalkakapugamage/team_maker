import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:team_maker_application/home_page.dart';
import 'package:team_maker_application/messege.dart';

class TeamDivider extends StatefulWidget {
  final List<String> studentList;

  const TeamDivider({Key? key, required this.studentList}) : super(key: key);

  @override
  State<TeamDivider> createState() => _TeamDividerState();
}

class _TeamDividerState extends State<TeamDivider> {
  List<List<String>> groups = [];

  List<Widget> divideStudents() {
    List<Widget> result = [];

    if (widget.studentList.length >= 8) {
      while (widget.studentList.length >= 4) {
        widget.studentList.shuffle();
        List<String> group = widget.studentList.sublist(0, 4);
        groups.add(group);
        widget.studentList.removeRange(0, 4);
      }

      if (widget.studentList.isNotEmpty) {
        groups.shuffle();
        for (int i = 0; i < widget.studentList.length; i++) {
          groups[i % groups.length].add(widget.studentList[i]);
        }
      }

      for (int i = 0; i < groups.length; i++) {
        String text = '';
        for (int j = 0; j < groups[i].length; j++) {
          text += "${j + 1}. ${groups[i][j]}\n";
        }

        result.add(
          Card(
            color: Color.fromARGB(255, 4, 93, 135),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Group ${i + 1}\n\n$text",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
        result.add(const SizedBox(
          width: 20,
        ));
      }
    } else {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Message(
              message: "Please add a minimum of 8 students to create Teams",
            );
          },
        );
      });
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 54, 93),
          title: const Text('Team Maker'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Students to be Teamed ..",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 117, 189, 222),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0,10.0,8.0,30.0),
                child: Center(
                  child: Text(
                    "\n${widget.studentList.join(', ')}",
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Wrap(
              children: divideStudents(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pop(
                      context,
                    );
                  });
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
                        "Back",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
