class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post(
      {required this.userId, this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> tojson() {
    var map = Map<String, dynamic>();
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }
}
