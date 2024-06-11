class MealModel {
  int? id;
  String? name;
  String? description;

  MealModel({this.id, this.name, this.description});

  MealModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.description = json["description"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "name": name,
        "description": description,
      };
}
