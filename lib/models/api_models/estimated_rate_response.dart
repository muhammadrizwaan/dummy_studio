/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"LoadCostId":0,"LoadId":0,"BasePrice":827.0,"RatePerKm":20.0,"RoundTripMultiplier":1.5,"RoundTripCost":2633.5,"CouponId":0,"CouponDiscount":0.0,"ShipperIndividualDiscount":0.0,"ShipperCost":15801.0,"VatAmount":2528.16,"FinalCost":18329.16,"CommissionMultiplier":0.4,"CommissionCost":6320.4000000000005,"TransporterCost":0.0}

class EstimatedRateResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   EstimatedRateResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }
  EstimatedRateResponse.empty();

  EstimatedRateResponse.fromJson(dynamic json) {
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

/// LoadCostId : 0
/// LoadId : 0
/// BasePrice : 827.0
/// RatePerKm : 20.0
/// RoundTripMultiplier : 1.5
/// RoundTripCost : 2633.5
/// CouponId : 0
/// CouponDiscount : 0.0
/// ShipperIndividualDiscount : 0.0
/// ShipperCost : 15801.0
/// VatAmount : 2528.16
/// FinalCost : 18329.16
/// CommissionMultiplier : 0.4
/// CommissionCost : 6320.4000000000005
/// TransporterCost : 0.0

class Result {
  int _loadCostId;
  int _loadId;
  double _basePrice;
  double _ratePerKm;
  double _roundTripMultiplier;
  double _roundTripCost;
  int _couponId;
  double _couponDiscount;
  double _shipperIndividualDiscount;
  double _shipperCost;
  double _vatAmount;
  double _finalCost;
  double _commissionMultiplier;
  double _commissionCost;
  double _transporterCost;

  int get loadCostId => _loadCostId;
  int get loadId => _loadId;
  double get basePrice => _basePrice;
  double get ratePerKm => _ratePerKm;
  double get roundTripMultiplier => _roundTripMultiplier;
  double get roundTripCost => _roundTripCost;
  int get couponId => _couponId;
  double get couponDiscount => _couponDiscount;
  double get shipperIndividualDiscount => _shipperIndividualDiscount;
  double get shipperCost => _shipperCost;
  double get vatAmount => _vatAmount;
  double get finalCost => _finalCost;
  double get commissionMultiplier => _commissionMultiplier;
  double get commissionCost => _commissionCost;
  double get transporterCost => _transporterCost;

  Result({
      int loadCostId, 
      int loadId, 
      double basePrice, 
      double ratePerKm, 
      double roundTripMultiplier, 
      double roundTripCost, 
      int couponId, 
      double couponDiscount, 
      double shipperIndividualDiscount, 
      double shipperCost, 
      double vatAmount, 
      double finalCost, 
      double commissionMultiplier, 
      double commissionCost, 
      double transporterCost}){
    _loadCostId = loadCostId;
    _loadId = loadId;
    _basePrice = basePrice;
    _ratePerKm = ratePerKm;
    _roundTripMultiplier = roundTripMultiplier;
    _roundTripCost = roundTripCost;
    _couponId = couponId;
    _couponDiscount = couponDiscount;
    _shipperIndividualDiscount = shipperIndividualDiscount;
    _shipperCost = shipperCost;
    _vatAmount = vatAmount;
    _finalCost = finalCost;
    _commissionMultiplier = commissionMultiplier;
    _commissionCost = commissionCost;
    _transporterCost = transporterCost;
}

  Result.fromJson(dynamic json) {
    _loadCostId = json["LoadCostId"];
    _loadId = json["LoadId"];
    _basePrice = json["BasePrice"];
    _ratePerKm = json["RatePerKm"];
    _roundTripMultiplier = json["RoundTripMultiplier"];
    _roundTripCost = json["RoundTripCost"];
    _couponId = json["CouponId"];
    _couponDiscount = json["CouponDiscount"];
    _shipperIndividualDiscount = json["ShipperIndividualDiscount"];
    _shipperCost = json["ShipperCost"];
    _vatAmount = json["VatAmount"];
    _finalCost = json["FinalCost"];
    _commissionMultiplier = json["CommissionMultiplier"];
    _commissionCost = json["CommissionCost"];
    _transporterCost = json["TransporterCost"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadCostId"] = _loadCostId;
    map["LoadId"] = _loadId;
    map["BasePrice"] = _basePrice;
    map["RatePerKm"] = _ratePerKm;
    map["RoundTripMultiplier"] = _roundTripMultiplier;
    map["RoundTripCost"] = _roundTripCost;
    map["CouponId"] = _couponId;
    map["CouponDiscount"] = _couponDiscount;
    map["ShipperIndividualDiscount"] = _shipperIndividualDiscount;
    map["ShipperCost"] = _shipperCost;
    map["VatAmount"] = _vatAmount;
    map["FinalCost"] = _finalCost;
    map["CommissionMultiplier"] = _commissionMultiplier;
    map["CommissionCost"] = _commissionCost;
    map["TransporterCost"] = _transporterCost;
    return map;
  }

}