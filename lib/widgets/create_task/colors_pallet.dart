import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/task_controller.dart';
import '../../utils/constants.dart';

class ColorsPallet extends StatelessWidget {
  ColorsPallet({Key? key}) : super(key: key);
  final TaskController _taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: colors.length,
        itemBuilder: (ctx, index) {
          final color = colors[index];
          return Obx(() {
            return InkWell(
              onTap: () {
                _taskController.selectedColor.value = index;
              },
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 1,
                    color: color.withOpacity(0.2),
                  ),
                ),
                child: _taskController.selectedColor.value == index
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
            );
          });
        },
      ),
    );
  }
}
