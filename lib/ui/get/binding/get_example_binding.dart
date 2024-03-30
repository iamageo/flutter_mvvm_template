import 'package:get/get.dart';

import '../../controller/example_view_model.dart';

class GetExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExampleViewModel());
  }
}