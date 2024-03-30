import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/ui/base_screen.dart';
import 'package:flutter_mvvm_template/ui/controller/example_view_model.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onInit: () {
        Get.put(ExampleViewModel(), permanent: true);
      },
      home: const BaseScreen(),
    );
  }
}