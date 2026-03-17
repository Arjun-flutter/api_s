class Photos {
  int id;
  String title;
  String url;

  Photos({
    required this.id,
    required this.title,
    required this.url,

  });
  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
        id: json["id"],
        title: json["title"],
        url: json["url"]
    );
  }
}
