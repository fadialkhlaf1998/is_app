class GalleryResponse {
  int? galleryId;
  String? image;

  GalleryResponse({this.galleryId, this.image});

  GalleryResponse.fromJson(Map<String, dynamic> json) {
    galleryId = json['gallery_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gallery_id'] = galleryId;
    data['image'] = image;
    return data;
  }
}
