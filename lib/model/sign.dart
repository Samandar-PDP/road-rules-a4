class Sign {
  int? id;
  String? name;
  String? desc;
  String? type;
  String? image;

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'desc': desc, 'type': type, 'image': image};
  }

  Sign.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        desc = json['desc'],
        type = json['type'],
        image = json['image'];
}
