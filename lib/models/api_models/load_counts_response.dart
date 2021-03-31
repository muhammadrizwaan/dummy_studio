/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"Placed":0,"Assigned":0,"AcceptedByTransporter":0,"RejectedByTransporter":0,"AcceptedByShipper":0,"RejectedByShipper":0,"ReadyToLoad":0,"Loading":0,"OnTheWay":0,"Unloading":0,"Delivered":0}

class LoadCountsResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   LoadCountsResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }
  LoadCountsResponse.empty();

  LoadCountsResponse.fromJson(dynamic json) {
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

/// Placed : 0
/// Assigned : 0
/// AcceptedByTransporter : 0
/// RejectedByTransporter : 0
/// AcceptedByShipper : 0
/// RejectedByShipper : 0
/// ReadyToLoad : 0
/// Loading : 0
/// OnTheWay : 0
/// Unloading : 0
/// Delivered : 0

class Result {
  int _placed;
  int _assigned;
  int _acceptedByTransporter;
  int _rejectedByTransporter;
  int _acceptedByShipper;
  int _rejectedByShipper;
  int _readyToLoad;
  int _loading;
  int _onTheWay;
  int _unloading;
  int _delivered;

  int get placed => _placed;
  int get assigned => _assigned;
  int get acceptedByTransporter => _acceptedByTransporter;
  int get rejectedByTransporter => _rejectedByTransporter;
  int get acceptedByShipper => _acceptedByShipper;
  int get rejectedByShipper => _rejectedByShipper;
  int get readyToLoad => _readyToLoad;
  int get loading => _loading;
  int get onTheWay => _onTheWay;
  int get unloading => _unloading;
  int get delivered => _delivered;

  Result({
      int placed, 
      int assigned, 
      int acceptedByTransporter, 
      int rejectedByTransporter, 
      int acceptedByShipper, 
      int rejectedByShipper, 
      int readyToLoad, 
      int loading, 
      int onTheWay, 
      int unloading, 
      int delivered}){
    _placed = placed;
    _assigned = assigned;
    _acceptedByTransporter = acceptedByTransporter;
    _rejectedByTransporter = rejectedByTransporter;
    _acceptedByShipper = acceptedByShipper;
    _rejectedByShipper = rejectedByShipper;
    _readyToLoad = readyToLoad;
    _loading = loading;
    _onTheWay = onTheWay;
    _unloading = unloading;
    _delivered = delivered;
}

  Result.fromJson(dynamic json) {
    _placed = json["Placed"];
    _assigned = json["Assigned"];
    _acceptedByTransporter = json["AcceptedByTransporter"];
    _rejectedByTransporter = json["RejectedByTransporter"];
    _acceptedByShipper = json["AcceptedByShipper"];
    _rejectedByShipper = json["RejectedByShipper"];
    _readyToLoad = json["ReadyToLoad"];
    _loading = json["Loading"];
    _onTheWay = json["OnTheWay"];
    _unloading = json["Unloading"];
    _delivered = json["Delivered"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Placed"] = _placed;
    map["Assigned"] = _assigned;
    map["AcceptedByTransporter"] = _acceptedByTransporter;
    map["RejectedByTransporter"] = _rejectedByTransporter;
    map["AcceptedByShipper"] = _acceptedByShipper;
    map["RejectedByShipper"] = _rejectedByShipper;
    map["ReadyToLoad"] = _readyToLoad;
    map["Loading"] = _loading;
    map["OnTheWay"] = _onTheWay;
    map["Unloading"] = _unloading;
    map["Delivered"] = _delivered;
    return map;
  }

}