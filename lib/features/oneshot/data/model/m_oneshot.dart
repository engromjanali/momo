class MOneshot {
  final String? title;
  final List<Item>? items;

  MOneshot({this.title, this.items});

  factory MOneshot.fromJson(Map<String, dynamic> json) => MOneshot(
    title: json["title"],
    items: json["items"] == null
        ? []
        : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "items": items == null
        ? []
        : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  final String? title;
  final String? subTitle;
  final String? image;
  final String? prompt;
  final List<String>? imageBehaildText;
  final List<String>? inputImages;

  Item({
    this.title,
    this.subTitle,
    this.image,
    this.prompt,
    this.imageBehaildText,
    this.inputImages,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    title: json["title"],
    subTitle: json["subTitle"],
    image: json["image"],
    prompt: json["prompt"],
    imageBehaildText: json["imageBehaildText"] == null
        ? []
        : List<String>.from(json["imageBehaildText"]!.map((x) => x)),
    inputImages: json["inputImages"] == null
        ? []
        : List<String>.from(json["inputImages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subTitle": subTitle,
    "image": image,
    "prompt": prompt,
    "imageBehaildText": imageBehaildText == null
        ? []
        : List<dynamic>.from(imageBehaildText!.map((x) => x)),
    "inputImages": inputImages == null
        ? []
        : List<dynamic>.from(inputImages!.map((x) => x)),
  };
}
