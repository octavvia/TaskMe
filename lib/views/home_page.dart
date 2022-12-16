import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskme/utils/constants.dart';
import 'package:taskme/utils/routes.dart';
import 'package:taskme/widgets/home/app_bar.dart';
import 'package:taskme/widgets/home/do_not_have_month_tasks.dart';
import 'package:taskme/widgets/home/drawer.dart';
import '../controllers/setting_controller.dart';
import '../controllers/task_controller.dart';
import '../widgets/home/display_today_tasks.dart';
import '../widgets/home/search_tasks.dart';
import '../widgets/home/show_task_status.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TaskController _taskController = Get.put(TaskController());
  final SettingsController _settingController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                pressToOpenDrawer: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              kVerticalSpace(40),
              Obx(
                () {
                  final name = _settingController.username.value;
                  final tasks = _taskController.tasksList;
                  final tasksLength = _taskController.tasksLength;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${showGreeting()}, ${name.capitalize}',
                        style: kTextStyleBoldGrey(22.0),
                      ),
                      tasks.isEmpty
                          ? const DoNotHaveMonthTasks()
                          : Text(
                              'You have $tasksLength tasks\nthis month!',
                              style: kTextStyleBoldBlack(30),
                            ),
                    ],
                  );
                },
              ),
              kVerticalSpace(30),
              SearchTasks(),
              kVerticalSpace(30),
              ShowTaskStatus(),
              kVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today\'s Tasks', style: kTextStyleBoldBlack(30)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        MyRoutes.getAllTasksPageRoute(),
                      );
                    },
                    child: Text('See All', style: kTextStyleBoldGrey(18)),
                  )
                ],
              ),
              const DisplayTodayTasks(),
            ],
          ),
        ),
      ),
    );
  }
}
