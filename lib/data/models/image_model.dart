import 'package:amikompedia_app/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({
    required String id,
    required String imageUrl,
    required String imageType,
    required String filePath,
  }) : super(
          id: id,
          imageUrl: imageUrl,
          imageType: imageType,
          filePath: filePath,
        );

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      imageType: json['imageType'],
      filePath: json['filePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'imageType': imageType,
      'filePath': filePath,
    };
  }

  //to entity

  ImageEntity toEntity() => ImageEntity(
        id: id,
        imageUrl: imageUrl,
        imageType: imageType,
        filePath: filePath,
      );

}
