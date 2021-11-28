import 'package:mobx/mobx.dart';

import '../domain/entities/result_entity.dart';
import '../domain/usecases/by_user_search_usecase.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final SearchByUserUseCase _searchUseCase;

  HomeControllerBase({required SearchByUserUseCase searchUseCase})
      : _searchUseCase = searchUseCase;

  @observable
  bool loading = false;

  @observable
  List<ResultEntity> searchFound = [];

  @action
  Future search(String query) async {
    loading = true;
    searchFound = await _searchUseCase.call(query);
    loading = false;
  }
}
