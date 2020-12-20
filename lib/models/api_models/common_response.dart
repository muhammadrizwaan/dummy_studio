/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"user":{"UserId":4,"Email":"shipperbusiness@jinnbyte.com","Password":"123567","Phone":"456","Address":"Peco Road","UserTypeId":2,"UserStatusId":1,"FullName":"Shipper Business","CityId":1,"DeviceId":"string","EmiratesId":102993,"IsBusinessAccount":true,"IsActive":true,"IsAvailable":false,"CreatedOn":"2020-10-17T18:38:41.51","CreatedBy":0,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1,"CompanyInformations":[{"CompanyId":21,"CompanyName":"Jinnbyte","ContactNumber":"456","TRN":"123","CompanyLandline":"3838827","LicenseExpiryDate":"2020-10-07T00:00:00","CompanyAddress":"DHA 4","UserId":4}],"UserDocuments":[{"UserDocumentId":25,"UserId":4,"DocumentTypeId":1,"FilePath":"/Files/Licenses/3.jpeg","IsActive":true,"UpdatedOn":"2020-10-17T19:00:22.793","UpdatedBy":4},{"UserDocumentId":26,"UserId":4,"DocumentTypeId":1,"FilePath":"/Files/Licenses/2.jpeg","IsActive":true,"UpdatedOn":"2020-10-17T19:00:22.8","UpdatedBy":4}],"DriverDetails":[{"DriverDetailId":1004,"DriverId":4,"LicenseFrontPath":"/Files/Licenses/3.jpeg","LicenseBackPath":"/Files/Licenses/3.jpeg","EmiratesId":null}],"Ratings":[{"RatingId":6,"UserId":9,"LoadId":4,"Score":3.0,"Comment":"Average Response","RatedBy":4,"RatedOn":"2020-10-22T08:52:31.663"}]},"token":{"access_token":"TiEyugkkcmtrkKgR871RHq34_BX0fgVkVxskLheFBnQ7RjbONqzsP82xWibBu1ECHpIiLvcp1TJV4oMwstG7UYXZha08-pS-xPynOayPgMbGYamvr-d95gwRuAFOD1JfT7qTXoVcjYkG9KeST6yWEcngxRAFg_SZ6FVbS0v_MOQ3mt1_KbITrWG2nxpGHvbGFR7TsjT9mOhTRSuZu6ccLQu73UmufhohUf4RlCdftnkLm3dcUqEiS7VjqrTzsfk4L0ldJcUcoyzO9pi8MiDbjA","token_type":"bearer","expires_in":2591999,"refresh_token":"f1e61294-ece8-4451-8c8d-83a93552f57e"}}

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

/// user : {"UserId":4,"Email":"shipperbusiness@jinnbyte.com","Password":"123567","Phone":"456","Address":"Peco Road","UserTypeId":2,"UserStatusId":1,"FullName":"Shipper Business","CityId":1,"DeviceId":"string","EmiratesId":102993,"IsBusinessAccount":true,"IsActive":true,"IsAvailable":false,"CreatedOn":"2020-10-17T18:38:41.51","CreatedBy":0,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1,"CompanyInformations":[{"CompanyId":21,"CompanyName":"Jinnbyte","ContactNumber":"456","TRN":"123","CompanyLandline":"3838827","LicenseExpiryDate":"2020-10-07T00:00:00","CompanyAddress":"DHA 4","UserId":4}],"UserDocuments":[{"UserDocumentId":25,"UserId":4,"DocumentTypeId":1,"FilePath":"/Files/Licenses/3.jpeg","IsActive":true,"UpdatedOn":"2020-10-17T19:00:22.793","UpdatedBy":4},{"UserDocumentId":26,"UserId":4,"DocumentTypeId":1,"FilePath":"/Files/Licenses/2.jpeg","IsActive":true,"UpdatedOn":"2020-10-17T19:00:22.8","UpdatedBy":4}],"DriverDetails":[{"DriverDetailId":1004,"DriverId":4,"LicenseFrontPath":"/Files/Licenses/3.jpeg","LicenseBackPath":"/Files/Licenses/3.jpeg","EmiratesId":null}],"Ratings":[{"RatingId":6,"UserId":9,"LoadId":4,"Score":3.0,"Comment":"Average Response","RatedBy":4,"RatedOn":"2020-10-22T08:52:31.663"}]}
/// token : {"access_token":"TiEyugkkcmtrkKgR871RHq34_BX0fgVkVxskLheFBnQ7RjbONqzsP82xWibBu1ECHpIiLvcp1TJV4oMwstG7UYXZha08-pS-xPynOayPgMbGYamvr-d95gwRuAFOD1JfT7qTXoVcjYkG9KeST6yWEcngxRAFg_SZ6FVbS0v_MOQ3mt1_KbITrWG2nxpGHvbGFR7TsjT9mOhTRSuZu6ccLQu73UmufhohUf4RlCdftnkLm3dcUqEiS7VjqrTzsfk4L0ldJcUcoyzO9pi8MiDbjA","token_type":"bearer","expires_in":2591999,"refresh_token":"f1e61294-ece8-4451-8c8d-83a93552f57e"}

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

