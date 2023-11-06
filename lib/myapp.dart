// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:to_do_app/Model/module.dart';
import 'package:to_do_app/widget/CustomContanier.dart';
import 'package:to_do_app/widget/counter.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final mycontroller = TextEditingController();

List allTasks = [
  AddTask(title: "title", status: false),
];

class _MyAppState extends State<MyApp> {
  addnewTask() {
    setState(() {
      allTasks.add(AddTask(title: mycontroller.text, status: false));
      
    });
  }

  delete(int clickesTask) {
    setState(() {
      allTasks.remove(allTasks[clickesTask]);
    });
  }

  deleteall() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  changeState(taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

  int calcStatusChecked() {
    int checkedtask = 0;
    allTasks.forEach((element) {
      if (element.status) {
        checkedtask++;
      }
    });
    return checkedtask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: mycontroller,
                      decoration: InputDecoration(
                        hintText: "Type your Task",
                        label: Text("task"),
                        prefixIcon: Icon(Icons.forward),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          addnewTask(
                            
                          );
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Add New TAsk",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(85, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              deleteall();
            },
            icon: Icon(Icons.delete_forever),
            color: Colors.white,
          )
        ],
        backgroundColor: Color.fromRGBO(85, 66, 86, 0.7),
        elevation: 0,
        title: Text(
          "TO DO APP",
          style: TextStyle(
              color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Counter(
              calculator: calcStatusChecked(),
              toDoTasks: allTasks.length,
            ),
            Container(
                height: 500,
                child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (context, int index) {
                    return CustomContanier(
                      check: allTasks[index].status,
                      vartatitle: allTasks[index].title,
                      MOvvingbetewwnTask: changeState,
                      indexfunc: index,
                      delete: delete,
                    );
                  },
                )),
          ]),
        ),
      ),
    );
  }
}
