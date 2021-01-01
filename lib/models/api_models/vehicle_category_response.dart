/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"VehicleTypeId":1,"VehicleCategoryId":1,"VehicleType":"Pickup","VehicleCategory":"1 Ton Open","VehicleDescription":"Pickup","VehicleCategoryImage":""},{"VehicleTypeId":1,"VehicleCategoryId":2,"VehicleType":"Pickup","VehicleCategory":"3 Ton Open","VehicleDescription":"Pickup","VehicleCategoryImage":""},{"VehicleTypeId":1,"VehicleCategoryId":3,"VehicleType":"Pickup","VehicleCategory":"3 Ton Closed","VehicleDescription":"Pickup","VehicleCategoryImage":""},{"VehicleTypeId":1,"VehicleCategoryId":4,"VehicleType":"Pickup","VehicleCategory":"4.2 Ton Open","VehicleDescription":"Pickup","VehicleCategoryImage":""},{"VehicleTypeId":1,"VehicleCategoryId":5,"VehicleType":"Pickup","VehicleCategory":"4.2 Ton Closed","VehicleDescription":"Pickup","VehicleCategoryImage":""},{"VehicleTypeId":1,"VehicleCategoryId":6,"VehicleType":"Pickup","VehicleCategory":"7 Ton Open","VehicleDescription":"Pickup","VehicleCategoryImage":""},{"VehicleTypeId":1,"VehicleCategoryId":7,"VehicleType":"Pickup","VehicleCategory":"7 Ton Close","VehicleDescription":"Pickup","VehicleCategoryImage":""},{"VehicleTypeId":1,"VehicleCategoryId":8,"VehicleType":"Pickup","VehicleCategory":"7 Ton with Crane","VehicleDescription":"Pickup","VehicleCategoryImage":""},{"VehicleTypeId":1,"VehicleCategoryId":9,"VehicleType":"Pickup","VehicleCategory":"10 Ton with Crane","VehicleDescription":"Pickup","VehicleCategoryImage":""}]

class VehicleCategoryResponse {
  String _message;
  int _code;
  List<Result> _result = List<Result>();

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

 VehicleCategoryResponse.empty();

  VehicleCategoryResponse.fromJson(dynamic json) {
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

/// VehicleTypeId : 1
/// VehicleCategoryId : 1
/// VehicleType : "Pickup"
/// VehicleCategory : "1 Ton Open"
/// VehicleDescription : "Pickup"
/// VehicleCategoryImage : ""

class Result {
  int _vehicleTypeId;
  int _vehicleCategoryId;
  String _vehicleType;
  String _vehicleCategory;
  String _vehicleDescription;
  String _vehicleCategoryImage;

  int get vehicleTypeId => _vehicleTypeId;
  int get vehicleCategoryId => _vehicleCategoryId;
  String get vehicleType => _vehicleType;
  String get vehicleCategory => _vehicleCategory;
  String get vehicleDescription => _vehicleDescription;
  String get vehicleCategoryImage => _vehicleCategoryImage;

  Result({
      int vehicleTypeId, 
      int vehicleCategoryId, 
      String vehicleType, 
      String vehicleCategory, 
      String vehicleDescription, 
      String vehicleCategoryImage}){
    _vehicleTypeId = vehicleTypeId;
    _vehicleCategoryId = vehicleCategoryId;
    _vehicleType = vehicleType;
    _vehicleCategory = vehicleCategory;
    _vehicleDescription = vehicleDescription;
    _vehicleCategoryImage = vehicleCategoryImage;
}

  Result.fromJson(dynamic json) {
    _vehicleTypeId = json["VehicleTypeId"];
    _vehicleCategoryId = json["VehicleCategoryId"];
    _vehicleType = json["VehicleType"];
    _vehicleCategory = json["VehicleCategory"];
    _vehicleDescription = json["VehicleDescription"];
    _vehicleCategoryImage = json["VehicleCategoryImage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["VehicleTypeId"] = _vehicleTypeId;
    map["VehicleCategoryId"] = _vehicleCategoryId;
    map["VehicleType"] = _vehicleType;
    map["VehicleCategory"] = _vehicleCategory;
    map["VehicleDescription"] = _vehicleDescription;
    map["VehicleCategoryImage"] = _vehicleCategoryImage;
    return map;
  }

}