import 'package:dartz/dartz.dart';
import 'package:socially/core/errors/failures.dart';
import 'package:socially/core/usecases/params/pagination_param.dart';
import 'package:socially/features/home/domain/entities/post.dart';

abstract class HomePageRepository {
  Future<Either<Failure, List<Post>>> fetchPosts(
      PaginationParam paginationParam);
}
