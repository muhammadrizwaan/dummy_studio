/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"UserDocumentId":1270,"UserId":2387,"DocumentTypeId":1,"FilePath":"/Files/Licenses/12. Salon Profile.jpg","IsActive":true,"UpdatedOn":"2021-01-13T04:47:31.5139768-06:00","UpdatedBy":2387},{"UserDocumentId":1271,"UserId":2387,"DocumentTypeId":2,"FilePath":"/Files/Licenses/back.jpg","IsActive":true,"UpdatedOn":"2021-01-13T04:47:31.5139768-06:00","UpdatedBy":2387}]

class LicenseImagesResponse {
  String _message;
  int _code;
  List<Result> _result;

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

//   LicenseImagesResponse({
//       String message,
//       int code,
//       List<Result> result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  LicenseImagesResponse.empty();

  LicenseImagesResponse.fromJson(dynamic json) {
    _message = json["Message"];
    _code = json["Code"];
    if (json["Result"] != null) {
      _result = [];
      json["Result"].forEach((v) {
        _result.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Message"] = _message;
    map["Code"] = _code;
    if (_result != null) {
      map["Result"] = _result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// UserDocumentId : 1270
/// UserId : 2387
/// DocumentTypeId : 1
/// FilePath : "/Files/Licenses/12. Salon Profile.jpg"
/// IsActive : true
/// UpdatedOn : "2021-01-13T04:47:31.5139768-06:00"
/// UpdatedBy : 2387

class Result {
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

  Result({
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

  Result.fromJson(dynamic json) {
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