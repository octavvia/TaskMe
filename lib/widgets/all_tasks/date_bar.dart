import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/task_controller.dart';
import '../../utils/constants.dart';

class DateBar extends StatelessWidget {
  DateBar({Key? key}) : super(key: key);
  final TaskController _taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Colors.amber.withOpacity(0.2),
        ),
      ),
      child: DatePicker(
        height: 120,
        width: 65,
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.amber.withOpacity(0.5),
        monthTextStyle: kTextStyleBoldBlack(16),
        dayTextStyle: kTextStyleBoldBlack(16),
        dateTextStyle: kTextStyleBoldBlack(18),
        onDateChange: (selectedDate) {
          _taskController.filteredDate.value = selectedDate;
          _taskController.getFilteredTasksByDate();
        },
      ),
    );
  }
}
