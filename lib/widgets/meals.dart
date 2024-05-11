import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepie_app/controller/category_controller.dart';
import 'package:recepie_app/controller/meal_details_controller.dart';
import 'package:recepie_app/views/meal_details.dart';

class MealWidget extends StatelessWidget {
  MealWidget({super.key});
  var mealController = Get.find<CategoryController>();
  var detail = Get.find<MealDetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mealController.mealBasket.value.meals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        print(mealController.isLoading);
                        Get.to(() => MealView());
                        detail.getMealDetails(mealController
                            .mealBasket.value.meals[index].idMeal);
                      },
                      child: Card(
                          child: Image.network(
                              '${mealController.mealBasket.value.meals[index].strMealThumb}')));
                })
          ],
        ));
  }
}
