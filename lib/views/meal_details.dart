import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepie_app/controller/meal_details_controller.dart';

class MealView extends StatelessWidget {
  const MealView({super.key});

  @override
  Widget build(BuildContext context) {
    var mealDetailController = Get.find<MealDetailController>();
    return Scaffold(
        appBar: AppBar(
          leading: const Text("Meal Details"),
        ),
        body: Obx(() {
          if (mealDetailController.isLoading.value == true) {
            return CircularProgressIndicator();
          } else {
            return Column(
              children: [
                Image.network(
                    mealDetailController.meal.value.meals[0]['strMealThumb']),
                Text("${mealDetailController.meal.value.meals[0]['strMeal']}"),
                Text(
                    "${mealDetailController.meal.value.meals[0]['strCategory']}"),
                Text(
                    "${mealDetailController.meal.value.meals[0]['strInstructions']}")
              ],
            );
          }
        }));
  }
}
