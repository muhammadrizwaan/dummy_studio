/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"VehicleId":1022,"VehicleTypeId":2,"VehicleCategoryId":12,"VehicleName":"Honda","VehicleType":"Refers","VehicleCategory":"10 Ton","VehicleDescription":"Refers","VehicleImage":""},{"VehicleId":1025,"VehicleTypeId":2,"VehicleCategoryId":10,"VehicleName":"Abd Vehicle ","VehicleType":"Refers","VehicleCategory":"4.2 Ton","VehicleDescription":"Refers","VehicleImage":"/Files/VehiclePhoto/20204808_1148474847_download (1).jpg"},{"VehicleId":1030,"VehicleTypeId":2,"VehicleCategoryId":13,"VehicleName":"VNameC","VehicleType":"Refers","VehicleCategory":"12 M","VehicleDescription":"Refers","VehicleImage":"/Files/VehiclePhoto/20205814_1158235823_IMG-20201208-WA0063.jpg"},{"VehicleId":1031,"VehicleTypeId":2,"VehicleCategoryId":10,"VehicleName":"KIA","VehicleType":"Refers","VehicleCategory":"4.2 Ton","VehicleDescription":"Refers","VehicleImage":"/Files/VehiclePhoto/20205714_1257415741_H6qMzu9u384.jpg"},{"VehicleId":1032,"VehicleTypeId":2,"VehicleCategoryId":10,"VehicleName":"VNFDD","VehicleType":"Refers","VehicleCategory":"4.2 Ton","VehicleDescription":"Refers","VehicleImage":""}]

class VehicleByVehicleIdResponse {
  String _message;
  int _code;
  List<Result> _result;

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

  VehicleByVehicleIdResponse.empty();

  VehicleByVehicleIdResponse.fromJson(dynamic json) {
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

/// VehicleId : 1022
/// VehicleTypeId : 2
/// VehicleCategoryId : 12
/// VehicleName : "Honda"
/// VehicleType : "Refers"
/// VehicleCategory : "10 Ton"
/// VehicleDescription : "Refers"
/// VehicleImage : ""

class Result {
  int _vehicleId;
  int _vehicleTypeId;
  int _vehicleCategoryId;
  String _vehicleName;
  String _vehicleType;
  String _vehicleCategory;
  String _vehicleDescription;
  String _vehicleImage;

  int get vehicleId => _vehicleId;
  int get vehicleTypeId => _vehicleTypeId;
  int get vehicleCategoryId => _vehicleCategoryId;
  String get vehicleName => _vehicleName;
  String get vehicleType => _vehicleType;
  String get vehicleCategory => _vehicleCategory;
  String get vehicleDescription => _vehicleDescription;
  String get vehicleImage => _vehicleImage;

  Result({
      int vehicleId, 
      int vehicleTypeId, 
      int vehicleCategoryId, 
      String vehicleName, 
      String vehicleType, 
      String vehicleCategory, 
      String vehicleDescription, 
      String vehicleImage}){
    _vehicleId = vehicleId;
    _vehicleTypeId = vehicleTypeId;
    _vehicleCategoryId = vehicleCategoryId;
    _vehicleName = vehicleName;
    _vehicleType = vehicleType;
    _vehicleCategory = vehicleCategory;
    _vehicleDescription = vehicleDescription;
    _vehicleImage = vehicleImage;
}

  Result.fromJson(dynamic json) {
    _vehicleId = json["VehicleId"];
    _vehicleTypeId = json["VehicleTypeId"];
    _vehicleCategoryId = json["VehicleCategoryId"];
    _vehicleName = json["VehicleName"];
    _vehicleType = json["VehicleType"];
    _vehicleCategory = json["VehicleCategory"];
    _vehicleDescription = json["VehicleDescription"];
    _vehicleImage = json["VehicleImage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["VehicleId"] = _vehicleId;
    map["VehicleTypeId"] = _vehicleTypeId;
    map["VehicleCategoryId"] = _vehicleCategoryId;
    map["VehicleName"] = _vehicleName;
    map["VehicleType"] = _vehicleType;
    map["VehicleCategory"] = _vehicleCategory;
    map["VehicleDescription"] = _vehicleDescription;
    map["VehicleImage"] = _vehicleImage;
    return map;
  }

}