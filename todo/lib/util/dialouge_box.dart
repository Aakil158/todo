import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dialogue extends StatelessWidget {
   
  final controller;
VoidCallback onSave;
VoidCallback onCancel;

dialogue({super.key,
required this.controller,
required this.onSave,
required this.onCancel,
});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        width: 300, height: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 4,
          color: Colors.red),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
        ),
        child: Column(children: [
          //entering text
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red,
                  width: 5)
                  ),
                  disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red,
                  width: 5)
                  ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              //save button
              MaterialButton(onPressed: onSave,
              child: Text('Save',style: TextStyle(color: Colors.grey),),
              color: Colors.red,),
              
              //cancel button
              MaterialButton(onPressed: onCancel,
              child: Text('Cancel',style: TextStyle(color: Colors.grey),),
              color: Colors.red,),
            ],
          )
        ],),
      ),
    );
  }
}
