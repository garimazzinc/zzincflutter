class User {
  String? phoneNumber;
  String? fullName;
  String? email;
  DateTime? dob;
  String? height;
  double? weight;
  String? gender;
  String? hairType;
  String? skin;
  String? nationality = "";
  List<String>? languages;
  Map<String, dynamic>? images;
  List<String>? experience;
  List<String>? links;
  List<String>? skills;

  User({
    this.phoneNumber,
    this.fullName,
    this.email,
    this.dob,
    this.height,
    this.weight,
    this.gender,
    this.hairType,
    this.skin,
    this.images,
    this.experience,
    this.links,
    this.skills
  });

  Map<String, dynamic> toJson() {
    return {
      "phoneNumber": phoneNumber,
      "fullName": fullName,
      "email": email,
      "dob": dob?.toIso8601String(),
      "height": height,
      "weight": weight,
      "gender": gender,
      "hairType": hairType,
      "skin": skin,
      "nationality": nationality,
      "languages": languages,
      "images": images,
      "skills": skills,
      "experience": experience,
      "links": links,
    };
  }
}
