/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"LoadId":10147,"LoadName":"Sensitive Good","PickupLocation":"Peco Road","DropoffLocation":"Creative Bugs","LoadStatusId":1,"Status":"Placed","VehicleTypeId":3,"VehicleTypeName":"Low Bed","VehicleTypeDescription":"Low Bed","ShipperCost":15032.08,"TransporterCost":0.0,"PickupDateTime":"Oct 10 2020 12:00AM","DropoffDateTime":"","IsActive":true,"CreatedBy":2307,"TransporterName":"","AssignedDriverId":0,"AssignedTransporterId":0,"AssignedVehicleId":0}]

class TabbarResponse {
  String _message;
  int _code;
  List<Result> _result;

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

  TabbarResponse.empty();

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

/// LoadId : 10147
/// LoadName : "Sensitive Good"
/// PickupLocation : "Peco Road"
/// DropoffLocation : "Creative Bugs"
/// LoadStatusId : 1
/// Status : "Placed"
/// VehicleTypeId : 3
/// VehicleTypeName : "Low Bed"
/// VehicleTypeDescription : "Low Bed"
/// ShipperCost : 15032.08
/// TransporterCost : 0.0
/// PickupDateTime : "Oct 10 2020 12:00AM"
/// DropoffDateTime : ""
/// IsActive : true
/// CreatedBy : 2307
/// TransporterName : ""
/// AssignedDriverId : 0
/// AssignedTransporterId : 0
/// AssignedVehicleId : 0

class Result {
  int _loadId;
  String _loadName;
  String _pickupLocation;
  String _dropoffLocation;
  int _loadStatusId;
  String _status;
  int _vehicleTypeId;
  String _vehicleTypeName;
  String _vehicleTypeDescription;
  double _shipperCost;
  double _transporterCost;
  String _pickupDateTime;
  String _dropoffDateTime;
  bool _isActive;
  int _createdBy;
  String _transporterName;
  int _assignedDriverId;
  int _assignedTransporterId;
  int _assignedVehicleId;

  int get loadId => _loadId;
  String get loadName => _loadName;
  String get pickupLocation => _pickupLocation;
  String get dropoffLocation => _dropoffLocation;
  int get loadStatusId => _loadStatusId;
  String get status => _status;
  int get vehicleTypeId => _vehicleTypeId;
  String get vehicleTypeName => _vehicleTypeName;
  String get vehicleTypeDescription => _vehicleTypeDescription;
  double get shipperCost => _shipperCost;
  double get transporterCost => _transporterCost;
  String get pickupDateTime => _pickupDateTime;
  String get dropoffDateTime => _dropoffDateTime;
  bool get isActive => _isActive;
  int get createdBy => _createdBy;
  String get transporterName => _transporterName;
  int get assignedDriverId => _assignedDriverId;
  int get assignedTransporterId => _assignedTransporterId;
  int get assignedVehicleId => _assignedVehicleId;

  Result({
      int loadId, 
      String loadName, 
      String pickupLocation, 
      String dropoffLocation, 
      int loadStatusId, 
      String status, 
      int vehicleTypeId, 
      String vehicleTypeName, 
      String vehicleTypeDescription, 
      double shipperCost, 
      double transporterCost, 
      String pickupDateTime, 
      String dropoffDateTime, 
      bool isActive, 
      int createdBy, 
      String transporterName, 
      int assignedDriverId, 
      int assignedTransporterId, 
      int assignedVehicleId}){
    _loadId = loadId;
    _loadName = loadName;
    _pickupLocation = pickupLocation;
    _dropoffLocation = dropoffLocation;
    _loadStatusId = loadStatusId;
    _status = status;
    _vehicleTypeId = vehicleTypeId;
    _vehicleTypeName = vehicleTypeName;
    _vehicleTypeDescription = vehicleTypeDescription;
    _shipperCost = shipperCost;
    _transporterCost = transporterCost;
    _pickupDateTime = pickupDateTime;
    _dropoffDateTime = dropoffDateTime;
    _isActive = isActive;
    _createdBy = createdBy;
    _transporterName = transporterName;
    _assignedDriverId = assignedDriverId;
    _assignedTransporterId = assignedTransporterId;
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
    _vehicleTypeName = json["VehicleTypeName"];
    _vehicleTypeDescription = json["VehicleTypeDescription"];
    _shipperCost = json["ShipperCost"];
    _transporterCost = json["TransporterCost"];
    _pickupDateTime = json["PickupDateTime"];
    _dropoffDateTime = json["DropoffDateTime"];
    _isActive = json["IsActive"];
    _createdBy = json["CreatedBy"];
    _transporterName = json["TransporterName"];
    _assignedDriverId = json["AssignedDriverId"];
    _assignedTransporterId = json["AssignedTransporterId"];
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
    map["VehicleTypeName"] = _vehicleTypeName;
    map["VehicleTypeDescription"] = _vehicleTypeDescription;
    map["ShipperCost"] = _shipperCost;
    map["TransporterCost"] = _transporterCost;
    map["PickupDateTime"] = _pickupDateTime;
    map["DropoffDateTime"] = _dropoffDateTime;
    map["IsActive"] = _isActive;
    map["CreatedBy"] = _createdBy;
    map["TransporterName"] = _transporterName;
    map["AssignedDriverId"] = _assignedDriverId;
    map["AssignedTransporterId"] = _assignedTransporterId;
    map["AssignedVehicleId"] = _assignedVehicleId;
    return map;
  }

}