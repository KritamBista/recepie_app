class MealDetails {
  MealDetails({
    required this.meals,
  });

  final List<Map<String, dynamic>> meals;

  factory MealDetails.fromJson(Map<String, dynamic> json) {
    return MealDetails(
      meals: json["meals"] == null
          ? []
          : List<Map<String, dynamic>>.from(json["meals"]!.map((x) =>
              Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    );
  }
}
