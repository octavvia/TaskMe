import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/setting_controller.dart';
import '../../utils/constants.dart';
import '../create_task/custom_text_field.dart';
import 'package:taskme/widgets/custom_botton.dart';

class DisplayName extends StatelessWidget {
  DisplayName({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final SettingsController _settingController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    _nameController.text = _settingController.username.value;
    return Row(
      children: [
        Obx(() {
          return Text(
            _settingController.username.value,
            style: kTextStyleBoldBlack(24),
            maxLines: 1,
          );
        }),
        IconButton(
          onPressed: () => _showDialog(context),
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          content: SizedBox(
            height: Get.height * 0.25,
            child: Column(
              children: [
                Text('Enter Your Name', style: kTextStyleBoldBlack(20)),
                CustomTextField(
                  controller: _nameController,
                  label: '',
                  hintText: 'Write Your Name here...',
                ),
                CustomButton(
                  onTap: _saveNameToStorage,
                  label: 'Save',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _saveNameToStorage() {
    if (_nameController.text.trim().isNotEmpty) {
      final name = _nameController.text.trim();
      _settingController.saveName(name);
      Get.back();
    } else {
      Get.snackbar(
        'Name is Empty',
        "Name can't be empty Please!",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