/// access_token : "TiEyugkkcmtrkKgR871RHq34_BX0fgVkVxskLheFBnQ7RjbONqzsP82xWibBu1ECHpIiLvcp1TJV4oMwstG7UYXZha08-pS-xPynOayPgMbGYamvr-d95gwRuAFOD1JfT7qTXoVcjYkG9KeST6yWEcngxRAFg_SZ6FVbS0v_MOQ3mt1_KbITrWG2nxpGHvbGFR7TsjT9mOhTRSuZu6ccLQu73UmufhohUf4RlCdftnkLm3dcUqEiS7VjqrTzsfk4L0ldJcUcoyzO9pi8MiDbjA"
/// token_type : "bearer"
/// expires_in : 2591999
/// refresh_token : "f1e61294-ece8-4451-8c8d-83a93552f57e"

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

/// UserId : 4
/// Email : "shipperbusiness@jinnbyte.com"
/// Password : "123567"
/// Phone : "456"
/// Address : "Peco Road"
/// UserTypeId : 2
/// UserStatusId : 1
/// FullName : "Shipper Business"
/// CityId : 1
/// DeviceId : "string"
/// EmiratesId : 102993
/// IsBusinessAccount : true
/// IsActive : true
/// IsAvailable : false
/// CreatedOn : "2020-10-17T18:38:41.51"
/// CreatedBy : 0
/// UpdatedOn : "2020-10-17T00:00:00"
/// UpdatedBy : 1
/// CompanyInformations : [{"CompanyId":21,"CompanyName":"Jinnbyte","ContactNumber":"456","TRN":"123","CompanyLandline":"3838827","LicenseExpiryDate":"2020-10-07T00:00:00","CompanyAddress":"DHA 4","UserId":4}]
/// UserDocuments : [{"UserDocumentId":25,"UserId":4,"DocumentTypeId":1,"FilePath":"/Files/Licenses/3.jpeg","IsActive":true,"UpdatedOn":"2020-10-17T19:00:22.793","UpdatedBy":4},{"UserDocumentId":26,"UserId":4,"DocumentTypeId":1,"FilePath":"/Files/Licenses/2.jpeg","IsActive":true,"UpdatedOn":"2020-10-17T19:00:22.8","UpdatedBy":4}]
/// DriverDetails : [{"DriverDetailId":1004,"DriverId":4,"LicenseFrontPath":"/Files/Licenses/3.jpeg","LicenseBackPath":"/Files/Licenses/3.jpeg","EmiratesId":null}]
/// Ratings : [{"RatingId":6,"UserId":9,"LoadId":4,"Score":3.0,"Comment":"Average Response","RatedBy":4,"RatedOn":"2020-10-22T08:52:31.663"}]

class User {
  int _userId;
  String _email;
  String _password;
  String _phone;
  String _address;
  int _userTypeId;
  int _userStatusId;
  String _fullName;
  int _cityId;
  String _deviceId;
  int _emiratesId;
  bool _isBusinessAccount;
  bool _isActive;
  bool _isAvailable;
  String _createdOn;
  int _createdBy;
  String _updatedOn;
  int _updatedBy;
  List<CompanyInformations> _companyInformations;
  List<UserDocuments> _userDocuments;
  List<DriverDetails> _driverDetails;
  List<Ratings> _ratings;

