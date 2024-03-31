import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/router/screen_name.dart';
import 'package:flutter_mvvm_template/ui/post/post_example_screen.dart';
import 'package:get/get.dart';
import 'get/get_example_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM Flutter Template"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(ScreensNames.getExample);
                },
                child: const Text("GET")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(ScreensNames.postExample);
                },
                child: const Text("POST"))
          ],
        ),
      ),
    );
  }
}
