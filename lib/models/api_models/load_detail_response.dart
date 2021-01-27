/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"LoadId":10232,"LoadName":"test test","FullName":"Driver","Email":"","Phone":"034512348","Description":"test test","PickupLocation":"Ghantoot test tent - Abu Dhabi - United Arab Emirates","PickupLatitude":24.8953798,"PickupLongitude":54.9330699,"DropoffLocation":"Ghantoot test tent - Abu Dhabi - United Arab Emirates","DropoffLatitude":24.8953798,"DropoffLongitude":54.9330699,"LoadStatusId":11,"Status":"Delivered","VehicleCategoryId":19,"Vehicle":"80 Ton","ShipperCost":55.2,"TransporterCost":82.8,"NoOfVehicles":1,"ReceiverName":"abdullah new reciver","ReceiverPhone":"+676 78 767 8767","GoodTypeId":8,"GoodType":"every thing is goood","PickupDateTime":"Jan  5 2021 12:00AM","IsRoundTrip":false,"IsActive":true,"CreatedBy":2043,"AssignedDriverId":2420,"AssignedTransporterId":2396,"AssignedVehicleId":1067,"LoadFiles":[{"LoadFilesId":2056,"LoadId":10232,"FilePath":"http://truckoom.jinnbytedev.com/Files/Loads/people-fake-260nw-514550071.jpg"},{"LoadFilesId":2057,"LoadId":10232,"FilePath":"http://truckoom.jinnbytedev.com/Files/Loads/unnamed.png"}]}

class LoadDetailResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   LoadDetailResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }
  LoadDetailResponse.empty();

  LoadDetailResponse.fromJson(dynamic json) {
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

/// LoadId : 10232
/// LoadName : "test test"
/// FullName : "Driver"
/// Email : ""
/// Phone : "034512348"
/// Description : "test test"
/// PickupLocation : "Ghantoot test tent - Abu Dhabi - United Arab Emirates"
/// PickupLatitude : 24.8953798
/// PickupLongitude : 54.9330699
/// DropoffLocation : "Ghantoot test tent - Abu Dhabi - United Arab Emirates"
/// DropoffLatitude : 24.8953798
/// DropoffLongitude : 54.9330699
/// LoadStatusId : 11
/// Status : "Delivered"
/// VehicleCategoryId : 19
/// Vehicle : "80 Ton"
/// ShipperCost : 55.2
/// TransporterCost : 82.8
/// NoOfVehicles : 1
/// ReceiverName : "abdullah new reciver"
/// ReceiverPhone : "+676 78 767 8767"
/// GoodTypeId : 8
/// GoodType : "every thing is goood"
/// PickupDateTime : "Jan  5 2021 12:00AM"
/// IsRoundTrip : false
/// IsActive : true
/// CreatedBy : 2043
/// AssignedDriverId : 2420
/// AssignedTransporterId : 2396
/// AssignedVehicleId : 1067
/// LoadFiles : [{"LoadFilesId":2056,"LoadId":10232,"FilePath":"http://truckoom.jinnbytedev.com/Files/Loads/people-fake-260nw-514550071.jpg"},{"LoadFilesId":2057,"LoadId":10232,"FilePath":"http://truckoom.jinnbytedev.com/Files/Loads/unnamed.png"}]

class Result {
  int _loadId;
  String _loadName;
  String _fullName;
  String _email;
  String _phone;
  String _description;
  String _pickupLocation;
  double _pickupLatitude;
  double _pickupLongitude;
  String _dropoffLocation;
  double _dropoffLatitude;
  double _dropoffLongitude;
  int _loadStatusId;
  String _status;
  int _vehicleCategoryId;
  String _vehicle;
  double _shipperCost;
  double _transporterCost;
  int _noOfVehicles;
  String _receiverName;
  String _receiverPhone;
  int _goodTypeId;
  String _goodType;
  String _pickupDateTime;
  bool _isRoundTrip;
  bool _isActive;
  int _createdBy;
  int _assignedDriverId;
  int _assignedTransporterId;
  int _assignedVehicleId;
  List<LoadFiles> _loadFiles;

  int get loadId => _loadId;
  String get loadName => _loadName;
  String get fullName => _fullName;
  String get email => _email;
  String get phone => _phone;
  String get description => _description;
  String get pickupLocation => _pickupLocation;
  double get pickupLatitude => _pickupLatitude;
  double get pickupLongitude => _pickupLongitude;
  String get dropoffLocation => _dropoffLocation;
  double get dropoffLatitude => _dropoffLatitude;
  double get dropoffLongitude => _dropoffLongitude;
  int get loadStatusId => _loadStatusId;
  String get status => _status;
  int get vehicleCategoryId => _vehicleCategoryId;
  String get vehicle => _vehicle;
  double get shipperCost => _shipperCost;
  double get transporterCost => _transporterCost;
  int get noOfVehicles => _noOfVehicles;
  String get receiverName => _receiverName;
  String get receiverPhone => _receiverPhone;
  int get goodTypeId => _goodTypeId;
  String get goodType => _goodType;
  String get pickupDateTime => _pickupDateTime;
  bool get isRoundTrip => _isRoundTrip;
  bool get isActive => _isActive;
  int get createdBy => _createdBy;
  int get assignedDriverId => _assignedDriverId;
  int get assignedTransporterId => _assignedTransporterId;
  int get assignedVehicleId => _assignedVehicleId;
  List<LoadFiles> get loadFiles => _loadFiles;

  Result({
      int loadId, 
      String loadName, 
      String fullName, 
      String email, 
      String phone, 
      String description, 
      String pickupLocation, 
      double pickupLatitude, 
      double pickupLongitude, 
      String dropoffLocation, 
      double dropoffLatitude, 
      double dropoffLongitude, 
      int loadStatusId, 
      String status, 
      int vehicleCategoryId, 
      String vehicle, 
      double shipperCost, 
      double transporterCost, 
      int noOfVehicles, 
      String receiverName, 
      String receiverPhone, 
      int goodTypeId, 
      String goodType, 
      String pickupDateTime, 
      bool isRoundTrip, 
      bool isActive, 
      int createdBy, 
      int assignedDriverId, 
      int assignedTransporterId, 
      int assignedVehicleId, 
      List<LoadFiles> loadFiles}){
    _loadId = loadId;
    _loadName = loadName;
    _fullName = fullName;
    _email = email;
    _phone = phone;
    _description = description;
    _pickupLocation = pickupLocation;
    _pickupLatitude = pickupLatitude;
    _pickupLongitude = pickupLongitude;
    _dropoffLocation = dropoffLocation;
    _dropoffLatitude = dropoffLatitude;
    _dropoffLongitude = dropoffLongitude;
    _loadStatusId = loadStatusId;
    _status = status;
    _vehicleCategoryId = vehicleCategoryId;
    _vehicle = vehicle;
    _shipperCost = shipperCost;
    _transporterCost = transporterCost;
    _noOfVehicles = noOfVehicles;
    _receiverName = receiverName;
    _receiverPhone = receiverPhone;
    _goodTypeId = goodTypeId;
    _goodType = goodType;
    _pickupDateTime = pickupDateTime;
    _isRoundTrip = isRoundTrip;
    _isActive = isActive;
    _createdBy = createdBy;
    _assignedDriverId = assignedDriverId;
    _assignedTransporterId = assignedTransporterId;
    _assignedVehicleId = assignedVehicleId;
    _loadFiles = loadFiles;
}

  Result.fromJson(dynamic json) {
    _loadId = json["LoadId"];
    _loadName = json["LoadName"];
    _fullName = json["FullName"];
    _email = json["Email"];
    _phone = json["Phone"];
    _description = json["Description"];
    _pickupLocation = json["PickupLocation"];
    _pickupLatitude = json["PickupLatitude"];
    _pickupLongitude = json["PickupLongitude"];
    _dropoffLocation = json["DropoffLocation"];
    _dropoffLatitude = json["DropoffLatitude"];
    _dropoffLongitude = json["DropoffLongitude"];
    _loadStatusId = json["LoadStatusId"];
    _status = json["Status"];
    _vehicleCategoryId = json["VehicleCategoryId"];
    _vehicle = json["Vehicle"];
    _shipperCost = json["ShipperCost"];
    _transporterCost = json["TransporterCost"];
    _noOfVehicles = json["NoOfVehicles"];
    _receiverName = json["ReceiverName"];
    _receiverPhone = json["ReceiverPhone"];
    _goodTypeId = json["GoodTypeId"];
    _goodType = json["GoodType"];
    _pickupDateTime = json["PickupDateTime"];
    _isRoundTrip = json["IsRoundTrip"];
    _isActive = json["IsActive"];
    _createdBy = json["CreatedBy"];
    _assignedDriverId = json["AssignedDriverId"];
    _assignedTransporterId = json["AssignedTransporterId"];
    _assignedVehicleId = json["AssignedVehicleId"];
    if (json["LoadFiles"] != null) {
      _loadFiles = [];
      json["LoadFiles"].forEach((v) {
        _loadFiles.add(LoadFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadId"] = _loadId;
    map["LoadName"] = _loadName;
    map["FullName"] = _fullName;
    map["Email"] = _email;
    map["Phone"] = _phone;
    map["Description"] = _description;
    map["PickupLocation"] = _pickupLocation;
    map["PickupLatitude"] = _pickupLatitude;
    map["PickupLongitude"] = _pickupLongitude;
    map["DropoffLocation"] = _dropoffLocation;
    map["DropoffLatitude"] = _dropoffLatitude;
    map["DropoffLongitude"] = _dropoffLongitude;
    map["LoadStatusId"] = _loadStatusId;
    map["Status"] = _status;
    map["VehicleCategoryId"] = _vehicleCategoryId;
    map["Vehicle"] = _vehicle;
    map["ShipperCost"] = _shipperCost;
    map["TransporterCost"] = _transporterCost;
    map["NoOfVehicles"] = _noOfVehicles;
    map["ReceiverName"] = _receiverName;
    map["ReceiverPhone"] = _receiverPhone;
    map["GoodTypeId"] = _goodTypeId;
    map["GoodType"] = _goodType;
    map["PickupDateTime"] = _pickupDateTime;
    map["IsRoundTrip"] = _isRoundTrip;
    map["IsActive"] = _isActive;
    map["CreatedBy"] = _createdBy;
    map["AssignedDriverId"] = _assignedDriverId;
    map["AssignedTransporterId"] = _assignedTransporterId;
    map["AssignedVehicleId"] = _assignedVehicleId;
    if (_loadFiles != null) {
      map["LoadFiles"] = _loadFiles.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// LoadFilesId : 2056
/// LoadId : 10232
/// FilePath : "http://truckoom.jinnbytedev.com/Files/Loads/people-fake-260nw-514550071.jpg"

class LoadFiles {
  int _loadFilesId;
  int _loadId;
  String _filePath;

  int get loadFilesId => _loadFilesId;
  int get loadId => _loadId;
  String get filePath => _filePath;

  LoadFiles({
      int loadFilesId, 
      int loadId, 
      String filePath}){
    _loadFilesId = loadFilesId;
    _loadId = loadId;
    _filePath = filePath;
}

  LoadFiles.fromJson(dynamic json) {
    _loadFilesId = json["LoadFilesId"];
    _loadId = json["LoadId"];
    _filePath = json["FilePath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadFilesId"] = _loadFilesId;
    map["LoadId"] = _loadId;
    map["FilePath"] = _filePath;
    return map;
  }

}