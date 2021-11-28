import 'package:dartz/dartz.dart';

import '../../../../../core/failures/failure.dart';
import '../../../../../core/usecase.dart';
import '../entities/result_entity.dart';
import '../repositories/search_repository.dart';

class SearchByUserUseCase implements UseCase<List<ResultEntity>, String> {
  final SearchRepository _searchRepository;

  const SearchByUserUseCase({
    required SearchRepository searchRepository,
  }) : _searchRepository = searchRepository;

  @override
  Future<Either<Failure, List<ResultEntity>>> call(String query) async {
    final response = await _searchRepository.searchByUser(query: query);
    return response.fold(
      (exception) => Left(mapperExceptionToFailure(exception)),
      (response) => Right(response),
    );
  }

  mapperExceptionToFailure(Exception exception) {
    switch (exception.runtimeType) {
      default:
        return const Failure(message: 'Infelizmente houve um erro interno');
    }
  }
}
