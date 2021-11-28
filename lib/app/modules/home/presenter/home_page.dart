import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          return controller.loading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  itemCount: controller.searchFound.length,
                  separatorBuilder: (_, __) =>
                      const Divider(color: Colors.blue),
                  itemBuilder: (_, index) {
                    ResultEntity resultEntity = controller.searchFound[index];
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
      ),
    );
  }
}
