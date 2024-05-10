import 'dart:convert';
import 'dart:io';

class Order {
  String item;
  String itemName;
  double price;
  String currency;
  int quantity;

  Order(this.item, this.itemName, this.price, this.currency, this.quantity);

  Map<String, dynamic> toJson() {
    return {
      'Item': item,
      'ItemName': itemName,
      'Price': price,
      'Currency': currency,
      'Quantity': quantity,
    };
  }
}

List<Order> orders = [];

void main() {
  // Read JSON data
  String jsonString = '[{"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},{"Item": "A1001","ItemName": "Iphone 16","Price": 1500,"Currency": "USD","Quantity":1}]';
  List<dynamic> jsonList = json.decode(jsonString);
  orders = jsonList.map((item) => Order(item['Item'], item['ItemName'], item['Price'].toDouble(), item['Currency'], item['Quantity'])).toList();

  // Display orders
  updateOrderList();

  // Add order
  print('Enter item:');
  String item = stdin.readLineSync()!;
  print('Enter item name:');
  String itemName = stdin.readLineSync()!;
  print('Enter price:');
  double price = double.parse(stdin.readLineSync()!); // Chuyển đổi sang kiểu double
  print('Enter currency:');
  String currency = stdin.readLineSync()!;
  print('Enter quantity:');
  int quantity = int.parse(stdin.readLineSync()!);

  Order newOrder = Order(item, itemName, price, currency, quantity);
  orders.add(newOrder);

  updateOrderList();
  saveOrdersToJson();
}

void updateOrderList() {
  orders.forEach((order) {
    print('Item: ${order.item}, ItemName: ${order.itemName}, Price: ${order.price}, Currency: ${order.currency}, Quantity: ${order.quantity}');
  });
}

void saveOrdersToJson() {
  List<Map<String, dynamic>> jsonList = orders.map((order) => order.toJson()).toList();
  String jsonString = json.encode(jsonList);
  // Replace this with your own code to save jsonString to order.json
  // For demonstration purpose, we'll just print the jsonString
  print(jsonString);
}
