import 'package:flutter/material.dart';
import 'package:recepie_app/model/areaMeal.dart';
import 'package:recepie_app/model/area_models.dart';
import 'package:recepie_app/utils/api.dart';

class AreaService {
  static fetchArea() async {
    try {
      var response = await Api.dio.get('list.php?a=list');
      if(response.statusCode ==200){
        return AreaModel.fromJson(response.data);
      }
      else{
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
    
    }
  }
  static Future filterMeals(var country) async {
      try{
      var response =await Api.dio.get('filter.php?a=$country');
      if(response.statusCode == 200){
        return  AreaMealModel.fromJson(response.data);
      }  
      else {
        return null;
      }
      }
      catch(e){
          debugPrint("$e");
      }
      finally{
          debugPrint("area service");

      }

}
}