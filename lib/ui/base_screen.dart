import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/router/screen_name.dart';
import 'package:get/get.dart';

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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(ScreensNames.getExample);
                    },
                    child: const Text("GET"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(ScreensNames.postExample);
                    },
                    child: const Text("POST"),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("v - 1.0.0"),
                  Text("Made with ❤️ by iamageo"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

