import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCount,
    required this.onChanged,
    required this.deleteFunction,
  });
  final String taskName;
  final bool taskCount;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StretchMotion(),
        ),
        children: [
          SlidableAction(onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(15),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding :EdgeInsets.all(15) ,
          child: Row(
            children: [
              Checkbox(value: taskCount, onChanged: onChanged),
              Text(taskName,
              style: TextStyle(
                decoration: taskCount
                    ?TextDecoration.lineThrough
                    :TextDecoration.none
              ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.red,
                borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
