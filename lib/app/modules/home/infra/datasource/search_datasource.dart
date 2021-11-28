import 'package:dartz/dartz.dart';

import '../models/result_model.dart';

abstract class SearchDataSource {
  Future<Either<Exception, List<ResultModel>>> searchByUser(
      {required String query});
}
