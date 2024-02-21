import 'package:amikompedia_app/core/constants/constants.dart';
import 'package:amikompedia_app/core/data/remote/base_response.dart';
import 'package:amikompedia_app/core/error/exception.dart';
import 'package:amikompedia_app/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<BaseResponse<PostModel>> getPosts();
}

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  final http.Client client;
  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<BaseResponse<PostModel>> getPosts() async {
    final response = await client
        .get(
          Uri.parse(Urls.allPosts),
        )
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException(),
        );

    if (response.statusCode == 200) {}
    if (response.statusCode == 400) {
      throw BadRequestException();
    }

    throw Exception();
  }
}
