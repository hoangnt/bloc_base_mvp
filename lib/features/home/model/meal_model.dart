class MealModel {
  int? id;
  String? name;
  String? description;

  MealModel({this.id, this.name, this.description});

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "name": name,
        "description": description,
      };
}
