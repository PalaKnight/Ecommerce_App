import 'dart:convert';
import 'package:ecommerce_app/models/created_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'coffee_courier_api.dart';

class AuthService{

  CCApi _ccApi = CCApi();




  Future<CreatedUser>createUser(String phoneNumber)async {
    try
    {

      var res = await _ccApi.get
        ('ccusers/addnewuser?phonenumber=$phoneNumber');
      print(res);

      return CreatedUser.fromJson(res);
    }
    catch(ex) {
      throw ex;
    }
  }

  Future<bool>verifyUser(String userId, otp)async {
    try
    {

      var res = await _ccApi.get('ccusers/VerifyUser?id=$userId&vc=$otp');
      print(res);

     return res['success'];
    }
    catch(ex) {
      throw ex;
    }
  }
  Future<CreatedUser?> postUserInfo({
    required String userId,
    String? email,
    required String name,
    DateTime? birthDate,
    required String gender,
      }) async{
    var res = await _ccApi.post(url: '',
    body: json.encode(
        {
          'id': userId,
          'name': name,
          if (email != null) 'email': email,
          if (birthDate != null) 'birth date': birthDate.toString(),
          'gender' : gender,
        }
        ),
    );
    print(res);
    if(res['success']) {
      var createdUser = CreatedUser.fromJson(res);
      return createdUser;
    }
    return null;

  }
}