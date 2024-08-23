import 'package:dartz/dartz.dart';
import 'package:socially/core/errors/failures.dart';
import 'package:socially/core/usecases/params/pagination_param.dart';
import 'package:socially/core/usecases/usecase.dart';
import 'package:socially/features/home/domain/entities/post.dart';
import 'package:socially/features/home/domain/repositories/home_page_repository.dart';

class FetchPosts implements UseCase<List<Post>, PaginationParam> {
  final HomePageRepository homePageRepository;

  FetchPosts({required this.homePageRepository});

  @override
  Future<Either<Failure, List<Post>>> call(PaginationParam params) {
    return homePageRepository.fetchPosts(params);
  }
}
