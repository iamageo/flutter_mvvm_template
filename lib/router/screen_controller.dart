import 'package:flutter_mvvm_template/router/screen_name.dart';
import 'package:flutter_mvvm_template/ui/base_screen.dart';
import 'package:flutter_mvvm_template/ui/get/binding/get_example_binding.dart';
import 'package:flutter_mvvm_template/ui/get/get_example_screen.dart';
import 'package:flutter_mvvm_template/ui/post/binding/post_example_binding.dart';
import 'package:flutter_mvvm_template/ui/post/post_example_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppScreens {

  static final screens = <GetPage>[
    GetPage(name: ScreensNames.home, page: () => const BaseScreen()),
    GetPage(name: ScreensNames.getExample, page: () => const GetExampleScreen(), bindings: [GetExampleBinding()]),
    GetPage(name: ScreensNames.postExample, page: () => const PostExampleScreen(), bindings: [PostExampleBinding()]),
  ];

}
