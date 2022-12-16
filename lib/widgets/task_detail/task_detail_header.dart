import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/utils/constants.dart';
import 'package:taskme/widgets/custom_circle_container.dart';

class TaskDetailHeader extends StatelessWidget {
  const TaskDetailHeader({Key? key, this.onTap, required this.isFav})
      : super(key: key);

  final VoidCallback? onTap;
  final int isFav;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, size: 28),
          ),
        ),
        Text(
          'Task Detail',
          style: kTextStyleBoldBlack(24),
        ),
        CustomCircleContainer(
          child: IconButton(
            onPressed: onTap,
            icon: isFav == 1
                ? const Icon(Icons.favorite_outlined, size: 24)
                : const Icon(Icons.favorite_border, size: 24),
          ),
        )
      ],
    );
  }
}
