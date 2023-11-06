// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/Model/module.dart';
import 'package:to_do_app/myapp.dart';

class CustomContanier extends StatelessWidget {
  CustomContanier(
      {super.key,
      required this.vartatitle,
      required this.check,
      required this.MOvvingbetewwnTask,
      required this.indexfunc,
      required this.delete});

  final String vartatitle;
  final bool check;
  final Function MOvvingbetewwnTask;
  final int indexfunc;
  final Function delete;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MOvvingbetewwnTask(indexfunc);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 66),
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Color.fromRGBO(209, 224, 224, 0.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
                vartatitle,
                style: TextStyle(fontSize: 22, color:check?  Color.fromARGB(255, 22, 22, 22):Colors.white,
                decoration:check? TextDecoration.lineThrough:TextDecoration.none,
                ),

              ),
              SizedBox(
                width: 25,
              ),
              Icon(check ? Icons.check : Icons.close,
                  size: 27, color: check ? Colors.green : Colors.red),
              IconButton(
                onPressed: () {
                  delete(indexfunc);
                },
                icon: Icon(Icons.delete),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
