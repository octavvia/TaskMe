import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/utils/constants.dart';
import '../custom_circle_container.dart';

class TaskStatusHeader extends StatelessWidget {
  const TaskStatusHeader({Key? key, required this.taskStatus})
      : super(key: key);

  final TaskStatus taskStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
          ),
        ),
        Text(
          taskStatus.name == "favorite"
              ? 'Favorites Tasks'
              : 'Tasks ${taskStatus.name.capitalize}',
          style: kTextStyleBoldBlack(22),
        ),
        CustomCircleContainer(
          child: Icon(
            taskStatus.icon,
            size: 24,
          ),
        ),
      ],
    );
  }
}
