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
  Item({this.item, this.quantity, this.price, this.totalPrice});

  @override
  String toString() {
    return '{ ${this.item}, ${this.quantity}, ${this.price}, ${this.totalPrice}, }';
  }
}