/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"UserId":133,"FullName":"T2 driver2","Email":"","PhoneNumber":"+971501211144","LicenseNumber":"5854989","ProfilePicture":"http://apitruckoom.jinnbytedev.com/Files/UserImages/user.png","LicenseImages":[{"DocumentId":271,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Licenses/Screenshot 2021-02-06 at 14.35.09.png"},{"DocumentId":272,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Licenses/Screenshot 2021-02-06 at 14.35.04.png"}]}

class DriverDetailResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   DriverDetailResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  DriverDetailResponse.empty();

  DriverDetailResponse.fromJson(dynamic json) {
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

/// UserId : 133
/// FullName : "T2 driver2"
/// Email : ""
/// PhoneNumber : "+971501211144"
/// LicenseNumber : "5854989"
/// ProfilePicture : "http://apitruckoom.jinnbytedev.com/Files/UserImages/user.png"
/// LicenseImages : [{"DocumentId":271,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Licenses/Screenshot 2021-02-06 at 14.35.09.png"},{"DocumentId":272,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Licenses/Screenshot 2021-02-06 at 14.35.04.png"}]

class Result {
  int _userId;
  String _fullName;
  String _email;
  String _phoneNumber;
  String _licenseNumber;
  String _profilePicture;
  List<LicenseImages> _licenseImages;

  int get userId => _userId;
  String get fullName => _fullName;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get licenseNumber => _licenseNumber;
  String get profilePicture => _profilePicture;
  List<LicenseImages> get licenseImages => _licenseImages;

  Result({
      int userId, 
      String fullName, 
      String email, 
      String phoneNumber, 
      String licenseNumber, 
      String profilePicture, 
      List<LicenseImages> licenseImages}){
    _userId = userId;
    _fullName = fullName;
    _email = email;
    _phoneNumber = phoneNumber;
    _licenseNumber = licenseNumber;
    _profilePicture = profilePicture;
    _licenseImages = licenseImages;
}

  Result.fromJson(dynamic json) {
    _userId = json["UserId"];
    _fullName = json["FullName"];
    _email = json["Email"];
    _phoneNumber = json["PhoneNumber"];
    _licenseNumber = json["LicenseNumber"];
    _profilePicture = json["ProfilePicture"];
    if (json["LicenseImages"] != null) {
      _licenseImages = [];
      json["LicenseImages"].forEach((v) {
        _licenseImages.add(LicenseImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["UserId"] = _userId;
    map["FullName"] = _fullName;
    map["Email"] = _email;
    map["PhoneNumber"] = _phoneNumber;
    map["LicenseNumber"] = _licenseNumber;
    map["ProfilePicture"] = _profilePicture;
    if (_licenseImages != null) {
      map["LicenseImages"] = _licenseImages.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// DocumentId : 271
/// FilePath : "http://apitruckoom.jinnbytedev.com/Files/Licenses/Screenshot 2021-02-06 at 14.35.09.png"

class LicenseImages {
  int _documentId;
  String _filePath;

  int get documentId => _documentId;
  String get filePath => _filePath;

  LicenseImages({
      int documentId, 
      String filePath}){
    _documentId = documentId;
    _filePath = filePath;
}

  LicenseImages.fromJson(dynamic json) {
    _documentId = json["DocumentId"];
    _filePath = json["FilePath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["DocumentId"] = _documentId;
    map["FilePath"] = _filePath;
    return map;
  }

}