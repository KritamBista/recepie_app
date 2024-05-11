import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepie_app/controller/area_controller.dart';
import 'package:recepie_app/views/area_meals.dart';

class AreaWidget extends StatelessWidget {
  AreaWidget({super.key});
  var areaController = Get.find<AreaController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(child:Text("Select Cuntries") ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: areaController.areaBasket.value.meals.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // print(
                          //     " The length is:${areaController.meal.value.meals.length}");
                          print("Kritam Bista");
                          Get.to(() => AreaMealView());
            
                          areaController.getMealByArea(areaController
                              .areaBasket.value.meals[index].strArea);
                        },
                        child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                              child: Text(
                                '${areaController.areaBasket.value.meals[index].strArea}',
                                style: TextStyle(fontSize: 30),
                              ),
                            )),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
