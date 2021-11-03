import 'package:get/get.dart';
import 'package:grroom_tinder_lite/core/controller/list_data_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListDataController());
  }
}