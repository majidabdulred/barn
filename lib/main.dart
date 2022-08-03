import 'package:get/get.dart';
import 'package:majidapp/commonmodule/AppString.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:majidapp/pages/mainPage.dart';
Future<void> main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.fetchApiData,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeView(),
    );
  }
}
