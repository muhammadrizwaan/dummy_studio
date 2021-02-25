/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"ShipperDiscount":0.0}

class ShipperDiscountResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   ShipperDiscountResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  ShipperDiscountResponse.empty();

  ShipperDiscountResponse.fromJson(dynamic json) {
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

/// ShipperDiscount : 0.0

class Result {
  double _shipperDiscount;

  double get shipperDiscount => _shipperDiscount;

  Result({
      double shipperDiscount}){
    _shipperDiscount = shipperDiscount;
}

  Result.fromJson(dynamic json) {
    _shipperDiscount = json["ShipperDiscount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ShipperDiscount"] = _shipperDiscount;
    return map;
  }

}