import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:assignment_manager/data/database.dart';
import '../constants/colors.dart';

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
            Text('${completedPercent.toString()} %', 
            style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w200)),
            PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: [
                  PieChartSectionData(
                    gradient: LinearGradient(
                      colors: [
                        gradientColor1,
                        gradientColor2,
                        gradientColor3,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
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