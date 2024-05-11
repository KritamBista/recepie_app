import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepie_app/controller/area_controller.dart';
import 'package:recepie_app/controller/meal_details_controller.dart';
import 'package:recepie_app/views/meal_details.dart';

class AreaMealView extends StatelessWidget {
  AreaMealView({super.key});
  var mealCon = Get.find<AreaController>();
  var details = Get.find<MealDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: Obx(
        () {
          return Column(
            children: [
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: mealCon.meal.value.meals.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => MealView());
                        details.getMealDetails(
                            mealCon.meal.value.meals[index].idMeal);
                      },
                      child: Card(
                          child: Image.network(
                              '${mealCon.meal.value.meals[index].strMealThumb} ')),
                    );
                  })
            ],
          );

          ;
        },
      ),
    );
  }
}
