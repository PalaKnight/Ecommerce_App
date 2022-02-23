import 'package:ecommerce_app/models/items.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier{
  Item? currentItem;
}