  int get userId => _userId;
  String get email => _email;
  String get password => _password;
  String get phone => _phone;
  String get address => _address;
  int get userTypeId => _userTypeId;
  int get userStatusId => _userStatusId;
  String get fullName => _fullName;
  int get cityId => _cityId;
  String get deviceId => _deviceId;
  int get emiratesId => _emiratesId;
  bool get isBusinessAccount => _isBusinessAccount;
  bool get isActive => _isActive;
  bool get isAvailable => _isAvailable;
  String get createdOn => _createdOn;
  int get createdBy => _createdBy;
  String get updatedOn => _updatedOn;
  int get updatedBy => _updatedBy;
  List<CompanyInformations> get companyInformations => _companyInformations;
  List<UserDocuments> get userDocuments => _userDocuments;
  List<DriverDetails> get driverDetails => _driverDetails;
  List<Ratings> get ratings => _ratings;

  User({
      int userId, 
      String email, 
      String password, 
      String phone, 
      String address, 
      int userTypeId, 
      int userStatusId, 
      String fullName, 
      int cityId, 
      String deviceId, 
      int emiratesId, 
      bool isBusinessAccount, 
      bool isActive, 
      bool isAvailable, 
      String createdOn, 
      int createdBy, 
      String updatedOn, 
      int updatedBy, 
      List<CompanyInformations> companyInformations, 
      List<UserDocuments> userDocuments, 
      List<DriverDetails> driverDetails, 
      List<Ratings> ratings}){
    _userId = userId;
    _email = email;
    _password = password;
    _phone = phone;
    _address = address;
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
    _ratings = ratings;
}

