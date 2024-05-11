import 'package:flutter/material.dart';
import 'package:recepie_app/model/meal_details.dart';
import 'package:recepie_app/utils/api.dart';

class MealServie {
  static Future fetchMeaDeatails(var id) async {
    try {
      var response = await Api.dio.get('lookup.php?i=$id');
      if (response.statusCode == 200) {
        return MealDetails.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
    debugPrint("meal service");
    }
  }
}
