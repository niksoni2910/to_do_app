import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskdata, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskdata.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (cheboxState) {
                  taskdata.updateTask(task);
                },
                longPressCallBack: () {
                  taskdata.deleteTask(task);
                },
                );
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
