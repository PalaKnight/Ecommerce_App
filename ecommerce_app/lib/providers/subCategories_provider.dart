
import 'package:ecommerce_app/models/section.dart';
import 'package:ecommerce_app/models/sub_category.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:ecommerce_app/services/subCategories_services.dart';
import 'package:flutter/foundation.dart';


class SubCategoriesProvider with ChangeNotifier{
  SubCategoriesService scs = SubCategoriesService();
  CCResponse<List<SubCategory>> subCategoriesResponse = CCResponse.fresh('fresh');

  SubCategoriesProvider(String shopId, String categoryId){
    getSubCategories(shopId, categoryId);
  }



  void getSubCategories(String shopId, String categoryId) async {
    try{
      subCategoriesResponse = CCResponse.loading('Loading');
      var res = await scs.getSubCategories(shopId, categoryId);
      subCategoriesResponse = CCResponse.completed(res);
    }catch(ex) {
      subCategoriesResponse = CCResponse.error('Something went wrong, please try again');
    }
    finally{
      notifyListeners();
    }
  }

}

