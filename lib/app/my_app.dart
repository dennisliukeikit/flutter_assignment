import 'package:assignment/app/core/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Assignment",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
