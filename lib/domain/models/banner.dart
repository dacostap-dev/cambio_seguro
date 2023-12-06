class Banner {
  final String title;
  final String shortDescription;
  final String urlImage;
  final String slug;
  final DateTime createdAt;

  Banner({
    required this.title,
    required this.shortDescription,
    required this.urlImage,
    required this.slug,
    required this.createdAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        title: json["title"],
        shortDescription: json["short_description"],
        urlImage: json["url_image"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
