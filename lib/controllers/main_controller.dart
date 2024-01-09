
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/chart_page.dart';

class MainController extends GetxController{
  var name = "".obs;

  var products = <Product>[Product("Bilgisayar", 4, 2407),Product("Fare", 3, 73)].obs;

  var totalPrice = 0.0.obs;

  @override
  void onInit() {
    for(int i =0;i < products.length;i++){
      totalPrice.value+=products[i].price*products[i].count;
    }

    super.onInit();
  }

  void editAddCart(int index){
    products[index].count = products[index].count + 1;
    products[index] = products[index];
    totalPrice.value =0;

    for(int i =0;i < products.length;i++){
      totalPrice.value+=products[i].price*products[i].count;
    }

  }

  void editMinusCart(int index) {
    if (products[index].count > 1){
      products[index].count = products[index].count - 1;
    products[index] = products[index];
  }else{
  Get.defaultDialog(title:"You sure to delete this product??",middleText: "", textConfirm: "Delete", onConfirm: (){
    products.removeAt(index);
    if(products.length == 0)
      totalPrice.value =0;
    Get.back();

  });
  }
    totalPrice.value =0;
    for(int i =0;i < products.length;i++){
      totalPrice.value+=products[i].price*products[i].count;
    }

  }

  void changeName(String name) {
    this.name.value = name;
  }


}

class Product{
  Product(this.name,this.count,this.price);
  String name;
  int count;
  double price;
}