import '../models/result_model.dart';

abstract class SearchDataSource {
  Future<List<ResultModel>> searchByUser({required String query});
}
