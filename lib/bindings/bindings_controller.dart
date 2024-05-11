import 'package:get/get.dart';
import 'package:recepie_app/controller/area_controller.dart';
import 'package:recepie_app/controller/category_controller.dart';
import 'package:recepie_app/controller/meal_details_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CategoryController());
    Get.put(MealDetailController());
    Get.put(AreaController());
  }

}
