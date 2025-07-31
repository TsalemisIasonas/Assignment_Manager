import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskTitle;
  final String taskContent;
  final DateTime taskDateTime;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    super.key,
    required this.taskTitle,
    required this.taskContent,
    required this.taskDateTime,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Card(
        shadowColor: Color.fromARGB(255, 75, 171, 149),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color.fromARGB(255, 108, 107, 107)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 160,  // FIX: set fixed width to avoid infinite width error
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 26, 26),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromARGB(175, 255, 255, 255),
                width: 1.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Blue title bar on top
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Color.fromARGB(255, 11, 111, 88),
                  child: Text(
                    taskTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),

                // Slidable content area
                Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: deleteFunction,
                        icon: Icons.delete,
                        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
                        foregroundColor: Colors.red,
                      ),
                    ],
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    color: const Color.fromARGB(255, 26, 26, 26),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: taskCompleted,
                          onChanged: onChanged,
                          activeColor: Colors.white,
                          checkColor: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            taskContent,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              decoration: taskCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom datetime center aligned
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  child: Text(
                    "Due Date: "
                    "${taskDateTime.day.toString().padLeft(2,'0')}/"
                    "${taskDateTime.month.toString().padLeft(2,'0')}/"
                    "${taskDateTime.year}",
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
