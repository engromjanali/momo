class MSImage {
  bool? isGoodImage;
  String? image;

  MSImage({this.isGoodImage, this.image});

  factory MSImage.fromJson(Map<String, dynamic> json) =>
      MSImage(isGoodImage: json["isGoodImage"], image: json["image"]);

  Map<String, dynamic> toJson() => {"isGoodImage": isGoodImage, "image": image};
}
