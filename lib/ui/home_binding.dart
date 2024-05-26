import 'package:get/instance_manager.dart';
import 'package:sd/ui/home_controller.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'paris'));
  }
}