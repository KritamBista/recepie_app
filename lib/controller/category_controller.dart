import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepie_app/model/category_model.dart';
import 'package:recepie_app/model/meal_model.dart';
import 'package:recepie_app/services/category_service.dart';

class CategoryController extends GetxController {
  var categoryBasket = FoodCategoryModel(categories: []).obs;
  var isLoading = false.obs;
  var mealBasket = MealModel(meals: []).obs;

  Future getCategores() async {
    try {
      isLoading(true);
      var data = await CategoryService.fetchCategories();
      if (data != null) {
        categoryBasket.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
      print("category controller");
      // debugPrint("Hey");
    }
  }

  Future getMealsByCategory(cat) async {
    try {
      isLoading(true);
      var datax = await CategoryService.fetchMealByCategory(cat);
      if (datax != null) {
        mealBasket.value = datax;
      }
    } catch (e) {
      print(e);
    } finally {
      debugPrint("Category");
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    getCategores();
  
    // getMealsByCategory('Seafood');
  }
}
