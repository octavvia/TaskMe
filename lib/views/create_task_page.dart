import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskme/controllers/task_controller.dart';
import 'package:taskme/utils/constants.dart';
import 'package:taskme/utils/routes.dart';
import 'package:taskme/widgets/create_task/custom_text_field.dart';
import 'package:taskme/widgets/custom_botton.dart';
import '../widgets/create_task/colors_pallet.dart';
import '../widgets/create_task/create_task_header.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateTaskHeader(
                onSaved: _validateTextTitleDescription,
              ),
              kVerticalSpace(30),
              CustomTextField(
                controller: _titleController,
                label: 'Task title',
                hintText: 'Task title',
              ),
              Obx(() {
                final selectedDate = _taskController.selectedDate.value;
                final selectedTime = _taskController.selectedTime.value;
                return Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        readOnly: true,
                        label: ('Date'),
                        hintText: DateFormat.yMd().format(selectedDate),
                        onTap: () => _chooseDate(context),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        readOnly: true,
                        label: ('Time'),
                        hintText: formattingTimeOfDay(selectedTime),
                        onTap: () => _chooseTime(context),
                      ),
                    ),
                  ],
                );
              }),
              CustomTextField(
                controller: _descriptionController,
                label: ('Description'),
                hintText: 'Description ...',
              ),
              Text('Color', style: kTextStyleBoldBlack(20)),
              ColorsPallet(),
            ],
          ),
        ),
      ),
    );
  }

  _validateTextTitleDescription() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      _createTask();
    } else {
      Get.defaultDialog(
        title: 'Empty field',
        middleText: 'Task title and description \ncannot be empty',
        titleStyle: kTextStyleBoldBlack(24),
        cancel: CustomButton(
          onTap: () => Get.back(),
          label: 'OKAY',
          color: Colors.red.withOpacity(0.3),
        ),
        backgroundColor: Colors.amber,
      );
    }
  }

  _createTask() async {
    final String title = _titleController.text;
    final String description = _descriptionController.text;
    _taskController.addTask(title, description).then((value) {
      Get.snackbar(
        'Task Saved',
        'Task successfully saved',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed(MyRoutes.getHomeRoute());
    });
  }

  _chooseTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _taskController.selectedTime.value,
    );
    if (pickedTime != null) {
      _taskController.selectedTime.value = pickedTime;
    }
  }

  _chooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      _taskController.selectedDate.value = pickedDate;
    }
  }
}
