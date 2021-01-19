/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"LoadId":10260}

class SaveLoadResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   SaveLoadResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }
  SaveLoadResponse.empty();

  SaveLoadResponse.fromJson(dynamic json) {
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

/// LoadId : 10260

class Result {
  int _loadId;

  int get loadId => _loadId;

  Result({
      int loadId}){
    _loadId = loadId;
}

  Result.fromJson(dynamic json) {
    _loadId = json["LoadId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadId"] = _loadId;
    return map;
  }

}