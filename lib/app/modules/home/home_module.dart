import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/by_user_search_usecase.dart';
import 'external/search_datasource_impl.dart';
import 'infra/repositories/search_repository_impl.dart';
import 'presenter/home_controller.dart';
import 'presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => SearchDataSourceImpl(httpClient: i())),
    Bind.factory((i) => SearchRepositoryImpl(searchDataSource: i())),
    Bind.factory((i) => SearchByUserUseCase(searchRepository: i())),
    Bind.lazySingleton((i) => HomeController(searchUseCase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
