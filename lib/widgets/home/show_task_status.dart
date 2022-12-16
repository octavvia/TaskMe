import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/widgets/home/task_status_container.dart';
import '../../controllers/task_controller.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';

class ShowTaskStatus extends StatelessWidget {
  ShowTaskStatus({Key? key}) : super(key: key);
  final TaskController _taskController = Get.find<TaskController>();
  @override
  Widget build(BuildContext context) {
    final listStatus = TaskStatus.values.toList();
    return SizedBox(
      height: 160,
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listStatus.length,
        itemBuilder: (ctx, index) {
          final status = listStatus[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => _goToTasksByStatus(status),
              borderRadius: BorderRadius.circular(60),
              child: TaskStatusContainer(status: status),
            ),
          );
        },
      ),
    );
  }

  _goToTasksByStatus(TaskStatus status) {
    _taskController.getTaskByStatus(status);
    Get.toNamed(
      MyRoutes.getTasksByStatusRoute(),
      arguments: {"status": status},
    );
  }
}
