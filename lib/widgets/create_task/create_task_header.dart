import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/widgets/custom_botton.dart';

class CreateTaskHeader extends StatelessWidget {
  const CreateTaskHeader({Key? key, this.onSaved}) : super(key: key);

  final VoidCallback? onSaved;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
          ),
        ),
        CustomButton(
          onTap: onSaved,
          label: 'Save Task',
        ),
      ],
    );
  }
}
