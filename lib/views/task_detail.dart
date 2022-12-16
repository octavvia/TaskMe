import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/controllers/task_controller.dart';
import 'package:taskme/models/task_model.dart';
import 'package:taskme/utils/constants.dart';
// import 'package:taskme/widgets/custom_button.dart';
import 'package:taskme/widgets/custom_botton.dart';
import 'package:taskme/widgets/task_detail/task_detail_header.dart';

class TaskDetail extends StatelessWidget {
  TaskDetail({Key? key}) : super(key: key);
  final TaskController _taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    final task = Get.arguments['task'] as TaskModel;
    final Color color = colors[task.color as int];
    final int id = task.id as int;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskDetailHeader(
                onTap: task.isFavorite == 1
                    ? () {
                        _taskController.removeFromFav(id);
                        Get.back();
                      }
                    : () {
                        _taskController.updateTaskAsFav(id);
                        Get.back();
                      },
                isFav: task.isFavorite as int,
              ),
              kVerticalSpace(25),
              Text(
                '${task.title}',
                style: kTextStyleBlack(24),
              ),
              kVerticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRow(
                    color: color,
                    label: '${task.date}',
                    icon: Icons.calendar_month_sharp,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, color: color),
                    ),
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                  ),
                  CustomRow(
                    color: color,
                    label: '${task.time}',
                    icon: Icons.access_time_rounded,
                  ),
                ],
              ),
              kVerticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRow(
                    color: color,
                    label: 'Status: ${task.status}',
                    icon: task.status == 'Done'
                        ? Icons.done
                        : Icons.incomplete_circle,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      _taskController.shareTask(
                        title: '${task.title}',
                        description: '${task.description}',
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomRow(
                        color: color,
                        label: 'Share',
                        icon: Icons.share,
                      ),
                    ),
                  ),
                ],
              ),
              kVerticalSpace(25),
              Text(
                'Description',
                style: kTextStyleBoldBlack(24),
              ),
              Text(
                '${task.description}',
                style: kTextStyleBlack(18),
              ),
              kVerticalSpace(50),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Done',
                      color: task.isDone == 1
                          ? Colors.grey.withOpacity(0.3)
                          : Colors.green.withOpacity(0.3),
                      onTap: task.isDone == 1
                          ? null
                          : () {
                              //final int id = task?.id as int;
                              _taskController.updateTaskAsDone(id);
                              _taskController.updateTaskStatus(id, 'Done');
                              Get.back();
                            },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      label: 'Delete',
                      color: Colors.red.withOpacity(0.3),
                      onTap: () {
                        _taskController.delete(task);
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow(
      {Key? key, required this.label, required this.icon, required this.color})
      : super(key: key);

  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(width: 10),
        Text(label, style: kTextStyleBlack(18), softWrap: true),
      ],
    );
  }
}