  User.fromJson(dynamic json) {
    _userId = json["UserId"];
    _email = json["Email"];
    _password = json["Password"];
    _phone = json["Phone"];
    _address = json["Address"];
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
    map["Email"] = _email;
    map["Password"] = _password;
    map["Phone"] = _phone;
    map["Address"] = _address;
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
    if (_ratings != null) {
      map["Ratings"] = _ratings.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// RatingId : 6
/// UserId : 9
/// LoadId : 4
/// Score : 3.0
/// Comment : "Average Response"
/// RatedBy : 4
/// RatedOn : "2020-10-22T08:52:31.663"

class Ratings {
  int _ratingId;
  int _userId;
  int _loadId;
  double _score;
  String _comment;
  int _ratedBy;
  String _ratedOn;

  int get ratingId => _ratingId;
  int get userId => _userId;
  int get loadId => _loadId;
  double get score => _score;
  String get comment => _comment;
  int get ratedBy => _ratedBy;
  String get ratedOn => _ratedOn;

  Ratings({
      int ratingId, 
      int userId, 
      int loadId, 
      double score, 
      String comment, 
      int ratedBy, 
      String ratedOn}){
    _ratingId = ratingId;
    _userId = userId;
    _loadId = loadId;
    _score = score;
    _comment = comment;
    _ratedBy = ratedBy;
    _ratedOn = ratedOn;
}

  Ratings.fromJson(dynamic json) {
    _ratingId = json["RatingId"];
    _userId = json["UserId"];
    _loadId = json["LoadId"];
    _score = json["Score"];
    _comment = json["Comment"];
    _ratedBy = json["RatedBy"];
    _ratedOn = json["RatedOn"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["RatingId"] = _ratingId;
    map["UserId"] = _userId;
    map["LoadId"] = _loadId;
    map["Score"] = _score;
    map["Comment"] = _comment;
    map["RatedBy"] = _ratedBy;
    map["RatedOn"] = _ratedOn;
    return map;
  }

}

/// DriverDetailId : 1004
/// DriverId : 4
/// LicenseFrontPath : "/Files/Licenses/3.jpeg"
/// LicenseBackPath : "/Files/Licenses/3.jpeg"
/// EmiratesId : null
class DriverDetails1 {
  int _driverDetailId;
  int _driverId;
  String _licenseFrontPath;
  String _licenseBackPath;
  dynamic _emiratesId;

  int get driverDetailId => _driverDetailId;
  int get driverId => _driverId;
  String get licenseFrontPath => _licenseFrontPath;
  String get licenseBackPath => _licenseBackPath;
  dynamic get emiratesId => _emiratesId;

  DriverDetails({
    int driverDetailId,
    int driverId,
    String licenseFrontPath,
    String licenseBackPath,
    dynamic emiratesId}){
    _driverDetailId = driverDetailId;
    _driverId = driverId;
    _licenseFrontPath = licenseFrontPath;
    _licenseBackPath = licenseBackPath;
    _emiratesId = emiratesId;
  }

  DriverDetails1.fromJson(dynamic json) {
    _driverDetailId = json["DriverDetailId"];
    _driverId = json["DriverId"];
    _licenseFrontPath = json["LicenseFrontPath"];
    _licenseBackPath = json["LicenseBackPath"];
    _emiratesId = json["EmiratesId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["DriverDetailId"] = _driverDetailId;
    map["DriverId"] = _driverId;
    map["LicenseFrontPath"] = _licenseFrontPath;
    map["LicenseBackPath"] = _licenseBackPath;
    map["EmiratesId"] = _emiratesId;
    return map;
  }

}

class DriverDetails {
  int _driverDetailId;
  int _driverId;
  String _licenseFrontPath;
  String _licenseBackPath;
  dynamic _emiratesId;

  int get driverDetailId => _driverDetailId;
  int get driverId => _driverId;
  String get licenseFrontPath => _licenseFrontPath;
  String get licenseBackPath => _licenseBackPath;
  dynamic get emiratesId => _emiratesId;

  DriverDetails({
      int driverDetailId, 
      int driverId, 
      String licenseFrontPath, 
      String licenseBackPath, 
      dynamic emiratesId}){
    _driverDetailId = driverDetailId;
    _driverId = driverId;
    _licenseFrontPath = licenseFrontPath;
    _licenseBackPath = licenseBackPath;
    _emiratesId = emiratesId;
}

  DriverDetails.fromJson(dynamic json) {
    _driverDetailId = json["DriverDetailId"];
    _driverId = json["DriverId"];
    _licenseFrontPath = json["LicenseFrontPath"];
    _licenseBackPath = json["LicenseBackPath"];
    _emiratesId = json["EmiratesId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["DriverDetailId"] = _driverDetailId;
    map["DriverId"] = _driverId;
    map["LicenseFrontPath"] = _licenseFrontPath;
    map["LicenseBackPath"] = _licenseBackPath;
    map["EmiratesId"] = _emiratesId;
    return map;
  }

}

/// UserDocumentId : 25
/// UserId : 4
/// DocumentTypeId : 1
/// FilePath : "/Files/Licenses/3.jpeg"
/// IsActive : true
/// UpdatedOn : "2020-10-17T19:00:22.793"
/// UpdatedBy : 4

class UserDocuments {
  int _userDocumentId;
  int _userId;
  int _documentTypeId;
  String _filePath;
  bool _isActive;
  String _updatedOn;
  int _updatedBy;

  int get userDocumentId => _userDocumentId;
  int get userId => _userId;
  int get documentTypeId => _documentTypeId;
  String get filePath => _filePath;
  bool get isActive => _isActive;
  String get updatedOn => _updatedOn;
  int get updatedBy => _updatedBy;

  UserDocuments({
      int userDocumentId, 
      int userId, 
      int documentTypeId, 
      String filePath, 
      bool isActive, 
      String updatedOn, 
      int updatedBy}){
    _userDocumentId = userDocumentId;
    _userId = userId;
    _documentTypeId = documentTypeId;
    _filePath = filePath;
    _isActive = isActive;
    _updatedOn = updatedOn;
    _updatedBy = updatedBy;
}

  UserDocuments.fromJson(dynamic json) {
    _userDocumentId = json["UserDocumentId"];
    _userId = json["UserId"];
    _documentTypeId = json["DocumentTypeId"];
    _filePath = json["FilePath"];
    _isActive = json["IsActive"];
    _updatedOn = json["UpdatedOn"];
    _updatedBy = json["UpdatedBy"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["UserDocumentId"] = _userDocumentId;
    map["UserId"] = _userId;
    map["DocumentTypeId"] = _documentTypeId;
    map["FilePath"] = _filePath;
    map["IsActive"] = _isActive;
    map["UpdatedOn"] = _updatedOn;
    map["UpdatedBy"] = _updatedBy;
    return map;
  }

}

/// CompanyId : 21
/// CompanyName : "Jinnbyte"
/// ContactNumber : "456"
/// TRN : "123"
/// CompanyLandline : "3838827"
/// LicenseExpiryDate : "2020-10-07T00:00:00"
/// CompanyAddress : "DHA 4"
/// UserId : 4

class CompanyInformations {
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

  CompanyInformations({
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

  CompanyInformations.fromJson(dynamic json) {
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