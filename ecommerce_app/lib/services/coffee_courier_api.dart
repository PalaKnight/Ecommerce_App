import 'dart:convert';
import 'package:http/http.dart' as http;


class CCApi{
  String _baseURL = 'http://furniture.sketchandscript.com/api/';

  Future<dynamic> get(String url) async{
    var responseJson;
    try {
      var response = await http.get(Uri.parse(_baseURL + url));
      responseJson = _processedResponse(response);
    } catch (ex) {}
    return responseJson;
  }

  Future<dynamic> post({required String url, required String body}) async{
    var responseJson;
    try{
      var response = await http.post(Uri.parse(_baseURL + url),
          body: body,
  );
      responseJson =_processedResponse(response);
  } catch(ex){}
    return responseJson;
}
  dynamic _processedResponse(http.Response response){
    switch (response.statusCode){
      case 200:
        var jsonBody = json.decode(response.body);
        return jsonBody;
      case 500:
        throw Exception('Something went wrong');
    }
  }

}