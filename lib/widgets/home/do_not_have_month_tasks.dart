import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';

class DoNotHaveMonthTasks extends StatelessWidget {
  const DoNotHaveMonthTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You don't have tasks for",
            style: kTextStyleBoldBlack(30),
          ),
          Row(
            children: [
              Text(
                "this month yet!",
                style: kTextStyleBoldBlack(30),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.getCreateTaskRoute());
                  },
                  child: Text(
                    "Create One",
                    style: kTextStyleBoldAmber(20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
