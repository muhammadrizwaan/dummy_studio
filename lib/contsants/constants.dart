



 import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/strings.dart';

class Constants{
  static String username;
  static String imagePath;
  static String email;
  static String phone;

  static String getUsername(){
    // username = PreferenceUtils.getString("username");
    return username;

  }
  static String getEmail(){
    // email = PreferenceUtils.getString("email");
    return email;

  }
  static String getUserImage(){
    imagePath = PreferenceUtils.getString(Strings.profileImageKey);
    // return  baseUrl + imagePath;
    return  imagePath;

  }

  static String getPhone(){
    // phone = PreferenceUtils.getString("phone");
    return  phone;

  }

 }