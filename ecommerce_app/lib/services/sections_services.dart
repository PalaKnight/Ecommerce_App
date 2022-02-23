
import 'package:ecommerce_app/models/section.dart';
import 'package:ecommerce_app/services/coffee_courier_api.dart';

class SectionsServices{
  CCApi _ccApi = CCApi();

  Future<List<Section>> getSections()async{
    List<Section> sections = [];
    var res = await _ccApi.get('shops/GetCategories');

    for (var x in res){
      sections.add(Section.fromJson(x));
    }
    return sections;
  }
}
