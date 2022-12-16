import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/widgets/home/today_task_tile.dart';
import '../../controllers/task_controller.dart';
import '../../models/task_model.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';

class DisplayTodayTasks extends StatelessWidget {
  const DisplayTodayTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<TaskController>(
      builder: (controller) {
        final tasks = controller.todayTasksList;
        return SizedBox(
          height: tasks.isEmpty ? 180 : 210,
          child: tasks.isEmpty
              ? const DoNotHaveTaskToday()
              : HasTodayTask(tasks: tasks),
        );
      },
    );
  }
}

class HasTodayTask extends StatelessWidget {
  const HasTodayTask({Key? key, required this.tasks}) : super(key: key);

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
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
          child: TodayTaskTile(task: task),
        );
      },
    );
  }
}

class DoNotHaveTaskToday extends StatelessWidget {
  const DoNotHaveTaskToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You don't have task \nfor this day!",
              style: kTextStyleBlack(23),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(MyRoutes.getCreateTaskRoute());
              },
              child: Text(
                "Click Here to Create One",
                style: kTextStyleBoldBlack(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
