/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : "Load status has been updated successfully"

class StatusUpdateResponse {
  String _message;
  int _code;
  String _result;

  String get message => _message;
  int get code => _code;
  String get result => _result;

//   StatusUpdateResponse({
//       String message,
//       int code,
//       String result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  StatusUpdateResponse.empty();

  StatusUpdateResponse.fromJson(dynamic json) {
    _message = json["Message"];
    _code = json["Code"];
    _result = json["Result"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Message"] = _message;
    map["Code"] = _code;
    map["Result"] = _result;
    return map;
  }

}