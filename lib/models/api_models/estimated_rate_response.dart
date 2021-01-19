/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"TotalCost":2826.52,"ComissionCost":1130.61,"RoundTripCost":471.09,"Multiplier":0.015}

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

/// TotalCost : 2826.52
/// ComissionCost : 1130.61
/// RoundTripCost : 471.09
/// Multiplier : 0.015

class Result {
  double _totalCost;
  double _comissionCost;
  double _roundTripCost;
  double _multiplier;

  double get totalCost => _totalCost;
  double get comissionCost => _comissionCost;
  double get roundTripCost => _roundTripCost;
  double get multiplier => _multiplier;

  Result({
      double totalCost, 
      double comissionCost, 
      double roundTripCost, 
      double multiplier}){
    _totalCost = totalCost;
    _comissionCost = comissionCost;
    _roundTripCost = roundTripCost;
    _multiplier = multiplier;
}

  Result.fromJson(dynamic json) {
    _totalCost = json["TotalCost"];
    _comissionCost = json["ComissionCost"];
    _roundTripCost = json["RoundTripCost"];
    _multiplier = json["Multiplier"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["TotalCost"] = _totalCost;
    map["ComissionCost"] = _comissionCost;
    map["RoundTripCost"] = _roundTripCost;
    map["Multiplier"] = _multiplier;
    return map;
  }

}