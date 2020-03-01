class Gallery {
  List<String> images;
  String imageName;

  Gallery({this.images, this.imageName});

  Gallery.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['imageName'] = this.imageName;
    return data;
  }
}
