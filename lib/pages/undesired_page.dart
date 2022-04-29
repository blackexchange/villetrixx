import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:villetrixx/controller/result_controller.dart';
import 'package:villetrixx/pages/feature_page.dart';
import '../constants/matrix.dart';

class UndesiredPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResultController c = Get.put(ResultController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Resultados Indesejados"),
      ),
      body: Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: TextField(
                  onChanged: c.onChangeSearch,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.search, color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              Expanded(
                flex: 4,
                child: Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: c.p.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: c.und == index ? Colors.amber : Colors.amber[50],
                        margin: EdgeInsets.only(bottom: 1, top: 1),
                        child: ListTile(
                          onTap: () {
                            c.goToFeature(c.p[index]);
                            Get.to(FeaturePage());
                          },
                          title: Text(
                            "${index + 1}. ${c.p[index]}",
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
