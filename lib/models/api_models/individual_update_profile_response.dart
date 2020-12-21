import 'package:truckoom_shipper/models/api_models/common_response.dart';

/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"UserId":2053,"Username":"HelloWorld","Email":"shipperindividual@jinnbyte.com","Password":"1234212","Phone":"123456789","Address":"","Location":"","Latitude":0.0,"Longitude":0.0,"UserTypeId":2,"UserStatusId":1,"FullName":"Hello World","CityId":null,"DeviceId":"JohnDoe","EmiratesId":0,"IsBusinessAccount":false,"IsActive":true,"IsAvailable":false,"CreatedOn":"2020-12-04T17:56:33.51","CreatedBy":0,"UpdatedOn":"2020-12-10T23:42:28.6238057-06:00","UpdatedBy":2053,"CompanyInformations":[],"UserDocuments":[],"DriverDetails":[],"DriverDetails1":[],"Ratings":[]}

class IndividualUpdateProfileResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   IndividualUpdateProfileResponse({
// //       String message,
// //       int code,
// //       Result result}){
// //     _message = message;
// //     _code = code;
// //     _result = result;
// // }

  IndividualUpdateProfileResponse.empty();

  IndividualUpdateProfileResponse.fromJson(dynamic json) {
    _message = json["Message"];
    _code = json["Code"];
    _result = json["Result"] != null ? Result.fromJson(json["Result"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Message"] = _message;
    map["Code"] = _code;
    if (_result != null) {
      map["Result"] = _result.toJson();
    }
    return map;
  }

}

/// UserId : 2053
/// Username : "HelloWorld"
/// Email : "shipperindividual@jinnbyte.com"
/// Password : "1234212"
/// Phone : "123456789"
/// Address : ""
/// Location : ""
/// Latitude : 0.0
/// Longitude : 0.0
/// UserTypeId : 2
/// UserStatusId : 1
/// FullName : "Hello World"
/// CityId : null
/// DeviceId : "JohnDoe"
/// EmiratesId : 0
/// IsBusinessAccount : false
/// IsActive : true
/// IsAvailable : false
/// CreatedOn : "2020-12-04T17:56:33.51"
/// CreatedBy : 0
/// UpdatedOn : "2020-12-10T23:42:28.6238057-06:00"
/// UpdatedBy : 2053
/// CompanyInformations : []
/// UserDocuments : []
/// DriverDetails : []
/// DriverDetails1 : []
/// Ratings : []

class Result {
  int _userId;
  String _username;
  String _email;
  String _password;
  String _phone;
  String _address;
  String _location;
  double _latitude;
  double _longitude;
  int _userTypeId;
  int _userStatusId;
  String _fullName;
  dynamic _cityId;
  String _deviceId;
  int _emiratesId;
  bool _isBusinessAccount;
  bool _isActive;
  bool _isAvailable;
  String _createdOn;
  int _createdBy;
  String _updatedOn;
  int _updatedBy;
  List<dynamic> _companyInformations;
  List<dynamic> _userDocuments;
  List<dynamic> _driverDetails;
  List<dynamic> _driverDetails1;
  List<dynamic> _ratings;

  int get userId => _userId;
  String get username => _username;
  String get email => _email;
  String get password => _password;
  String get phone => _phone;
  String get address => _address;
  String get location => _location;
  double get latitude => _latitude;
  double get longitude => _longitude;
  int get userTypeId => _userTypeId;
  int get userStatusId => _userStatusId;
  String get fullName => _fullName;
  dynamic get cityId => _cityId;
  String get deviceId => _deviceId;
  int get emiratesId => _emiratesId;
  bool get isBusinessAccount => _isBusinessAccount;
  bool get isActive => _isActive;
  bool get isAvailable => _isAvailable;
  String get createdOn => _createdOn;
  int get createdBy => _createdBy;
  String get updatedOn => _updatedOn;
  int get updatedBy => _updatedBy;
  List<dynamic> get companyInformations => _companyInformations;
  List<dynamic> get userDocuments => _userDocuments;
  List<dynamic> get driverDetails => _driverDetails;
  List<dynamic> get driverDetails1 => _driverDetails1;
  List<dynamic> get ratings => _ratings;

  Result({
      int userId, 
      String username, 
      String email, 
      String password, 
      String phone, 
      String address, 
      String location, 
      double latitude, 
      double longitude, 
      int userTypeId, 
      int userStatusId, 
      String fullName, 
      dynamic cityId, 
      String deviceId, 
      int emiratesId, 
      bool isBusinessAccount, 
      bool isActive, 
      bool isAvailable, 
      String createdOn, 
      int createdBy, 
      String updatedOn, 
      int updatedBy, 
      List<dynamic> companyInformations, 
      List<dynamic> userDocuments, 
      List<dynamic> driverDetails, 
      List<dynamic> driverDetails1, 
      List<dynamic> ratings}){
    _userId = userId;
    _username = username;
    _email = email;
    _password = password;
    _phone = phone;
    _address = address;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _userTypeId = userTypeId;
    _userStatusId = userStatusId;
    _fullName = fullName;
    _cityId = cityId;
    _deviceId = deviceId;
    _emiratesId = emiratesId;
    _isBusinessAccount = isBusinessAccount;
    _isActive = isActive;
    _isAvailable = isAvailable;
    _createdOn = createdOn;
    _createdBy = createdBy;
    _updatedOn = updatedOn;
    _updatedBy = updatedBy;
    _companyInformations = companyInformations;
    _userDocuments = userDocuments;
    _driverDetails = driverDetails;
    _driverDetails1 = driverDetails1;
    _ratings = ratings;
}

  Result.fromJson(dynamic json) {
    _userId = json["UserId"];
    _username = json["Username"];
    _email = json["Email"];
    _password = json["Password"];
    _phone = json["Phone"];
    _address = json["Address"];
    _location = json["Location"];
    _latitude = json["Latitude"];
    _longitude = json["Longitude"];
    _userTypeId = json["UserTypeId"];
    _userStatusId = json["UserStatusId"];
    _fullName = json["FullName"];
    _cityId = json["CityId"];
    _deviceId = json["DeviceId"];
    _emiratesId = json["EmiratesId"];
    _isBusinessAccount = json["IsBusinessAccount"];
    _isActive = json["IsActive"];
    _isAvailable = json["IsAvailable"];
    _createdOn = json["CreatedOn"];
    _createdBy = json["CreatedBy"];
    _updatedOn = json["UpdatedOn"];
    _updatedBy = json["UpdatedBy"];
    if (json["CompanyInformations"] != null) {
      _companyInformations = [];
      json["CompanyInformations"].forEach((v) {
        _companyInformations.add(CompanyInformations.fromJson(v));
      });
    }
    if (json["UserDocuments"] != null) {
      _userDocuments = [];
      json["UserDocuments"].forEach((v) {
        _userDocuments.add(UserDocuments.fromJson(v));
      });
    }
    if (json["DriverDetails"] != null) {
      _driverDetails = [];
      json["DriverDetails"].forEach((v) {
        _driverDetails.add(DriverDetails.fromJson(v));
      });
    }
    if (json["DriverDetails1"] != null) {
      _driverDetails1 = [];
      json["DriverDetails1"].forEach((v) {
        _driverDetails1.add(DriverDetails1.fromJson(v));
      });
    }
    if (json["Ratings"] != null) {
      _ratings = [];
      json["Ratings"].forEach((v) {
        _ratings.add(Ratings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["UserId"] = _userId;
    map["Username"] = _username;
    map["Email"] = _email;
    map["Password"] = _password;
    map["Phone"] = _phone;
    map["Address"] = _address;
    map["Location"] = _location;
    map["Latitude"] = _latitude;
    map["Longitude"] = _longitude;
    map["UserTypeId"] = _userTypeId;
    map["UserStatusId"] = _userStatusId;
    map["FullName"] = _fullName;
    map["CityId"] = _cityId;
    map["DeviceId"] = _deviceId;
    map["EmiratesId"] = _emiratesId;
    map["IsBusinessAccount"] = _isBusinessAccount;
    map["IsActive"] = _isActive;
    map["IsAvailable"] = _isAvailable;
    map["CreatedOn"] = _createdOn;
    map["CreatedBy"] = _createdBy;
    map["UpdatedOn"] = _updatedOn;
    map["UpdatedBy"] = _updatedBy;
    if (_companyInformations != null) {
      map["CompanyInformations"] = _companyInformations.map((v) => v.toJson()).toList();
    }
    if (_userDocuments != null) {
      map["UserDocuments"] = _userDocuments.map((v) => v.toJson()).toList();
    }
    if (_driverDetails != null) {
      map["DriverDetails"] = _driverDetails.map((v) => v.toJson()).toList();
    }
    if (_driverDetails1 != null) {
      map["DriverDetails1"] = _driverDetails1.map((v) => v.toJson()).toList();
    }
    if (_ratings != null) {
      map["Ratings"] = _ratings.map((v) => v.toJson()).toList();
    }
    return map;
  }

}