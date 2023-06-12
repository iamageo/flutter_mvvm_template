class BaseModel {
  int? id;
  String? title;
  String? body;
  int? userId;

  BaseModel({this.id, this.title, this.body, this.userId});

  BaseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['userId'] = userId;
    return data;
  }
}