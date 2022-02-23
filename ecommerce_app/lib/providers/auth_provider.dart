import 'package:ecommerce_app/models/created_user.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier{
  AuthService as = AuthService();
  CCResponse<CreatedUser> creationResponse = CCResponse.fresh('fresh');
  CCResponse<CreatedUser> completeProfileResponse = CCResponse.fresh('fresh');
  CCResponse<bool> verificationResponse = CCResponse.fresh('fresh');

  String? userId;
  bool isMale = false;
  bool isFemale = false;
  DateTime? birthDate;
  String? email;
  String name = '';


  static const userKey = 'UserId';
  Future<void> saveUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, userId!);
  }

  Future<void> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(userKey);
  }

  void setFemale(bool value){
    isFemale =value;
    isMale = !isFemale;
    notifyListeners();
  }

  void setMale(bool value){
    isMale =value;
    isFemale = !isMale;
    notifyListeners();
  }

  void setName(String n){
    name = n;
    notifyListeners();
  }

  void setEmail(String e){
    email = e;
    notifyListeners();
  }

  void setBirthDate(DateTime date){
    birthDate = date;
    notifyListeners();
  }

  String getGenderString() {
    if(isFemale)
      return "Female";
    else if(isMale)
      return "Male";
    else
      return "NA";
  }

  Future<void> createUser(String phoneNumber)async{
    try{
      creationResponse = CCResponse.loading('Loading');
      var res = await as.createUser(phoneNumber);
      if(res.success){
        userId = res.id;
      }
      creationResponse = CCResponse.completed(res);
    }catch(ex) {
      creationResponse = CCResponse.error('Something went wrong, please try again');
    }
    finally{
      notifyListeners();
    }
  }

  Future<void> completeProfile()async{
    try{
      completeProfileResponse = CCResponse.loading('Loading');
      var res = await as.postUserInfo
        (
          userId: userId!,
          name: name,
          email: email,
          gender: getGenderString(),
          birthDate: birthDate
      );
     if(res != null){
       if(res.success){
         userId = res.id;
         saveUserId();
         completeProfileResponse = CCResponse.completed(res);
       }
       else{
         completeProfileResponse = CCResponse.error('Something went wrong, please try again');
       }

     }
     else{
       completeProfileResponse = CCResponse.error('Something went wrong, please try again');
     }

    }catch(ex) {
      completeProfileResponse = CCResponse.error('Something went wrong, please try again');
    }
    finally{
      notifyListeners();
    }
  }

  Future<void> verifyUser(String otp) async{
    try {
      verificationResponse = CCResponse.loading('Loading');
      var res = await as.verifyUser(userId!, otp);
      verificationResponse = CCResponse.completed(res);
    }catch(ex) {
      verificationResponse = CCResponse.error('Something went wrong, please try again');
    }
    finally{
      notifyListeners();
    }
  }
}