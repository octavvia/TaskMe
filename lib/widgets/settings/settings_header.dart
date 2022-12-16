import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../custom_circle_container.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({Key? key}) : super(key: key);

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
          "Settings",
          style: kTextStyleBoldBlack(22),
        ),
        const CustomCircleContainer(
          child: Icon(Icons.settings),
        ),
      ],
    );
  }
}
