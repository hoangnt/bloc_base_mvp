class UserProfileModel {
  String? id;
  String? name;
  int? age;
  String? email;

  UserProfileModel({this.age, this.email, this.id, this.name});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": this.id,
        "name": this.name,
        "age": this.age,
        "email": this.email,
      };
}
