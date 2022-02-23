
import 'package:ecommerce_app/models/section.dart';
import 'package:ecommerce_app/models/sub_category.dart';
import 'package:ecommerce_app/services/coffee_courier_api.dart';

class SubCategoriesService{
  CCApi _ccApi = CCApi();

  Future<List<SubCategory>> getSubCategories(String shopId, String categoryId) async {
    List<SubCategory> subCategories = [];
    var res = await _ccApi.get(
        'items/GetItemsForShopAndCategory?shopId=$shopId&categoryId=$categoryId');

    for (var x in res){
      subCategories.add(SubCategory.fromJson(x));
    }
    return subCategories;
  }
}
