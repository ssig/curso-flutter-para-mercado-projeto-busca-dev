import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_devs/app/modules/home/domain/entities/result_entity.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  factory SearchState.initial() = _SearchStateInitial;
  factory SearchState.loading() = _SearchStateLoading;
  factory SearchState.searchSuccess(
          {required List<ResultEntity> resultEntityList}) =
      _SearchStateSeachSuccess;
  factory SearchState.searchFailure({required String message}) =
      _SearchStateFailure;
}
