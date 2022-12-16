import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taskme/db/db_helper.dart';
import 'package:taskme/models/task_model.dart';
import '../services/notification_service.dart';
import '../utils/constants.dart';

class TaskController extends GetxController {
  var tasksList = <TaskModel>[].obs;
  var favTask = <TaskModel>[].obs;
  var tasksByStatus = <TaskModel>[].obs;
  var filteredTasks = <TaskModel>[].obs;
  var todayTasksList = <TaskModel>[].obs;
  int get tasksLength => tasksList.length;
  var taskById = <TaskModel>[].obs;
  var selectedColor = 0.obs;
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  var filteredDate = DateTime.now().obs;
  final NotificationService _notificationService = NotificationService();

  @override
  void onInit() {
    _notificationService.initNotification();
    _notificationService.requestIOSPermission();
    getAllTasks();
    super.onInit();
  }

  void _getTodayTasks() {
    final today = DateFormat.yMd().format(DateTime.now());
    Set<TaskModel> items = {};
    for (var task in tasksList) {
      if (task.date == today) {
        items.add(task);
      }
    }
    todayTasksList.assignAll(items.toList());
  }

  void _changeTaskStatusAutomatically() {
    final date = DateFormat.yMd().format(DateTime.now());
    var time = formattingTimeOfDay(TimeOfDay.now());
    for (var task in tasksList) {
      if (task.date == date && task.time == time) {
        updateTaskStatus(task.id as int, 'Progress');
      }
    }
  }

  Future<void> addTask(String title, String description) async {
    final TaskModel newTask = TaskModel(
      title: title.trim(),
      description: description.trim(),
      isDone: 0,
      isFavorite: 0,
      date: DateFormat.yMd().format(selectedDate.value),
      time: formattingTimeOfDay(selectedTime.value),
      color: selectedColor.value,
      status: 'Todo',
    );
    final int id = await DBHelper.insert(newTask);
    _notificationService.scheduleNotification(newTask, id);
  }

  void getAllTasks() async {
    List<Map<String, dynamic>> tasks =
        await DBHelper.query() as List<Map<String, dynamic>>;
    tasksList.value = tasks.map((data) => TaskModel.fromJson(data)).toList();
    _getTodayTasks();
    _changeTaskStatusAutomatically();
    getFilteredTasksByDate();
  }

  void getFilteredTasksByDate() {
    final selectedDate = DateFormat.yMd().format(filteredDate.value);
    filteredTasks.clear();
    for (TaskModel task in tasksList) {
      if (task.date == selectedDate) {
        filteredTasks.add(task);
      }
    }
  }

  void getTaskByStatus(TaskStatus status) {
    tasksByStatus.clear();
    favTask.clear();
    for (TaskModel task in tasksList) {
      if (task.status == '${status.name.capitalize}') {
        tasksByStatus.add(task);
      }
      if (task.isFavorite == 1) {
        favTask.add(task);
      }
    }
  }

  void delete(TaskModel task) async {
    await DBHelper.delete(task);
    getAllTasks();
  }

  void updateTaskAsDone(int id) async {
    await DBHelper.update(id);
    getAllTasks();
  }

  void updateTaskAsFav(int id) async {
    await DBHelper.updateFav(id);
    getAllTasks();
  }

  void removeFromFav(int id) async {
    await DBHelper.removeFav(id);
    getAllTasks();
  }

  void updateTaskStatus(int id, String status) async {
    await DBHelper.updateTaskStatus(id, status);
    getAllTasks();
  }

  void shareTask({required String title, required String description}) async {
    await Share.share(
      'Title: $title\n$description',
      subject: 'Share Task: $title',
    );
  }

  void getTaskById(int id) async {
    List<Map<String, dynamic>> task = await DBHelper.queryTaskById(id);
    taskById.assignAll(task.map((data) => TaskModel.fromJson(data)));
  }
}
