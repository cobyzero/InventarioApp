class MenuModel {
  final String image;
  final String title;

  MenuModel({
    required this.image,
    required this.title,
  });

  MenuModel copyWith({
    String? image,
    String? title,
  }) =>
      MenuModel(
        image: image ?? this.image,
        title: title ?? this.title,
      );

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        image: json["image"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
      };
}
