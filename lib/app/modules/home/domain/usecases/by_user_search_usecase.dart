import '../../../../../core/usecase.dart';
import '../entities/result_entity.dart';
import '../repositories/search_repository.dart';

class SearchByUserUseCase implements UseCase<List<ResultEntity>, String> {
  final SearchRepository _searchRepository;

  const SearchByUserUseCase({
    required SearchRepository searchRepository,
  }) : _searchRepository = searchRepository;

  @override
  Future<List<ResultEntity>> call(String query) async {
    return _searchRepository.searchByUser(query: query);
  }
}
