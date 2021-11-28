import 'package:dartz/dartz.dart';
import 'package:search_devs/app/modules/home/infra/models/result_model.dart';

import '../../../../core/http_adapter/http_client.dart';
import '../infra/datasource/search_datasource.dart';

class SearchDataSourceImpl implements SearchDataSource {
  final HttpClient _httpClient;

  const SearchDataSourceImpl({required HttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<Either<Exception, List<ResultModel>>> searchByUser(
      {required String query}) async {
    try {
      final responseData = await _httpClient
          .request('https://api.github.com/search/users', data: {'q': query});
      var items = responseData['items'] as List;
      final data = items
          .map(
            (item) => ResultModel(
              login: item['login'],
              avatarUrl: item['avatar_url'],
              url: item['url'],
            ),
          )
          .toList();
      return Right(data);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
