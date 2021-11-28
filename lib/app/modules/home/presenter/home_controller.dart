import 'package:mobx/mobx.dart';

import '../../../../core/failures/failure.dart';
import '../domain/entities/result_entity.dart';
import '../domain/usecases/by_user_search_usecase.dart';
import 'states/search_state.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final SearchByUserUseCase _searchUseCase;

  HomeControllerBase({required SearchByUserUseCase searchUseCase})
      : _searchUseCase = searchUseCase;

  @observable
  SearchState searchState = SearchState.initial();

  @action
  Future search(String query) async {
    searchState = SearchState.loading();

    if (query.isEmpty) {
      return searchState = SearchState.initial();
    }

    final response = await _searchUseCase.call(query);
    response.fold(
      (Failure failure) => searchState =
          SearchState.searchFailure(message: mapFailureToMessage(failure)),
      (List<ResultEntity> resultEntityList) => searchState =
          SearchState.searchSuccess(resultEntityList: resultEntityList),
    );
  }

  String mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
