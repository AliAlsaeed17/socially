import 'package:socially/core/errors/exceptions.dart';
import 'package:socially/core/models/list_model.dart';
import 'package:socially/core/network/api.dart';
import 'package:socially/core/network/constant_codes.dart';
import 'package:socially/core/network/models/params.dart';
import 'package:socially/core/usecases/params/pagination_param.dart';
import 'package:socially/features/home/data/models/post_model.dart';
import 'package:socially/features/home/domain/entities/post.dart';

abstract class HomePageRemoteDataSource {
  Future<List<Post>> fetchPosts(PaginationParam paginationParam);
}

class HomePageRemoteDataSourceImpl implements HomePageRemoteDataSource {
  final Api api;

  HomePageRemoteDataSourceImpl({required this.api});

  @override
  Future<List<Post>> fetchPosts(PaginationParam paginationParam) async {
    List<PostModel> posts = [];
    String url = 'posts?limit=10&skip=${paginationParam.skip}';
    Exception? exception;
    await api.get(GetParams(
      url: url,
      onSuccess: (result) {
        posts = result.items;
      },
      onError: (error) {
        if (error.statusCode == errorTimeOutCode) {
          exception = InternetException();
        } else {
          exception = ServerException(message: error.message);
        }
      },
      fromJson: (jsonData) => ListModel.fromJson(
          jsonData, (jsonData) => PostModel.fromJson(jsonData)),
    ));
    if (exception != null) {
      throw exception!;
    }
    return posts;
  }
}
