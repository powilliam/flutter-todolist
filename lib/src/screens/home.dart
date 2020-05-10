import 'dart:math';

import 'package:flutter/material.dart';
import 'package:TodoList/src/components/Todo.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List<Color> colors = <Color>[Colors.lightBlue, Colors.pink, Colors.purple];
  List todos = [];

  int generateRandomNumber(int min, int max) {
    Random random = new Random();
    return min + random.nextInt(max - min);
  }

  Color getRandomColor() {
    int randomIndex = generateRandomNumber(0, colors.length - 1);
    return colors[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.create, color: Colors.white, size: 24,),
        label: Text("Create"),
        backgroundColor: Colors.red,
        elevation: 5,
        tooltip: "Write a to'do",
        onPressed: () {
          setState(() {
            todos.add('Learn flutter');
          });
        },
        splashColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            sectionTitle(),
            todoList()
          ],
        ),
      )
    );
  }

  Widget sectionTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: 75,
        left: 25
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        "Your to'dos",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w100,
          color: Colors.black87
        )
      ),
    );
  }

  Widget todoList() {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(
          top: 25,
        ),
        child: ListView.builder(
          padding: EdgeInsets.only(
            bottom: 75,
            top: 25,
            left: 25,
            right: 25
          ),
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: new ObjectKey(Random().toString()), 
              onDismissed: (direction) {
                setState(() {
                  todos.removeAt(index);
                });
              },
              child: Todo(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: getRandomColor(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5)
                          )
                        ),
                        child: Center(
                          child: Icon(
                            Icons.timer,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10
                        ),
                        child: Text(
                          todos[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ));
          },
        )
      ),
    );
  }
}