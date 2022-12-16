import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/models/task_model.dart';
import 'package:taskme/utils/constants.dart';
import '../../controllers/task_controller.dart';
import '../../utils/routes.dart';
import '../all_tasks/task_tile.dart';

class DisplayTasksByStatus extends StatelessWidget {
  DisplayTasksByStatus({Key? key, required this.status}) : super(key: key);
  final String status;
  final TaskController _taskController = Get.put(TaskController());
  List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (status == TaskStatus.favorite.name) {
        tasks.assignAll(_taskController.favTask);
      } else {
        tasks.assignAll(_taskController.tasksByStatus);
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Get.toNamed(
                MyRoutes.getTaskDetailRoute(),
                arguments: {'task': task},
              );
            },
            child: TaskTile(task: task),
          );
        },
      );
    });
  }
}
