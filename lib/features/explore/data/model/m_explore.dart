
class MExplore {
    final String? title;
    final List<EItem>? items;

    MExplore({
        this.title,
        this.items,
    });

    factory MExplore.fromJson(Map<String, dynamic> json) => MExplore(
        title: json["title"],
        items: json["items"] == null ? [] : List<EItem>.from(json["items"]!.map((x) => EItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
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
        specifications: json["specifications"] == null ? [] : List<dynamic>.from(json["specifications"]!.map((x) => x)),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        inputImages: json["inputImages"] == null ? [] : List<dynamic>.from(json["inputImages"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "details": details,
        "specifications": specifications == null ? [] : List<dynamic>.from(specifications!.map((x) => x)),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "inputImages": inputImages == null ? [] : List<dynamic>.from(inputImages!.map((x) => x)),
    };
}

