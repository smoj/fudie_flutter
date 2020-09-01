import 'package:flutter/cupertino.dart';

class ShopProvider extends ChangeNotifier {
  List<Item> items = List<Item>();
  User username;
  Item sum = Item(totalPrice: 0);

  ShopProvider({this.username, this.items});

  addToCart(Item item){
    items.add(item);
    print('Cart: '+items.toString());
    calculateTotal();
    notifyListeners();
  }

  calculateTotal(){
    sum = items.reduce((Item curr, Item next){
      return Item(
        totalPrice: curr.totalPrice + next.totalPrice
      );
    });
    notifyListeners();
//    return sum.totalPrice;
  }

  removeFromCart(String key){
    items.removeWhere((item) => item.itemKey == key);
    notifyListeners();
  }

  updateItem(String key, int itemCount){
    int index = items.indexWhere((item)=> item.itemKey == key);
    print('key using updateItem($key, $itemCount):'+items[index].toString());
    items[index].totalPrice = itemCount * items[index].price;
    items[index].quantity = itemCount;
    print('After updateItem($key, $itemCount):'+items[index].toString());
    calculateTotal();
  }

}

class User {
  String name;
}

class Item {
  String itemName;
  int number;
  int quantity;
  double totalPrice;
  double price;
  String imageUrl;
  @required String itemKey;
  List<Extra> extras;
  Item({
    this.itemKey,
    this.itemName,
    this.quantity,
    this.price,
    this.totalPrice,
    this.imageUrl,
    this.extras,
  });

  @override
  String toString() {
    return '{ ${this.itemKey}, ${this.itemName}, ${this.quantity}, ${this.price}, ${this.totalPrice}, }';
  }
}

class Vendor {
  String name;
  String vendorKey;
  bool isOpen;
  String imageUrl;

  Vendor({@required this.name, @required this.vendorKey, this.isOpen, this.imageUrl});
}

class Extra {
  String name;
  double price;
  bool selected;

  Extra({@required this.name, @required this.price, this.selected});
}