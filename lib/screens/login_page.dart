import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screens/chart_page.dart';

import '../controllers/main_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _mainController = Get.put(MainController());
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(_mainController.name.value)),
            TextField(
              onChanged: (value) => name = value,
              decoration: InputDecoration(
                labelText: 'Adınız',
                hintText: 'Adınızı girin',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _mainController.changeName(name);
                  Get.defaultDialog(
                      title: "Your name is: ",
                      middleText: _mainController.name.value,
                      onConfirm: () => Get.to(() => MyCartPage()));
                },
                child: Text("İlerle"))
          ],
        ),
      ),
    );
  }
}
