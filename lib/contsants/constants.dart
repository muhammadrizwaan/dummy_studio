
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/res/strings.dart';


class Constants{
  static String userName;
  static String userImage;
  static String userEmail;
  static String userPhone;
  static String password;
  static int userId;
  static bool userType;
  static String companyName;
  static String companyPhone;
  static String companyTrn;
  static String token;
  static String licenseExpiryDate;
  static String cityName;
  static String user;

  static int getUserId(){
    userId = PreferenceUtils.getInt(Strings.userIdKey);
    return userId;
  }
  static String getUserName(){
    userName = PreferenceUtils.getString(Strings.userNameKey);
    return userName;
  }
  static String getUserEmail(){
    userEmail = PreferenceUtils.getString(Strings.userEmailKey);
    return userEmail;
  }
  static String getUserPhone(){
    userPhone = PreferenceUtils.getString(Strings.userPhoneKey);
    return userPhone;
  }
  static String getPassword(){
    password = PreferenceUtils.getString(Strings.passwordKey);
    return password;
  }
  static bool getUserType(){
    userType = PreferenceUtils.getBool(Strings.userTypeKey);
    return userType;
  }
  static String getCommpanyName(){
    companyName = PreferenceUtils.getString(Strings.companyNameKey);
    return companyName;
  }
  static String getCommpanyPhone(){
    companyPhone = PreferenceUtils.getString(Strings.companyPhoneKey);
    return companyPhone;
  }
  static String getCommpanyTrn(){
    companyTrn = PreferenceUtils.getString(Strings.companyTrnKey);
    return companyTrn;
  }
  static String getToken(){
    token = PreferenceUtils.getString(Strings.tokenKey);
    return token;
  }
  static String getUserImage(){
    userImage = PreferenceUtils.getString(Strings.userImageKey);
    // return  baseUrl + imagePath;
    return  userImage;
  }
  static String getLicenseExpiryDate(){
    licenseExpiryDate = PreferenceUtils.getString(Strings.licenseExpiryDateKey);
    return licenseExpiryDate;
  }
  static String getCityName(){
    cityName = PreferenceUtils.getString(Strings.cityNameKey);
    return cityName;
  }

  static String getUser(){
    user = PreferenceUtils.getString(Strings.userTypeKey);
    return user;
  }



  static setUserId(int id){
   PreferenceUtils.setInt(Strings.userIdKey, id);
  }
  static setUserName(String name) async{
    PreferenceUtils.setString(Strings.userNameKey, name);
  }
  static setUserEmail(String value){
   PreferenceUtils.setString(Strings.userEmailKey, value);
  }
  static setUserPhone(String phone){
    PreferenceUtils.setString(Strings.userPhoneKey, phone);
  }
  static setPassword(String password){
    PreferenceUtils.setString(Strings.passwordKey, password);
  }
  static setUserType(bool userType){
    PreferenceUtils.setBool(Strings.userTypeKey, userType);
  }
  static setCommpanyName(String companyName){
    PreferenceUtils.setString(Strings.companyNameKey, companyName);
  }
  static setCommpanyPhone(String companyPhone){
    PreferenceUtils.setString(Strings.companyPhoneKey, companyPhone);
  }
  static setCommpanyTrn(String companyTrn){
    PreferenceUtils.setString(Strings.companyTrnKey, companyTrn);
  }
  static setUserImage(String image){
    PreferenceUtils.setString(Strings.userImageKey, image);
  }
  static setToken(String token){
    PreferenceUtils.setString(Strings.tokenKey, "Bearer $token");
  }
  static String setLicenseExpiryDate(String licenseExpiryDate){
    PreferenceUtils.setString(Strings.licenseExpiryDateKey,licenseExpiryDate);
  }
  static String setCityName(String cityName){
    PreferenceUtils.setString(Strings.cityNameKey, cityName);

  }

  static String setUser(String Type){
    PreferenceUtils.setString(Strings.userTypeKey, Type);

  }

 }