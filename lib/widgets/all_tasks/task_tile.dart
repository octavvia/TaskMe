import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/models/task_model.dart';
import '../../utils/constants.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: _customContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title.toString(),
                  style: kTextStyleBoldBlack(20),
                  softWrap: false,
                ),
                Text(
                  task.description.toString(),
                  style: kTextStyleBlack(16),
                  maxLines: 2,
                ),
                Text(task.time.toString(), style: kTextStyleBoldBlack(20)),
              ],
            ),
            size: 0.8,
          ),
        ),
        const SizedBox(width: 2),
        _customContainer(
          child: Center(
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.status.toString(),
                style: kTextStyleBoldBlack(20),
              ),
            ),
          ),
          size: 0.15,
        ),
      ],
    );
  }

  Widget _customContainer({required Widget child, required double size}) {
    return Container(
      height: 160,
      width: Get.width * size,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: colors[task.color as int].withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
