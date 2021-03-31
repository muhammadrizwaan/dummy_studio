/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"CouponId":34,"ShipperCost":440.0,"NewShipperCost":430.0,"NewFinalCost":434.3,"DiscountAmount":10.0,"VatAmount":4.3}

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

/// CouponId : 34
/// ShipperCost : 440.0
/// NewShipperCost : 430.0
/// NewFinalCost : 434.3
/// DiscountAmount : 10.0
/// VatAmount : 4.3

class Result {
  int _couponId;
  double _shipperCost;
  double _newShipperCost;
  double _newFinalCost;
  double _discountAmount;
  double _vatAmount;

  int get couponId => _couponId;
  double get shipperCost => _shipperCost;
  double get newShipperCost => _newShipperCost;
  double get newFinalCost => _newFinalCost;
  double get discountAmount => _discountAmount;
  double get vatAmount => _vatAmount;

  Result({
      int couponId, 
      double shipperCost, 
      double newShipperCost, 
      double newFinalCost, 
      double discountAmount, 
      double vatAmount}){
    _couponId = couponId;
    _shipperCost = shipperCost;
    _newShipperCost = newShipperCost;
    _newFinalCost = newFinalCost;
    _discountAmount = discountAmount;
    _vatAmount = vatAmount;
}

  Result.fromJson(dynamic json) {
    _couponId = json["CouponId"];
    _shipperCost = json["ShipperCost"];
    _newShipperCost = json["NewShipperCost"];
    _newFinalCost = json["NewFinalCost"];
    _discountAmount = json["DiscountAmount"];
    _vatAmount = json["VatAmount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["CouponId"] = _couponId;
    map["ShipperCost"] = _shipperCost;
    map["NewShipperCost"] = _newShipperCost;
    map["NewFinalCost"] = _newFinalCost;
    map["DiscountAmount"] = _discountAmount;
    map["VatAmount"] = _vatAmount;
    return map;
  }

}