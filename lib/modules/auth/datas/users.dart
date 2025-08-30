class Users {
  String? id;
  String? name;
  String? role;

  Users({this.id, this.name, this.role});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    return data;
  }
}
