import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepie_app/model/areaMeal.dart';
import 'package:recepie_app/model/area_models.dart';
import 'package:recepie_app/services/area_service.dart';

class AreaController extends GetxController {
  var isLoading = true.obs;

  var areaBasket = AreaModel(meals: []).obs;
  var meal = AreaMealModel(meals: []).obs;
  Future getArea() async {
    try {
      isLoading(true);
      var datay = await AreaService.fetchArea();
      if (datay != null) {
        areaBasket.value = datay;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);

      print("meal controller");
    }
  }

  Future getMealByArea(country) async {
    try {
      isLoading(true);
      var dataZ = await AreaService.filterMeals(country);
      if (dataZ != null) {
        meal.value = dataZ;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
      debugPrint("all fine");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getArea();
    super.onInit();
  }
}
