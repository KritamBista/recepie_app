import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepie_app/model/meal_details.dart';
import 'package:recepie_app/services/meal_service.dart';

class MealDetailController extends GetxController {
  var isLoading = false.obs;
  var meal = MealDetails(meals: []).obs;
  Future getMealDetails(mealId) async {
    try {
      isLoading(true);
      var data = await MealServie.fetchMeaDeatails(mealId);
      if (data != null) {
        meal.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
      debugPrint("Connection Closed");
    }
  }
}
