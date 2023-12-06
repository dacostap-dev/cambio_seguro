class Article {
  final bool? typeChange;
  final String title;
  final String shortDescription;
  final bool status;
  final String urlImage;
  final String slug;
  final DateTime createdAt;

  Article({
    this.typeChange = false,
    required this.title,
    required this.shortDescription,
    required this.status,
    required this.urlImage,
    required this.slug,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        typeChange: json["type_change"],
        title: json["title"],
        shortDescription: json["short_description"],
        status: json["status"],
        urlImage: json["url_image"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
