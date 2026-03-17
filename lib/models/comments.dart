class Comments {
  int id;
  String name;
  String email;
  String body;

  Comments({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
factory Comments.fromJSON(Map<String, dynamic> json) {
  return Comments(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      body: json["body"]);
}
}
