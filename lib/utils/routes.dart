import 'package:get/get.dart';
import 'package:taskme/views/all_tasks_page.dart';
import 'package:taskme/views/create_task_page.dart';
import 'package:taskme/views/home_page.dart';
import 'package:taskme/views/setting_page.dart';
import 'package:taskme/views/task_detail.dart';
import 'package:taskme/views/task_by_status.dart';

class MyRoutes {
  static const String _home = "/";
  static const String _allTasks = "/AllTasksPage";
  static const String _createTask = "/CreateTaskPage";
  static const String _taskDetail = "/TaskDetail";
  static const String _tasksByStatus = "/TasksByStatus";
  static const String _settingsPage = "/SettingsPage";
  static const Duration _duration = Duration(milliseconds: 400);

  static String getHomeRoute() => _home;
  static String getAllTasksPageRoute() => _allTasks;
  static String getCreateTaskRoute() => _createTask;
  static String getTaskDetailRoute() => _taskDetail;
  static String getTasksByStatusRoute() => _tasksByStatus;
  static String getSettingsPageRoute() => _settingsPage;

  static List<GetPage> routes = [
    GetPage(
      name: _home,
      page: () => HomePage(),
      transition: Transition.fade,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _allTasks,
      page: () => const AllTasksPage(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _createTask,
      page: () => CreateTaskPage(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _taskDetail,
      page: () => TaskDetail(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _tasksByStatus,
      page: () => const TasksByStatus(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    ),
    GetPage(
      name: _settingsPage,
      page: () => const SettingsPage(),
      transition: Transition.zoom,
      transitionDuration: _duration,
    )
  ];
}
