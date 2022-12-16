import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/widgets/all_tasks/task_tile.dart';
import 'package:taskme/widgets/home/display_today_tasks.dart';
import '../../controllers/task_controller.dart';
import '../../utils/routes.dart';

class DisplayTasks extends StatelessWidget {
  DisplayTasks({Key? key}) : super(key: key);
  final TaskController _taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final tasks = _taskController.filteredTasks;
        return tasks.isNotEmpty
            ? ListView.builder(
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
              )
            : const DoNotHaveTaskToday();
      },
    );
  }
}
