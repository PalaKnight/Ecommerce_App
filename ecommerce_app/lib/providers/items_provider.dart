import 'dart:convert';
import 'package:ecommerce_app/models/items.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:ecommerce_app/services/items_services.dart';
import 'package:flutter/material.dart';



class ItemsProvider with ChangeNotifier{
  ItemsServices _ts = ItemsServices();
  CCResponse<List<Item>> itemResponse = CCResponse.fresh('fresh');

  void getItemsForShop(String shopId)async {
    try {
      itemResponse = CCResponse.loading('Loading');
      var res = await _ts.getItemsForShop(shopId);
      itemResponse = CCResponse.completed(res);
    }
    catch (ex) {
      itemResponse = CCResponse.error('Something went wrong, please try again');
    }
    finally {
      notifyListeners();
    }
  }
  }
  

    




