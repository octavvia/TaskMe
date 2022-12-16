import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controllers/setting_controller.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

class IconTextRow extends StatelessWidget {
  IconTextRow({Key? key, required this.socialMedia}) : super(key: key);

  final SocialMedia socialMedia;
  final SettingsController _settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _settingController.openSelectedSocialMedia(socialMedia);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(socialMedia.icon, size: 24),
          const SizedBox(width: 10),
          Text('${socialMedia.name.capitalize}', style: kTextStyleBlack(20)),
        ],
      ),
    );
  }
}
