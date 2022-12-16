import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

class TaskStatusContainer extends StatelessWidget {
  const TaskStatusContainer({Key? key, required this.status}) : super(key: key);
  final TaskStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: status.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                color: status.color,
                width: 2,
              ),
            ),
            child: Icon(status.icon, color: status.color, size: 30),
          ),
          // ),
          kVerticalSpace(10),
          Text('${status.name.capitalize}', style: kTextStyleBoldBlack(18))
        ],
      ),
    );
  }
}
