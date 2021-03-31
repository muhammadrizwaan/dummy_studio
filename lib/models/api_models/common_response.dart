/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"user":{"UserId":2281,"Username":"business2","Email":"b1@jinnbyte.com","Password":"qqqqqq1!","Phone":"03452525159","Address":"","Location":"","Latitude":0.0,"Longitude":0.0,"UserTypeId":2,"UserStatusId":1,"FullName":"business2","ProfilePicture":"/Files/UserImages/image_picker7580087138277318782.jpg","CityId":2,"CityName":"Dubai","DeviceId":"string","EmiratesId":0,"IsBusinessAccount":true,"IsAvailable":false,"CompanyInformation":[{"CompanyId":3139,"CompanyName":"jinnbyte2","ContactNumber":"03452525352","TRN":"2545258","CompanyLandline":"","LicenseExpiryDate":"2020-12-23","CompanyAddress":"","UserId":2281}],"UserDocuments":[{"UserDocumentId":1168,"UserId":2281,"DocumentTypeId":1,"FilePath":"/Files/Licenses/Screenshot 2020-10-07 at 22.11.40.png"},{"UserDocumentId":1169,"UserId":2281,"DocumentTypeId":2,"FilePath":"/Files/Licenses/Screenshot 2020-10-07 at 22.11.46.png"}]},"token":{"access_token":"XnGq-Vzw0_3OEWQL5cP6SWHvbEY_5Zu2e_R2XmmLNoW7y_jvLG4dqsZlNHNJkbnpsollCDv9hM-6Zi09BBRYptB5L-Qza3z5ZC_Av-zORLmDIakhCv_0zM_RRxr873SCbIhhJk9tZYK4381CUDf09CcbgpwD-qNquJVe95N4nkSj-lQFcUMF7vu3FRxLITR2Cwh05fRJ4C1v7Q33zi7b9tvjuJ6a38qeOHNNtU6IfIWhMeztDt7KTKOYd5A_RV-E","token_type":"bearer","expires_in":899,"refresh_token":"b8c9bc9e-2385-4d8d-805c-ee6cd09fe6ea"}}

class CommonResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   CommonResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  CommonResponse.empty();

  CommonResponse.fromJson(dynamic json) {
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

/// user : {"UserId":2281,"Username":"business2","Email":"b1@jinnbyte.com","Password":"qqqqqq1!","Phone":"03452525159","Address":"","Location":"","Latitude":0.0,"Longitude":0.0,"UserTypeId":2,"UserStatusId":1,"FullName":"business2","ProfilePicture":"/Files/UserImages/image_picker7580087138277318782.jpg","CityId":2,"CityName":"Dubai","DeviceId":"string","EmiratesId":0,"IsBusinessAccount":true,"IsAvailable":false,"CompanyInformation":[{"CompanyId":3139,"CompanyName":"jinnbyte2","ContactNumber":"03452525352","TRN":"2545258","CompanyLandline":"","LicenseExpiryDate":"2020-12-23","CompanyAddress":"","UserId":2281}],"UserDocuments":[{"UserDocumentId":1168,"UserId":2281,"DocumentTypeId":1,"FilePath":"/Files/Licenses/Screenshot 2020-10-07 at 22.11.40.png"},{"UserDocumentId":1169,"UserId":2281,"DocumentTypeId":2,"FilePath":"/Files/Licenses/Screenshot 2020-10-07 at 22.11.46.png"}]}
/// token : {"access_token":"XnGq-Vzw0_3OEWQL5cP6SWHvbEY_5Zu2e_R2XmmLNoW7y_jvLG4dqsZlNHNJkbnpsollCDv9hM-6Zi09BBRYptB5L-Qza3z5ZC_Av-zORLmDIakhCv_0zM_RRxr873SCbIhhJk9tZYK4381CUDf09CcbgpwD-qNquJVe95N4nkSj-lQFcUMF7vu3FRxLITR2Cwh05fRJ4C1v7Q33zi7b9tvjuJ6a38qeOHNNtU6IfIWhMeztDt7KTKOYd5A_RV-E","token_type":"bearer","expires_in":899,"refresh_token":"b8c9bc9e-2385-4d8d-805c-ee6cd09fe6ea"}

class Result {
  User _user;
  Token _token;

  User get user => _user;
  Token get token => _token;

  Result({
      User user, 
      Token token}){
    _user = user;
    _token = token;
}

  Result.fromJson(dynamic json) {
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
    _token = json["token"] != null ? Token.fromJson(json["token"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    if (_token != null) {
      map["token"] = _token.toJson();
    }
    return map;
  }

}

/// access_token : "XnGq-Vzw0_3OEWQL5cP6SWHvbEY_5Zu2e_R2XmmLNoW7y_jvLG4dqsZlNHNJkbnpsollCDv9hM-6Zi09BBRYptB5L-Qza3z5ZC_Av-zORLmDIakhCv_0zM_RRxr873SCbIhhJk9tZYK4381CUDf09CcbgpwD-qNquJVe95N4nkSj-lQFcUMF7vu3FRxLITR2Cwh05fRJ4C1v7Q33zi7b9tvjuJ6a38qeOHNNtU6IfIWhMeztDt7KTKOYd5A_RV-E"
/// token_type : "bearer"
/// expires_in : 899
/// refresh_token : "b8c9bc9e-2385-4d8d-805c-ee6cd09fe6ea"

class Token {
  String _accessToken;
  String _tokenType;
  int _expiresIn;
  String _refreshToken;

  String get accessToken => _accessToken;
  String get tokenType => _tokenType;
  int get expiresIn => _expiresIn;
  String get refreshToken => _refreshToken;

  Token({
      String accessToken, 
      String tokenType, 
      int expiresIn, 
      String refreshToken}){
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _refreshToken = refreshToken;
}

  Token.fromJson(dynamic json) {
    _accessToken = json["access_token"];
    _tokenType = json["token_type"];
    _expiresIn = json["expires_in"];
    _refreshToken = json["refresh_token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["access_token"] = _accessToken;
    map["token_type"] = _tokenType;
    map["expires_in"] = _expiresIn;
    map["refresh_token"] = _refreshToken;
    return map;
  }

}

/// UserId : 2281
/// Username : "business2"
/// Email : "b1@jinnbyte.com"
/// Password : "qqqqqq1!"
/// Phone : "03452525159"
/// Address : ""
/// Location : ""
/// Latitude : 0.0
/// Longitude : 0.0
/// UserTypeId : 2
/// UserStatusId : 1
/// FullName : "business2"
/// ProfilePicture : "/Files/UserImages/image_picker7580087138277318782.jpg"
/// CityId : 2
/// CityName : "Dubai"
/// DeviceId : "string"
/// EmiratesId : 0
/// IsBusinessAccount : true
/// IsAvailable : false
/// CompanyInformation : [{"CompanyId":3139,"CompanyName":"jinnbyte2","ContactNumber":"03452525352","TRN":"2545258","CompanyLandline":"","LicenseExpiryDate":"2020-12-23","CompanyAddress":"","UserId":2281}]
/// UserDocuments : [{"UserDocumentId":1168,"UserId":2281,"DocumentTypeId":1,"FilePath":"/Files/Licenses/Screenshot 2020-10-07 at 22.11.40.png"},{"UserDocumentId":1169,"UserId":2281,"DocumentTypeId":2,"FilePath":"/Files/Licenses/Screenshot 2020-10-07 at 22.11.46.png"}]

class User {
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
  String _profilePicture;
  int _cityId;
  String _cityName;
  String _deviceId;
  String _emiratesId;
  bool _isBusinessAccount;
  bool _isAvailable;
  List<CompanyInformation> _companyInformation;
  List<UserDocuments> _userDocuments;

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
  String get profilePicture => _profilePicture;
  int get cityId => _cityId;
  String get cityName => _cityName;
  String get deviceId => _deviceId;
  String get emiratesId => _emiratesId;
  bool get isBusinessAccount => _isBusinessAccount;
  bool get isAvailable => _isAvailable;
  List<CompanyInformation> get companyInformation => _companyInformation;
  List<UserDocuments> get userDocuments => _userDocuments;

  User({
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
      String profilePicture, 
      int cityId, 
      String cityName, 
      String deviceId, 
      String emiratesId,
      bool isBusinessAccount, 
      bool isAvailable, 
      List<CompanyInformation> companyInformation, 
      List<UserDocuments> userDocuments}){
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
    _profilePicture = profilePicture;
    _cityId = cityId;
    _cityName = cityName;
    _deviceId = deviceId;
    _emiratesId = emiratesId;
    _isBusinessAccount = isBusinessAccount;
    _isAvailable = isAvailable;
    _companyInformation = companyInformation;
    _userDocuments = userDocuments;
}

  User.fromJson(dynamic json) {
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
    _profilePicture = json["ProfilePicture"];
    _cityId = json["CityId"];
    _cityName = json["CityName"];
    _deviceId = json["DeviceId"];
    _emiratesId = json["EmiratesId"];
    _isBusinessAccount = json["IsBusinessAccount"];
    _isAvailable = json["IsAvailable"];
    if (json["CompanyInformation"] != null) {
      _companyInformation = [];
      json["CompanyInformation"].forEach((v) {
        _companyInformation.add(CompanyInformation.fromJson(v));
      });
    }
    if (json["UserDocuments"] != null) {
      _userDocuments = [];
      json["UserDocuments"].forEach((v) {
        _userDocuments.add(UserDocuments.fromJson(v));
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
    map["ProfilePicture"] = _profilePicture;
    map["CityId"] = _cityId;
    map["CityName"] = _cityName;
    map["DeviceId"] = _deviceId;
    map["EmiratesId"] = _emiratesId;
    map["IsBusinessAccount"] = _isBusinessAccount;
    map["IsAvailable"] = _isAvailable;
    if (_companyInformation != null) {
      map["CompanyInformation"] = _companyInformation.map((v) => v.toJson()).toList();
    }
    if (_userDocuments != null) {
      map["UserDocuments"] = _userDocuments.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// UserDocumentId : 1168
/// UserId : 2281
/// DocumentTypeId : 1
/// FilePath : "/Files/Licenses/Screenshot 2020-10-07 at 22.11.40.png"

class UserDocuments {
  int _userDocumentId;
  int _userId;
  int _documentTypeId;
  String _filePath;

  int get userDocumentId => _userDocumentId;
  int get userId => _userId;
  int get documentTypeId => _documentTypeId;
  String get filePath => _filePath;

  UserDocuments({
      int userDocumentId, 
      int userId, 
      int documentTypeId, 
      String filePath}){
    _userDocumentId = userDocumentId;
    _userId = userId;
    _documentTypeId = documentTypeId;
    _filePath = filePath;
}

  UserDocuments.fromJson(dynamic json) {
    _userDocumentId = json["UserDocumentId"];
    _userId = json["UserId"];
    _documentTypeId = json["DocumentTypeId"];
    _filePath = json["FilePath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["UserDocumentId"] = _userDocumentId;
    map["UserId"] = _userId;
    map["DocumentTypeId"] = _documentTypeId;
    map["FilePath"] = _filePath;
    return map;
  }

}

/// CompanyId : 3139
/// CompanyName : "jinnbyte2"
/// ContactNumber : "03452525352"
/// TRN : "2545258"
/// CompanyLandline : ""
/// LicenseExpiryDate : "2020-12-23"
/// CompanyAddress : ""
/// UserId : 2281

class CompanyInformation {
  int _companyId;
  String _companyName;
  String _contactNumber;
  String _trn;
  String _companyLandline;
  String _licenseExpiryDate;
  String _companyAddress;
  int _userId;

  int get companyId => _companyId;
  String get companyName => _companyName;
  String get contactNumber => _contactNumber;
  String get trn => _trn;
  String get companyLandline => _companyLandline;
  String get licenseExpiryDate => _licenseExpiryDate;
  String get companyAddress => _companyAddress;
  int get userId => _userId;

  CompanyInformation({
      int companyId, 
      String companyName, 
      String contactNumber, 
      String trn, 
      String companyLandline, 
      String licenseExpiryDate, 
      String companyAddress, 
      int userId}){
    _companyId = companyId;
    _companyName = companyName;
    _contactNumber = contactNumber;
    _trn = trn;
    _companyLandline = companyLandline;
    _licenseExpiryDate = licenseExpiryDate;
    _companyAddress = companyAddress;
    _userId = userId;
}

  CompanyInformation.fromJson(dynamic json) {
    _companyId = json["CompanyId"];
    _companyName = json["CompanyName"];
    _contactNumber = json["ContactNumber"];
    _trn = json["TRN"];
    _companyLandline = json["CompanyLandline"];
    _licenseExpiryDate = json["LicenseExpiryDate"];
    _companyAddress = json["CompanyAddress"];
    _userId = json["UserId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["CompanyId"] = _companyId;
    map["CompanyName"] = _companyName;
    map["ContactNumber"] = _contactNumber;
    map["TRN"] = _trn;
    map["CompanyLandline"] = _companyLandline;
    map["LicenseExpiryDate"] = _licenseExpiryDate;
    map["CompanyAddress"] = _companyAddress;
    map["UserId"] = _userId;
    return map;
  }

}