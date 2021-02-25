/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"LoadId":401,"Distance":111.0,"ShipperCost":19320.0,"FinalCost":20286.0,"RoundTripCost":0.0,"ValueAddedTax":966.0,"VATPercentage":0.05,"ShipperDiscount":0.0,"AdminDiscount":0.0,"AdminSurcharge":0.0,"CouponDiscount":0.0}

class LoadCostResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   LoadCostResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  LoadCostResponse.empty();

  LoadCostResponse.fromJson(dynamic json) {
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

/// LoadId : 401
/// Distance : 111.0
/// ShipperCost : 19320.0
/// FinalCost : 20286.0
/// RoundTripCost : 0.0
/// ValueAddedTax : 966.0
/// VATPercentage : 0.05
/// ShipperDiscount : 0.0
/// AdminDiscount : 0.0
/// AdminSurcharge : 0.0
/// CouponDiscount : 0.0

class Result {
  int _loadId;
  double _distance;
  double _shipperCost;
  double _finalCost;
  double _roundTripCost;
  double _valueAddedTax;
  double _vATPercentage;
  double _shipperDiscount;
  double _adminDiscount;
  double _adminSurcharge;
  double _couponDiscount;

  int get loadId => _loadId;
  double get distance => _distance;
  double get shipperCost => _shipperCost;
  double get finalCost => _finalCost;
  double get roundTripCost => _roundTripCost;
  double get valueAddedTax => _valueAddedTax;
  double get vATPercentage => _vATPercentage;
  double get shipperDiscount => _shipperDiscount;
  double get adminDiscount => _adminDiscount;
  double get adminSurcharge => _adminSurcharge;
  double get couponDiscount => _couponDiscount;

  Result({
      int loadId, 
      double distance, 
      double shipperCost, 
      double finalCost, 
      double roundTripCost, 
      double valueAddedTax, 
      double vATPercentage, 
      double shipperDiscount, 
      double adminDiscount, 
      double adminSurcharge, 
      double couponDiscount}){
    _loadId = loadId;
    _distance = distance;
    _shipperCost = shipperCost;
    _finalCost = finalCost;
    _roundTripCost = roundTripCost;
    _valueAddedTax = valueAddedTax;
    _vATPercentage = vATPercentage;
    _shipperDiscount = shipperDiscount;
    _adminDiscount = adminDiscount;
    _adminSurcharge = adminSurcharge;
    _couponDiscount = couponDiscount;
}

  Result.fromJson(dynamic json) {
    _loadId = json["LoadId"];
    _distance = json["Distance"];
    _shipperCost = json["ShipperCost"];
    _finalCost = json["FinalCost"];
    _roundTripCost = json["RoundTripCost"];
    _valueAddedTax = json["ValueAddedTax"];
    _vATPercentage = json["VATPercentage"];
    _shipperDiscount = json["ShipperDiscount"];
    _adminDiscount = json["AdminDiscount"];
    _adminSurcharge = json["AdminSurcharge"];
    _couponDiscount = json["CouponDiscount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadId"] = _loadId;
    map["Distance"] = _distance;
    map["ShipperCost"] = _shipperCost;
    map["FinalCost"] = _finalCost;
    map["RoundTripCost"] = _roundTripCost;
    map["ValueAddedTax"] = _valueAddedTax;
    map["VATPercentage"] = _vATPercentage;
    map["ShipperDiscount"] = _shipperDiscount;
    map["AdminDiscount"] = _adminDiscount;
    map["AdminSurcharge"] = _adminSurcharge;
    map["CouponDiscount"] = _couponDiscount;
    return map;
  }

}