/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"LoadId":10014,"LoadName":"Sensitive Good","PickupLocation":"Jail Road","DropoffLocation":"Jinnbyte","LoadStatusId":1,"Status":"Placed","VehicleTypeId":3,"VehicleType":null,"ShipperCost":12251.109999999999,"TransporterCost":null,"DateTime":null,"IsActive":true,"CreatedBy":2059,"TransporterName":null,"AssignedDriverId":0,"AssignedTranporterId":0,"AssignedVehicleId":0},{"LoadId":10015,"LoadName":"Sensitive Good","PickupLocation":"Jail Road","DropoffLocation":"Jinnbyte","LoadStatusId":1,"Status":"Placed","VehicleTypeId":3,"VehicleType":null,"ShipperCost":12251.109999999999,"TransporterCost":null,"DateTime":null,"IsActive":true,"CreatedBy":2059,"TransporterName":null,"AssignedDriverId":0,"AssignedTranporterId":0,"AssignedVehicleId":0},{"LoadId":10016,"LoadName":"Sensitive Good","PickupLocation":"Jail Road","DropoffLocation":"Jinnbyte","LoadStatusId":1,"Status":"Placed","VehicleTypeId":3,"VehicleType":null,"ShipperCost":12251.109999999999,"TransporterCost":null,"DateTime":null,"IsActive":true,"CreatedBy":2059,"TransporterName":null,"AssignedDriverId":0,"AssignedTranporterId":0,"AssignedVehicleId":0}]

class TabbarResponse {
  String _message;
  int _code;
  List<Result> _result;

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

  TabbarResponse.empty();
//   TabbarResponse({
//       String message,
//       int code,
//       List<Result> result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  TabbarResponse.fromJson(dynamic json) {
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

/// LoadId : 10014
/// LoadName : "Sensitive Good"
/// PickupLocation : "Jail Road"
/// DropoffLocation : "Jinnbyte"
/// LoadStatusId : 1
/// Status : "Placed"
/// VehicleTypeId : 3
/// VehicleType : null
/// ShipperCost : 12251.109999999999
/// TransporterCost : null
/// DateTime : null
/// IsActive : true
/// CreatedBy : 2059
/// TransporterName : null
/// AssignedDriverId : 0
/// AssignedTranporterId : 0
/// AssignedVehicleId : 0

class Result {
  int _loadId;
  String _loadName;
  String _pickupLocation;
  String _dropoffLocation;
  int _loadStatusId;
  String _status;
  int _vehicleTypeId;
  dynamic _vehicleType;
  double _shipperCost;
  dynamic _transporterCost;
  dynamic _dateTime;
  bool _isActive;
  int _createdBy;
  dynamic _transporterName;
  int _assignedDriverId;
  int _assignedTranporterId;
  int _assignedVehicleId;

  int get loadId => _loadId;
  String get loadName => _loadName;
  String get pickupLocation => _pickupLocation;
  String get dropoffLocation => _dropoffLocation;
  int get loadStatusId => _loadStatusId;
  String get status => _status;
  int get vehicleTypeId => _vehicleTypeId;
  dynamic get vehicleType => _vehicleType;
  double get shipperCost => _shipperCost;
  dynamic get transporterCost => _transporterCost;
  dynamic get dateTime => _dateTime;
  bool get isActive => _isActive;
  int get createdBy => _createdBy;
  dynamic get transporterName => _transporterName;
  int get assignedDriverId => _assignedDriverId;
  int get assignedTranporterId => _assignedTranporterId;
  int get assignedVehicleId => _assignedVehicleId;

  Result({
      int loadId, 
      String loadName, 
      String pickupLocation, 
      String dropoffLocation, 
      int loadStatusId, 
      String status, 
      int vehicleTypeId, 
      dynamic vehicleType, 
      double shipperCost, 
      dynamic transporterCost, 
      dynamic dateTime, 
      bool isActive, 
      int createdBy, 
      dynamic transporterName, 
      int assignedDriverId, 
      int assignedTranporterId, 
      int assignedVehicleId}){
    _loadId = loadId;
    _loadName = loadName;
    _pickupLocation = pickupLocation;
    _dropoffLocation = dropoffLocation;
    _loadStatusId = loadStatusId;
    _status = status;
    _vehicleTypeId = vehicleTypeId;
    _vehicleType = vehicleType;
    _shipperCost = shipperCost;
    _transporterCost = transporterCost;
    _dateTime = dateTime;
    _isActive = isActive;
    _createdBy = createdBy;
    _transporterName = transporterName;
    _assignedDriverId = assignedDriverId;
    _assignedTranporterId = assignedTranporterId;
    _assignedVehicleId = assignedVehicleId;
}

  Result.fromJson(dynamic json) {
    _loadId = json["LoadId"];
    _loadName = json["LoadName"];
    _pickupLocation = json["PickupLocation"];
    _dropoffLocation = json["DropoffLocation"];
    _loadStatusId = json["LoadStatusId"];
    _status = json["Status"];
    _vehicleTypeId = json["VehicleTypeId"];
    _vehicleType = json["VehicleType"];
    _shipperCost = json["ShipperCost"];
    _transporterCost = json["TransporterCost"];
    _dateTime = json["DateTime"];
    _isActive = json["IsActive"];
    _createdBy = json["CreatedBy"];
    _transporterName = json["TransporterName"];
    _assignedDriverId = json["AssignedDriverId"];
    _assignedTranporterId = json["AssignedTranporterId"];
    _assignedVehicleId = json["AssignedVehicleId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadId"] = _loadId;
    map["LoadName"] = _loadName;
    map["PickupLocation"] = _pickupLocation;
    map["DropoffLocation"] = _dropoffLocation;
    map["LoadStatusId"] = _loadStatusId;
    map["Status"] = _status;
    map["VehicleTypeId"] = _vehicleTypeId;
    map["VehicleType"] = _vehicleType;
    map["ShipperCost"] = _shipperCost;
    map["TransporterCost"] = _transporterCost;
    map["DateTime"] = _dateTime;
    map["IsActive"] = _isActive;
    map["CreatedBy"] = _createdBy;
    map["TransporterName"] = _transporterName;
    map["AssignedDriverId"] = _assignedDriverId;
    map["AssignedTranporterId"] = _assignedTranporterId;
    map["AssignedVehicleId"] = _assignedVehicleId;
    return map;
  }

}