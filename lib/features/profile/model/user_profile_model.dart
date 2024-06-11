class UserProfileModel {
  String? id;
  String? name;
  int? age;
  String? email;

  UserProfileModel({this.age, this.email, this.id, this.name});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.age = json["age"];
    this.email = json["email"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": this.id,
        "name": this.name,
        "age": this.age,
        "email": this.email,
      };
}
