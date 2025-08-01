import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:assignment_manager/data/database.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key, required this.db,});

  final ToDoDataBase db;

  @override
  Widget build(BuildContext context) {
    int totalTasks = db.toDoList.length;
    int completedTasks = db.toDoList.where((task) => task[3] == true).length;
    int remainingTasks = totalTasks - completedTasks;

    double completedPercent = totalTasks == 0 ? 0 : (completedTasks / totalTasks) * 100;
    double remainingPercent = totalTasks == 0 ? 0 : (remainingTasks / totalTasks) * 100;

    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: [
                  PieChartSectionData(
                    color: Color.fromARGB(255, 4, 81, 63),
                    value: completedPercent,
                    showTitle: false,
                    radius: 30,
                  ),
                  PieChartSectionData(
                    color: Colors.grey.shade800,
                    value: remainingPercent,
                    showTitle: false,
                    radius: 30,
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}