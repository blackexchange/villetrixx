import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:villetrixx/pages/result_page.dart';
import '../controller/result_controller.dart';

class FeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResultController c = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Mudança Desejada"),
      ),
      body: Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: TextField(
                  onChanged: c.onChangeSearchFeat,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.search, color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(c.txtUndesired ?? "",
                    style: TextStyle(color: Colors.amber)),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: c.q.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: c.notResult.where((e) => e == index).length > 0
                            ? Colors.grey
                            : Colors.green[50],
                        margin: EdgeInsets.only(bottom: 1, top: 1),
                        child: ListTile(
                          onTap: c.notResult.where((e) => e == index).length > 0
                              ? null
                              : () {
                                  Get.to(ResultPage());
                                  c.goToResult(c.q[index]);
                                },
                          title: Text(
                            "${index + 1}. ${c.q[index]}",
                            style:
                                TextStyle(fontSize: 18, color: Colors.blueGrey),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
