import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/ui/post_example_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'get_example_screen.dart';

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
                  Get.to(() => const ExampleScreen());
                },
                child: const Text("GET")),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const PostExampleScreen());
                },
                child: const Text("POST"))
          ],
        ),
      ),
    );
  }
}
