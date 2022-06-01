class gnsz {
  String? name;
  String? eposta;

  gnsz({ this.name });

  gnsz.fromJson(Map<String, dynamic> json){
    name = json["name"]?.toString();

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["name"] = name;
    return data;
  }



}