import 'package:ecom_3/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.MAIN,
      getPages: AppPages.routes,
      // home: HomeView(),
    ),
  );
}
