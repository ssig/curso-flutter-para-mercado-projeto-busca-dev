import 'package:dartz/dartz.dart';

import '../../infra/models/result_model.dart';

abstract class SearchRepository {
  Future<Either<Exception, List<ResultModel>>> searchByUser(
      {required String query});
}
