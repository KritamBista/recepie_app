class AreaMealModel {
    AreaMealModel({
        required this.meals,
    });

    final List<Meal> meals;

    factory AreaMealModel.fromJson(Map<String, dynamic> json){ 
        return AreaMealModel(
            meals: json["meals"] == null ? [] : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
        );
    }

}

class Meal {
    Meal({
        required this.strMeal,
        required this.strMealThumb,
        required this.idMeal,
    });

    final String? strMeal;
    final String? strMealThumb;
    final String? idMeal;

    factory Meal.fromJson(Map<String, dynamic> json){ 
        return Meal(
            strMeal: json["strMeal"],
            strMealThumb: json["strMealThumb"],
            idMeal: json["idMeal"],
        );
    }

}
