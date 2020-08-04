import 'package:flutter/cupertino.dart';

class ShopProvider extends ChangeNotifier {
  List<Item> items = List<Item>();
  User username;

  ShopProvider({this.username, this.items});

  addToCart(Item item){
    items.add(item);
    print('Cart: '+items.toString());
    notifyListeners();
  }

  calculateTotal(){
//    Item sum = items.reduce((value, element){
//      return Item(totalPrice: )
//    });
  }

}

class User {
  String name;
}

class Item {
  String item;
  int number;
  int quantity;
  double totalPrice;
  double price;
  String imageUrl;
  Item({this.item, this.quantity, this.price, this.totalPrice, this.imageUrl});

  @override
  String toString() {
    return '{ ${this.item}, ${this.quantity}, ${this.price}, ${this.totalPrice}, }';
  }
}