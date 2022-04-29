import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:villetrixx/pages/undesired_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  child: Image(image: AssetImage('lib/assets/logo.png')),
                  height: 240,
                  margin: EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.white,
                            Theme.of(context).primaryColorDark,
                          ]),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                            blurRadius: 4,
                            color: Colors.black)
                      ],
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(200)))),
              Container(
                alignment: Alignment.center,
                child: Text("VilleTrixx",
                    style: TextStyle(fontSize: 36, color: Colors.black38)),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("Sintetização de Contradições",
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[100],
                      textStyle: const TextStyle(fontSize: 16)),
                  child: Text(
                    "Iniciar",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  onPressed: () {
                    Get.to(() => UndesiredPage());
                  },
                ),
              ),
              Container(
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
