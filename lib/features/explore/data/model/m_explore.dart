import 'package:momo/core/functions/f_is_null.dart';

class MExplore {
  final String? title;
  final List<EItem>? items;

  MExplore({this.title, this.items});

  factory MExplore.fromJson(Map<String, dynamic> json) => MExplore(
    title: json["title"],
    items: isNull(json["items"])
        ? null
        : List<EItem>.from(json["items"]!.map((x) => EItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "items": isNull(items)
        ? null
        : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class EItem {
  final String? title;
  final String? details;
  final List<dynamic>? specifications;
  final List<String>? images;
  final List<dynamic>? inputImages;

  EItem({
    this.title,
    this.details,
    this.specifications,
    this.images,
    this.inputImages,
  });

  factory EItem.fromJson(Map<String, dynamic> json) => EItem(
    title: json["title"],
    details: json["details"],
    specifications: isNull(json["specifications"])
        ? null
        : List<dynamic>.from(json["specifications"]!.map((x) => x)),
    images: isNull(json["images"])
        ? null
        : List<String>.from(json["images"]!.map((x) => x)),
    inputImages: isNull(json["inputImages"])
        ? null
        : List<dynamic>.from(json["inputImages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "details": details,
    "specifications": isNull(specifications )
        ? null
        : List<dynamic>.from(specifications!.map((x) => x)),
    "images": isNull(images) ? null : List<dynamic>.from(images!.map((x) => x)),
    "inputImages": isNull(inputImages)
        ? null
        : List<dynamic>.from(inputImages!.map((x) => x)),
  };
}
