import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fotoflu/routes/app_routes.dart';
import 'package:fotoflu/routes/app_pages.dart';
import 'package:fotoflu/db/isar_service.dart';
import 'package:fotoflu/controllers/storage_controller.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService().init();
  await GetStorage.init();
  Get.put(StorageController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.key,
      getPages: AppPages.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.home,
    );
  }
}
