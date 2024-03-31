import 'package:get/get.dart';

import '../../controller/example_view_model.dart';

class PostExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExampleViewModel());
  }
}