import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskme/db/db_helper.dart';
import 'package:taskme/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyRoutes.getHomeRoute(),
      getPages: MyRoutes.routes,
    );
  }
}
