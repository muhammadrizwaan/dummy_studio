/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"CityId":1,"Description":"Abu Dhabi"},{"CityId":2,"Description":"Dubai"},{"CityId":3,"Description":"Ajman"},{"CityId":4,"Description":"Fujairah"},{"CityId":5,"Description":"Ras al Khaimah"},{"CityId":6,"Description":"Sharjah"},{"CityId":7,"Description":"Umm al Quwain"}]

class CitiesResponse {
  String _message;
  int _code;
  List<Result> _result;

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

//   CitiesResponse({
//       String message,
//       int code,
//       List<Result> result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }
  CitiesResponse.empty();

  CitiesResponse.fromJson(dynamic json) {
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

/// CityId : 1
/// Description : "Abu Dhabi"

class Result {
  int _cityId;
  String _description;

  int get cityId => _cityId;
  String get description => _description;

//   Result({
//       int cityId,
//       String description}){
//     _cityId = cityId;
//     _description = description;
// }
  Result.empty();

  Result.fromJson(dynamic json) {
    _cityId = json["CityId"];
    _description = json["Description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["CityId"] = _cityId;
    map["Description"] = _description;
    return map;
  }

}