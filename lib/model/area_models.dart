class AreaModel {
    AreaModel({
        required this.meals,
    });

    final List<Meal> meals;

    factory AreaModel.fromJson(Map<String, dynamic> json){ 
        return AreaModel(
            meals: json["meals"] == null ? [] : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
        );
    }

}

class Meal {
    Meal({
        required this.strArea,
    });

    final String? strArea;

    factory Meal.fromJson(Map<String, dynamic> json){ 
        return Meal(
            strArea: json["strArea"],
        );
    }

}
