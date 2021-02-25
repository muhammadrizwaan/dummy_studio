/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"CouponId":22,"ShipperCost":19320.0,"NewShipperCost":19310.0,"NewFinalCost":20275.5}

class CouponCodeResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   CouponCodeResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  CouponCodeResponse.empty();

  CouponCodeResponse.fromJson(dynamic json) {
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

/// CouponId : 22
/// ShipperCost : 19320.0
/// NewShipperCost : 19310.0
/// NewFinalCost : 20275.5

class Result {
  int _couponId;
  double _shipperCost;
  double _newShipperCost;
  double _newFinalCost;

  int get couponId => _couponId;
  double get shipperCost => _shipperCost;
  double get newShipperCost => _newShipperCost;
  double get newFinalCost => _newFinalCost;

  Result({
      int couponId, 
      double shipperCost, 
      double newShipperCost, 
      double newFinalCost}){
    _couponId = couponId;
    _shipperCost = shipperCost;
    _newShipperCost = newShipperCost;
    _newFinalCost = newFinalCost;
}

  Result.fromJson(dynamic json) {
    _couponId = json["CouponId"];
    _shipperCost = json["ShipperCost"];
    _newShipperCost = json["NewShipperCost"];
    _newFinalCost = json["NewFinalCost"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["CouponId"] = _couponId;
    map["ShipperCost"] = _shipperCost;
    map["NewShipperCost"] = _newShipperCost;
    map["NewFinalCost"] = _newFinalCost;
    return map;
  }

}