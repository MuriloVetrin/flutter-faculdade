import 'package:flutter/material.dart';
import 'package:your_app/models/student.dart';
import 'package:your_app/screens/student_details_screen.dart';

class StudentItem extends StatelessWidget {
  final Student student;

  StudentItem({required this.student});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(student.name),
      subtitle: Text(student.course),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDetailsScreen(student: student),
          ),
        );
      },
    );
  }
}
