
import 'package:ecommerce_app/models/section.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:ecommerce_app/services/sections_services.dart';
import 'package:flutter/foundation.dart';


class SectionsProvider with ChangeNotifier{
  SectionsServices ss = SectionsServices();
  CCResponse<List<Section>> sectionsResponse = CCResponse.fresh('fresh');

  void getSections()async{
    try{
      sectionsResponse = CCResponse.loading('Loading');
      var res = await ss.getSections();
      sectionsResponse = CCResponse.completed(res);
    }catch(ex) {
      sectionsResponse = CCResponse.error('Something went wrong, please try again');
    }
    finally{
      notifyListeners();
    }
  }

}

