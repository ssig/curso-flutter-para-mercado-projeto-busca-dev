import '../entities/result_entity.dart';

abstract class SearchRepository {
  Future<List<ResultEntity>> searchByUser({required String query});
}
