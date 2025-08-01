import 'package:assignment_manager/data/database.dart';
import 'package:assignment_manager/util/todo_tile.dart';
import 'package:flutter/material.dart';

class TilesLayout extends StatelessWidget {
  final ToDoDataBase db;

  final Function(bool?, int) onChanged;
  final Function(int) onDelete;

  const TilesLayout({
    super.key,
    required this.db,
    required this.onChanged, // Add to constructor
    required this.onDelete, // Add to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            "My Tasks",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskTitle: db.toDoList[index][0],
                taskContent: db.toDoList[index][1],
                taskDateTime: db.toDoList[index][2] ?? DateTime.now(),
                taskCompleted: db.toDoList[index][3],
                onChanged: (value) => onChanged(value, index),
                deleteFunction: (context) => onDelete(index),
              );
            },
          ),
        ),
      ],
    );
  }
}