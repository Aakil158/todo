import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialouge_box.dart';
import 'package:todo/util/todoTile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // hive box
  final _todobox = Hive.box('todobox');

final _controller = TextEditingController();

@override
void initState(){

//if the app is opened for 1st time ever
if(_todobox.get("TODOLIST") == null){
  db.createInitData();
}else{
  db.loadData();
}

   super.initState();
}
//Database
ToDODb db=ToDODb();

  void checkBoxChange(bool? value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateData();
  }
  //Save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }
  //Create a new task
  void creatNewTask(){
   showDialog (context: context,
        builder: (context){
      return dialogue(controller: _controller,
      onSave: saveNewTask,
      onCancel: Navigator.of(context).pop,
      );
        }
    );
  }
  //delete task
  void deleteTask(int index){
     setState(() {
       db.toDoList.removeAt(index);
     });
     db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.red,
        title: Center(
          child: Text('TO-DO'),
        ),
      ),
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context , index){
          return TodoTile(
              taskName: db.toDoList[index][0],
              taskCount: db.toDoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFunction: (context) => deleteTask(index),
              );
        },
      ),
    );
  }
}
