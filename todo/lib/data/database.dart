import 'package:hive/hive.dart';

class ToDODb{

 List toDoList = [

 ];

  // ref the hive box
  final _todobox = Hive.box('todobox');

  void createInitData(){
    toDoList = [
      ["Click add to add new task",false],
      ["Swipe right to delete task",false],
    ];
  }

  void loadData(){
    toDoList = _todobox.get("TODOLIST");
  }

  void updateData(){
    _todobox.put("TODOLIST", toDoList);
  }
}