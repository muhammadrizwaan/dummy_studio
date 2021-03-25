/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"LoadCarrierId":385,"LoadId":500,"AssignedDriverId":368,"DriverName":"Driver T","AssignedVehicleId":206,"VehicleName":"Toyota 222","Status":"Ready To Load"},{"LoadCarrierId":386,"LoadId":500,"AssignedDriverId":375,"DriverName":"Driver S","AssignedVehicleId":227,"VehicleName":"Zami 222","Status":"Ready To Load"}]

class DriversResponse {
  String _message;
  int _code;
  List<Result> _result;

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

//   DriversResponse({
//       String message,
//       int code,
//       List<Result> result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  DriversResponse.empty();

  DriversResponse.fromJson(dynamic json) {
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

/// LoadCarrierId : 385
/// LoadId : 500
/// AssignedDriverId : 368
/// DriverName : "Driver T"
/// AssignedVehicleId : 206
/// VehicleName : "Toyota 222"
/// Status : "Ready To Load"

class Result {
  int _loadCarrierId;
  int _loadId;
  int _assignedDriverId;
  String _driverName;
  int _assignedVehicleId;
  String _vehicleName;
  String _status;

  int get loadCarrierId => _loadCarrierId;
  int get loadId => _loadId;
  int get assignedDriverId => _assignedDriverId;
  String get driverName => _driverName;
  int get assignedVehicleId => _assignedVehicleId;
  String get vehicleName => _vehicleName;
  String get status => _status;

  Result({
      int loadCarrierId, 
      int loadId, 
      int assignedDriverId, 
      String driverName, 
      int assignedVehicleId, 
      String vehicleName, 
      String status}){
    _loadCarrierId = loadCarrierId;
    _loadId = loadId;
    _assignedDriverId = assignedDriverId;
    _driverName = driverName;
    _assignedVehicleId = assignedVehicleId;
    _vehicleName = vehicleName;
    _status = status;
}

  Result.fromJson(dynamic json) {
    _loadCarrierId = json["LoadCarrierId"];
    _loadId = json["LoadId"];
    _assignedDriverId = json["AssignedDriverId"];
    _driverName = json["DriverName"];
    _assignedVehicleId = json["AssignedVehicleId"];
    _vehicleName = json["VehicleName"];
    _status = json["Status"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadCarrierId"] = _loadCarrierId;
    map["LoadId"] = _loadId;
    map["AssignedDriverId"] = _assignedDriverId;
    map["DriverName"] = _driverName;
    map["AssignedVehicleId"] = _assignedVehicleId;
    map["VehicleName"] = _vehicleName;
    map["Status"] = _status;
    return map;
  }

}