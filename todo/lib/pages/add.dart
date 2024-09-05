import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';
import 'package:todo/navbar.dart';
import 'package:todo/pages/Home.dart';
import 'package:todo/util/dialouge_box.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {

//Database
ToDODb db=ToDODb();

final _controller = TextEditingController();

void saveNewTask(){
  setState(() {
    db.toDoList.add([ _controller.text, false]);
  });
  Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> Navbar())
        );
  Navigator.of(context).pop();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 189, 255),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: dialogue(
          controller: _controller, 
          onSave: saveNewTask, 
          onCancel: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> Navbar())
        ))
      ),
    );
  }
}