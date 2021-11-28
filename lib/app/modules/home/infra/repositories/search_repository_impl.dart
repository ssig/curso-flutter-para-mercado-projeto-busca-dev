import 'package:dartz/dartz.dart';

import '../../domain/repositories/search_repository.dart';
import '../datasource/search_datasource.dart';
import '../models/result_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _searchDataSource;

  const SearchRepositoryImpl({required SearchDataSource searchDataSource})
      : _searchDataSource = searchDataSource;

  @override
  Future<Either<Exception, List<ResultModel>>> searchByUser(
      {required String query}) async {
    return await _searchDataSource.searchByUser(query: query);
  }
}
