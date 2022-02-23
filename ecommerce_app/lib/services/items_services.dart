import 'package:ecommerce_app/models/items.dart';
import 'package:ecommerce_app/services/coffee_courier_api.dart';

class ItemsServices{
  CCApi _ccApi = CCApi();


  Future<List<Item>>getItemsForShop(String shopId)async {
    try
    {
      List<Item> items = [];
    var res = await _ccApi.get
      ('items/GetItemsForShop?shopId=$shopId');
    for (var x in res) {
      items.add(Item.fromJson(x));
    }
      return items;
    }
    catch(ex) {
      throw ex;
    }
  }
}