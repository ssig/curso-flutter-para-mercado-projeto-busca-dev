import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/result_entity.dart';

@immutable
abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchStateInitial extends SearchState {}

class SearchStateLoading extends SearchState {}

class SearchStateGetSuccess extends SearchState {
  final List<ResultEntity> _resultEntityList;
  SearchStateGetSuccess({required List<ResultEntity> resultEntityList})
      : _resultEntityList = resultEntityList;
  List<ResultEntity> get resultEntityList => _resultEntityList;
  @override
  List<Object?> get props => [resultEntityList];
}

class SearchStateGetFailure extends SearchState {
  final String _message;
  SearchStateGetFailure({required String message}) : _message = message;
  String get message => _message;
  @override
  List<Object?> get props => [message];
}
