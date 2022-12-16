import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskme/widgets/settings/settings_header.dart';
import '../utils/constants.dart';
import '../widgets/settings/display_name.dart';
import '../widgets/settings/icon_text_row.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsHeader(),
              kVerticalSpace(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(Icons.person, size: 24),
                  const SizedBox(width: 10),
                  Text('Username', style: kTextStyleBlack(20)),
                ],
              ),
              DisplayName(),
              Divider(thickness: 2, color: Colors.amber.withOpacity(0.3)),
              Text('Get in Touch With Dev', style: kTextStyleBlack(20)),
              Divider(thickness: 2, color: Colors.amber.withOpacity(0.3)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: SocialMedia.values.length,
                itemBuilder: (ctx, index) {
                  final socialMedias = SocialMedia.values.toList();
                  final socialType = socialMedias[index];
                  return IconTextRow(socialMedia: socialType);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
