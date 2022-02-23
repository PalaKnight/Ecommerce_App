import 'package:ecommerce_app/services/shops_services.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:ecommerce_app/models/shops.dart';
import 'package:flutter/foundation.dart';


class ShopsProvider with ChangeNotifier{
ShopsServices ss = ShopsServices();
CCResponse<List<Shop>> shopsResponse = CCResponse.fresh('fresh');

void getShops(double latitude, double longitude, String sectionId) async{
  try{
    shopsResponse = CCResponse.loading('Loading');
    var res = await ss.getShops(latitude, longitude, sectionId);
    shopsResponse = CCResponse.completed(res);
  }
  catch(ex){
    shopsResponse = CCResponse.error(ex.toString());
  }
  finally{
  notifyListeners();
  }
}


}