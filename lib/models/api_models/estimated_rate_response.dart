/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"TotalCost":1226.8,"ComissionCost":490.72,"RoundTripCost":204.47}

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

/// TotalCost : 1226.8
/// ComissionCost : 490.72
/// RoundTripCost : 204.47

class Result {
  double _totalCost;
  double _comissionCost;
  double _roundTripCost;

  double get totalCost => _totalCost;
  double get comissionCost => _comissionCost;
  double get roundTripCost => _roundTripCost;

  Result({
      double totalCost, 
      double comissionCost, 
      double roundTripCost}){
    _totalCost = totalCost;
    _comissionCost = comissionCost;
    _roundTripCost = roundTripCost;
}

  Result.fromJson(dynamic json) {
    _totalCost = json["TotalCost"];
    _comissionCost = json["ComissionCost"];
    _roundTripCost = json["RoundTripCost"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["TotalCost"] = _totalCost;
    map["ComissionCost"] = _comissionCost;
    map["RoundTripCost"] = _roundTripCost;
    return map;
  }

}