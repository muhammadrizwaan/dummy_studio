/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"Message":"Load saved successfully"}

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

/// Message : "Load saved successfully"

class Result {
  String _message;

  String get message => _message;

  Result({
      String message}){
    _message = message;
}

  Result.fromJson(dynamic json) {
    _message = json["Message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Message"] = _message;
    return map;
  }

}