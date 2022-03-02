import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './utils/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.tag,
      getPages: routes,
    );
  }
}
