/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"GoodTypeId":1,"Description":"Cargo"},{"GoodTypeId":2,"Description":"Car Engine"},{"GoodTypeId":3,"Description":"fafafa"},{"GoodTypeId":4,"Description":"Abd Good"}]

class GoodTypesResponse {
  String _message;
  int _code;
  List<Result> _result;

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

//   GoodTypesResponse({
//       String message,
//       int code,
//       List<Result> result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  GoodTypesResponse.empty();

  GoodTypesResponse.fromJson(dynamic json) {
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

/// GoodTypeId : 1
/// Description : "Cargo"

class Result {
  int _goodTypeId;
  String _description;

  int get goodTypeId => _goodTypeId;
  String get description => _description;

  Result({
      int goodTypeId,
      String description}){
    _goodTypeId = goodTypeId;
    _description = description;
}

  Result.fromJson(dynamic json) {
    _goodTypeId = json["GoodTypeId"];
    _description = json["Description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["GoodTypeId"] = _goodTypeId;
    map["Description"] = _description;
    return map;
  }

}