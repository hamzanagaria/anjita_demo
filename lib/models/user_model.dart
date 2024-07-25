class UserModelSample {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  UserModelSample({this.id, this.name, this.email, this.gender, this.status});

  UserModelSample.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['status'] = status;
    return data;
  }

  static List<UserModelSample> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => UserModelSample.fromJson(json)).toList();
  }
}
