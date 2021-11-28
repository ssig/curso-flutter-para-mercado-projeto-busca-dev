import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';

import '../domain/entities/result_entity.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
          onChanged: (String query) {
            controller.search(query);
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          Widget widgetView = const SizedBox.shrink();

          controller.searchState.when(
            initial: () => widgetView = const Center(
              child: Icon(
                Icons.person_search,
                size: 68,
                color: Colors.grey,
              ),
            ),
            loading: () => widgetView = Padding(
              padding: const EdgeInsets.all(16),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                enabled: true,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (_, __) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 48.0,
                            height: 48.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 8.0,
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  height: 8.0,
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 8.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            searchSuccess: (List<ResultEntity> resultEntityList) {
              widgetView = ListView.separated(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                itemCount: resultEntityList.length,
                separatorBuilder: (_, __) => const Divider(color: Colors.blue),
                itemBuilder: (_, index) {
                  ResultEntity resultEntity = resultEntityList[index];
                  return ListTile(
                    leading: resultEntity.avatarUrl != null
                        ? Image.network(resultEntity.avatarUrl!)
                        : Container(color: Colors.grey),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resultEntity.login ?? '-',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            alignment: Alignment.centerLeft,
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0),
                            ),
                          ),
                          child: const Text(
                            'Ver detalhes',
                            style: TextStyle(fontSize: 14),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            searchFailure: (String message) => widgetView = Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );

          return widgetView;
        },
      ),
    );
  }
}
