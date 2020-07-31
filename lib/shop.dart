import 'package:flutter/cupertino.dart';

class ShopProvider extends ChangeNotifier {
  List<Item> items = List<Item>();
  User username;

  ShopProvider({this.username, this.items});

  addToCart(){
    items.add(Item(price: 4.99, totalPrice: 12.99, item: 'Sausage Soup', quantity: 2));
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
}