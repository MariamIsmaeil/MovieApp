/// id : 28
/// name : "Action"

class Genreentity {
  Genreentity({
      this.id, 
      this.name,});

  Genreentity.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
Genreentity copyWith({  int? id,
  String? name,
}) => Genreentity(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}