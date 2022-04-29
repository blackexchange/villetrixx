import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:villetrixx/pages/home_page.dart';
import '../controller/result_controller.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResultController c = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Soluções"),
      ),
      body: Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.local_fire_department_sharp,
                  size: 64,
                  color: Colors.amber,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  c.principleList[0] != null
                      ? "Para solucionar questões de ${c.txtUndesired} / ${c.txtFeature}, pode-se então aplicar os seguintes princípios:"
                      : "",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: c.principleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (c.principleList[0] == null) {
                      return Center(
                          child: Text(
                              "Nenhuma solução compatível com os parâmetos."));
                    }
                    var principio = c.principleList[index];
                    var descricao = c.principleListA[index];
                    return Card(
                      margin: EdgeInsets.only(bottom: 1, top: 1),
                      child: ExpansionTile(
                        title: Text(
                          principio,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        children: [
                          ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: Text(descricao))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      //   padding:
                      //     const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 16)),
                  child: Text("Reiniciar"),
                  onPressed: () {
                    Get.to(() => HomePage());
                  },
                ),
              ),
            ],
          )),
    );
  }
}
