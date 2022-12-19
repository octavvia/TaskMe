import 'package:flutter/material.dart';
import 'package:taskme/utils/constants.dart';
import 'package:taskme/widgets/custom_circle_container.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, this.pressToOpenDrawer}) : super(key: key);

  final VoidCallback? pressToOpenDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child: IconButton(
            // color: Colors.blue,
            onPressed: pressToOpenDrawer,
            icon: const Icon(Icons.menu_outlined),
          ),
        ),
        Text('Task Me', style: kTextStyleBoldBlack(24)),
        const CustomCircleContainer(
          child: Icon(Icons.person),
        ),
      ],
    );
  }
}
