import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String id;
  final String imageUrl;
  final String imageType;
  final String filePath;

  const ImageEntity({
    required this.id,
    required this.imageUrl,
    required this.imageType,
    required this.filePath,
  });


  @override
  List<Object?> get props => [id, imageUrl, imageType, filePath];

  //from json

  factory ImageEntity.fromJson(Map<String, dynamic> json) {
    return ImageEntity(
      id: json['id'],
      imageUrl: json['imageUrl'],
      imageType: json['imageType'],
      filePath: json['filePath'],
    );
  }


  //to json

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
