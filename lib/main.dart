import 'package:ecom_3/app/utils/memory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Memory.init();
  var token = Memory.getToken();
  var role = Memory.getRole();
  var isHospital = role == 'hospital';
  var isAdmin = role == 'admin';
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: token == null
          ? Routes.LOGIN
          : isHospital
              ? Routes.HOSPITAL_MAIN
              : isAdmin
                  ? Routes.ADMIN_MAIN
                  : Routes.MAIN,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
    ),
  );
}
