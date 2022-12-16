import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/controllers/task_controller.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  //bottomRight: Radius.circular(20),
                  //bottomLeft: Radius.circular(20)),),
                  ),
              color: Colors.blue.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                'By Vviia',
                style: kTextStyleBoldBlack(24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItem(
                  icon: Icons.home,
                  label: 'Home',
                  onPressed: () => Get.back(),
                ),
                kVerticalSpace(16),
                DrawerItem(
                  icon: Icons.favorite,
                  label: 'Favorite',
                  onPressed: () {
                    _taskController.getTaskByStatus(TaskStatus.favorite);
                    Get.toNamed(
                      MyRoutes.getTasksByStatusRoute(),
                      arguments: {"status": TaskStatus.favorite},
                    );
                  },
                ),
                kVerticalSpace(16),
                DrawerItem(
                  icon: Icons.create,
                  label: 'Create Task',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getCreateTaskRoute());
                  },
                ),
                kVerticalSpace(16),
                DrawerItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getSettingsPageRoute());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.amber),
          const SizedBox(width: 10),
          Text(
            label,
            style: kTextStyleBlack(20),
          ),
        ],
      ),
    );
  }
}
