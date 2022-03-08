import 'package:get/get.dart';
import 'package:test_ussho/controller/controller_chat.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ControllerChat());
  }
}
