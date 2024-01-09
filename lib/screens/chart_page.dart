import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MyCartPage extends StatelessWidget {
  MyCartPage({super.key});

  final MainController _mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Welcome " + _mainController.name.value),
              Expanded(
                child: ListView.builder(
                  itemCount: _mainController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    // yourList[index] elemanını kullanarak widget oluşturun
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _mainController.editMinusCart(index);
                              },
                              child: Icon(Icons.minimize),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _mainController.products[index].name,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${_mainController.products[index].count} x ${_mainController.products[index].price} = ${_mainController.products[index].price * _mainController.products[index].count}',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                _mainController.editAddCart(index);
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    );

                  },
                ),
              ),
              Obx(()=> Text("Total price: " + _mainController.totalPrice.value.toString())),
              ElevatedButton(onPressed: (){

              }, child: Text("Next"))
            ],
          ),
        ),
      ),
    ));
  }
}
