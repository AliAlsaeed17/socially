import 'package:dartz/dartz.dart';
import 'package:socially/core/errors/failures.dart';
import 'package:socially/core/repositories/repository_handler.dart';
import 'package:socially/core/usecases/params/pagination_param.dart';
import 'package:socially/features/home/data/data_sources/home_page_remote_data_source.dart';
import 'package:socially/features/home/domain/entities/post.dart';
import 'package:socially/features/home/domain/repositories/home_page_repository.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  final RepositoryHandler repositoryHandler;
  final HomePageRemoteDataSource homePageRemoteDataSource;

  HomePageRepositoryImpl({
    required this.repositoryHandler,
    required this.homePageRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Post>>> fetchPosts(
      PaginationParam paginationParam) {
    return repositoryHandler
        .handle(() => homePageRemoteDataSource.fetchPosts(paginationParam));
  }
}
