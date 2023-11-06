import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
   Counter({super.key,required this.toDoTasks,required this.calculator});
  int toDoTasks, calculator;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$calculator/$toDoTasks",
      style: TextStyle(
          color :calculator==toDoTasks? Colors.green:Colors.white, 
          fontSize: 40,
           fontWeight: FontWeight.bold),
    );
    ;
  }
}
