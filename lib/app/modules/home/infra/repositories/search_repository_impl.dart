import '../../domain/entities/result_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasource/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _searchDataSource;

  const SearchRepositoryImpl({required SearchDataSource searchDataSource})
      : _searchDataSource = searchDataSource;

  @override
  Future<List<ResultEntity>> searchByUser({required String query}) async {
    return await _searchDataSource.searchByUser(query: query);
  }
}
