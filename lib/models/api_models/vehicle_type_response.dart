/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"VehicleTypeId":1,"Name":"Pickup","Description":"Pickup","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":2,"Name":"Refers","Description":"Refers","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":3,"Name":"Low Bed","Description":"Low Bed","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":4,"Name":"Tipper","Description":"Tipper","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":5,"Name":"Cutrain Side","Description":"Cutrain Side","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":6,"Name":"Boxed Trucks","Description":"Boxed Trucks","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":7,"Name":"Pickups w/ Crane","Description":"Pickups w/ Crane","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":8,"Name":"Container","Description":"Container","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":9,"Name":"Container w/ Crane","Description":"Container w/ Crane","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":10,"Name":"Flat Bed","Description":"Flat Bed","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":11,"Name":"Recovery","Description":"Recovery","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":12,"Name":"Trunker","Description":"Trunker","IsActive":true,"CreatedOn":"2020-10-17T00:00:00","CreatedBy":1,"UpdatedOn":"2020-10-17T00:00:00","UpdatedBy":1},{"VehicleTypeId":14,"Name":"Abd vehicle  type","Description":"test","IsActive":true,"CreatedOn":"2020-12-08T05:37:28.497","CreatedBy":2043,"UpdatedOn":"2020-12-08T05:37:52.777","UpdatedBy":2043}]

class VehicleTypeResponse {
  String _message;
  int _code;
  List<Result> _result = List<Result>();

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

//   VehicleTypeResponse({
//       String message,
//       int code,
//       List<Result> result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  VehicleTypeResponse.empty();

  VehicleTypeResponse.fromJson(dynamic json) {
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
/// Name : "Pickup"
/// Description : "Pickup"
/// IsActive : true
/// CreatedOn : "2020-10-17T00:00:00"
/// CreatedBy : 1
/// UpdatedOn : "2020-10-17T00:00:00"
/// UpdatedBy : 1

class Result {
  int _vehicleTypeId;
  String _name;
  String _description;
  bool _isActive;
  String _createdOn;
  int _createdBy;
  String _updatedOn;
  int _updatedBy;

  int get vehicleTypeId => _vehicleTypeId;
  String get name => _name;
  String get description => _description;
  bool get isActive => _isActive;
  String get createdOn => _createdOn;
  int get createdBy => _createdBy;
  String get updatedOn => _updatedOn;
  int get updatedBy => _updatedBy;

  Result({
      int vehicleTypeId, 
      String name, 
      String description, 
      bool isActive, 
      String createdOn, 
      int createdBy, 
      String updatedOn, 
      int updatedBy}){
    _vehicleTypeId = vehicleTypeId;
    _name = name;
    _description = description;
    _isActive = isActive;
    _createdOn = createdOn;
    _createdBy = createdBy;
    _updatedOn = updatedOn;
    _updatedBy = updatedBy;
}

  Result.fromJson(dynamic json) {
    _vehicleTypeId = json["VehicleTypeId"];
    _name = json["Name"];
    _description = json["Description"];
    _isActive = json["IsActive"];
    _createdOn = json["CreatedOn"];
    _createdBy = json["CreatedBy"];
    _updatedOn = json["UpdatedOn"];
    _updatedBy = json["UpdatedBy"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["VehicleTypeId"] = _vehicleTypeId;
    map["Name"] = _name;
    map["Description"] = _description;
    map["IsActive"] = _isActive;
    map["CreatedOn"] = _createdOn;
    map["CreatedBy"] = _createdBy;
    map["UpdatedOn"] = _updatedOn;
    map["UpdatedBy"] = _updatedBy;
    return map;
  }

}