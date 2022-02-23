import 'package:ecommerce_app/models/shops.dart';
import 'package:ecommerce_app/services/coffee_courier_api.dart';

class ShopsServices{
  CCApi _ccApi = CCApi();

  Future<List<Shop>> getShops(double latitude, double longitude, String sectionId)async{
    List<Shop> shops = [];
    var res = await _ccApi.get(
        'shops/GetShops?latitude=${latitude.toString()}&longitude=${longitude.toString()}6&categoryId=$sectionId');

    for (var x in res){
      shops.add(Shop.fromJson(x));
    }
    return shops;
  }
}