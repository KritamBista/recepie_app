import 'package:flutter/material.dart';
import 'package:recepie_app/model/category_model.dart';
import 'package:recepie_app/model/meal_model.dart';
import 'package:recepie_app/utils/api.dart';

class CategoryService {
  static Future fetchCategories() async {
    try {
      var response = await Api.dio.get('categories.php');
      if (response.statusCode == 200) {
        return FoodCategoryModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
    print(e);
    } finally {
      debugPrint("Conncection closes");
    }
  }

  static Future fetchMealByCategory(var category) async {
    try {
      var response = await Api.dio.get('filter.php?c=$category');
      if(response.statusCode==200){
        return MealModel.fromJson(response.data);
      }
      else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("Conncection close");
    }
  }
}
