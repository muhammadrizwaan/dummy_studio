/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"LoadId":367,"LoadName":"Sensitive Good","FullName":"Transporter 1","Email":"t1@gmail.com","ShipperName":"Test Busi","ShipperPhone":"+971501211122","Phone":"+156455617389","Description":"Sensitive Good","PickupLocation":"Peco Road","PickupLatitude":31.5387449,"PickupLongitude":74.3336802,"DropoffLocation":"Creative Bugs","DropoffLatitude":31.4646271,"DropoffLongitude":74.3873937,"Weight":"45 Ton","LoadStatusId":9,"Status":"On The Way","VehicleCategoryId":18,"Vehicle":"Vehicle Category desc","ShipperCost":19320.0,"FinalCost":20286.0,"CostForTransporter":11592.0,"TransporterCost":11592.0,"NoOfVehicles":20,"ReceiverName":"Hamza","ReceiverPhone":"3000209","GoodTypeId":7,"GoodType":"Goodtype 1","PickupDateTime":"2021-10-10T00:00:00","IsRoundTrip":false,"IsActive":true,"CreatedBy":264,"AssignedDriverId":275,"AssignedTransporterId":274,"AssignedVehicleId":161,"LoadFiles":[{"LoadFilesId":546,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743503294_compressed7957011039678123676.jpg"},{"LoadFilesId":547,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743504237_compressed8022946655132812854.jpg"},{"LoadFilesId":548,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743505066_compressed6804676868126639435.jpg"},{"LoadFilesId":549,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743505213_compressed6933295527716329925.jpg"},{"LoadFilesId":550,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743506000_compressed1258743138483981893.jpg"}],"ESignaturePath":"","LoadCarriers":[{"LoadCarrierId":271,"LoadId":367,"AssignedDriver":"Driver T1","AssignedDriverId":275,"AssignedVehicle":"t1 Vehicle","AssignedVehicleId":161,"VehiclePlateNo":"214214214","LoadStatus":"Unloading","Longitude":74.3895553,"Latitude":31.4646349}]}

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

/// LoadId : 367
/// LoadName : "Sensitive Good"
/// FullName : "Transporter 1"
/// Email : "t1@gmail.com"
/// ShipperName : "Test Busi"
/// ShipperPhone : "+971501211122"
/// Phone : "+156455617389"
/// Description : "Sensitive Good"
/// PickupLocation : "Peco Road"
/// PickupLatitude : 31.5387449
/// PickupLongitude : 74.3336802
/// DropoffLocation : "Creative Bugs"
/// DropoffLatitude : 31.4646271
/// DropoffLongitude : 74.3873937
/// Weight : "45 Ton"
/// LoadStatusId : 9
/// Status : "On The Way"
/// VehicleCategoryId : 18
/// Vehicle : "Vehicle Category desc"
/// ShipperCost : 19320.0
/// FinalCost : 20286.0
/// CostForTransporter : 11592.0
/// TransporterCost : 11592.0
/// NoOfVehicles : 20
/// ReceiverName : "Hamza"
/// ReceiverPhone : "3000209"
/// GoodTypeId : 7
/// GoodType : "Goodtype 1"
/// PickupDateTime : "2021-10-10T00:00:00"
/// IsRoundTrip : false
/// IsActive : true
/// CreatedBy : 264
/// AssignedDriverId : 275
/// AssignedTransporterId : 274
/// AssignedVehicleId : 161
/// LoadFiles : [{"LoadFilesId":546,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743503294_compressed7957011039678123676.jpg"},{"LoadFilesId":547,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743504237_compressed8022946655132812854.jpg"},{"LoadFilesId":548,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743505066_compressed6804676868126639435.jpg"},{"LoadFilesId":549,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743505213_compressed6933295527716329925.jpg"},{"LoadFilesId":550,"LoadId":367,"FilePath":"http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743506000_compressed1258743138483981893.jpg"}]
/// ESignaturePath : ""
/// LoadCarriers : [{"LoadCarrierId":271,"LoadId":367,"AssignedDriver":"Driver T1","AssignedDriverId":275,"AssignedVehicle":"t1 Vehicle","AssignedVehicleId":161,"VehiclePlateNo":"214214214","LoadStatus":"Unloading","Longitude":74.3895553,"Latitude":31.4646349}]

class Result {
  int _loadId;
  String _loadName;
  String _fullName;
  String _email;
  String _shipperName;
  String _shipperPhone;
  String _phone;
  String _description;
  String _pickupLocation;
  double _pickupLatitude;
  double _pickupLongitude;
  String _dropoffLocation;
  double _dropoffLatitude;
  double _dropoffLongitude;
  String _weight;
  int _loadStatusId;
  String _status;
  int _vehicleCategoryId;
  String _vehicle;
  double _shipperCost;
  double _finalCost;
  double _costForTransporter;
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
  String _eSignaturePath;
  List<LoadCarriers> _loadCarriers;

  int get loadId => _loadId;
  String get loadName => _loadName;
  String get fullName => _fullName;
  String get email => _email;
  String get shipperName => _shipperName;
  String get shipperPhone => _shipperPhone;
  String get phone => _phone;
  String get description => _description;
  String get pickupLocation => _pickupLocation;
  double get pickupLatitude => _pickupLatitude;
  double get pickupLongitude => _pickupLongitude;
  String get dropoffLocation => _dropoffLocation;
  double get dropoffLatitude => _dropoffLatitude;
  double get dropoffLongitude => _dropoffLongitude;
  String get weight => _weight;
  int get loadStatusId => _loadStatusId;
  String get status => _status;
  int get vehicleCategoryId => _vehicleCategoryId;
  String get vehicle => _vehicle;
  double get shipperCost => _shipperCost;
  double get finalCost => _finalCost;
  double get costForTransporter => _costForTransporter;
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
  String get eSignaturePath => _eSignaturePath;
  List<LoadCarriers> get loadCarriers => _loadCarriers;

  Result({
      int loadId, 
      String loadName, 
      String fullName, 
      String email, 
      String shipperName, 
      String shipperPhone, 
      String phone, 
      String description, 
      String pickupLocation, 
      double pickupLatitude, 
      double pickupLongitude, 
      String dropoffLocation, 
      double dropoffLatitude, 
      double dropoffLongitude, 
      String weight, 
      int loadStatusId, 
      String status, 
      int vehicleCategoryId, 
      String vehicle, 
      double shipperCost, 
      double finalCost, 
      double costForTransporter, 
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
      List<LoadFiles> loadFiles, 
      String eSignaturePath, 
      List<LoadCarriers> loadCarriers}){
    _loadId = loadId;
    _loadName = loadName;
    _fullName = fullName;
    _email = email;
    _shipperName = shipperName;
    _shipperPhone = shipperPhone;
    _phone = phone;
    _description = description;
    _pickupLocation = pickupLocation;
    _pickupLatitude = pickupLatitude;
    _pickupLongitude = pickupLongitude;
    _dropoffLocation = dropoffLocation;
    _dropoffLatitude = dropoffLatitude;
    _dropoffLongitude = dropoffLongitude;
    _weight = weight;
    _loadStatusId = loadStatusId;
    _status = status;
    _vehicleCategoryId = vehicleCategoryId;
    _vehicle = vehicle;
    _shipperCost = shipperCost;
    _finalCost = finalCost;
    _costForTransporter = costForTransporter;
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
    _eSignaturePath = eSignaturePath;
    _loadCarriers = loadCarriers;
}

  Result.fromJson(dynamic json) {
    _loadId = json["LoadId"];
    _loadName = json["LoadName"];
    _fullName = json["FullName"];
    _email = json["Email"];
    _shipperName = json["ShipperName"];
    _shipperPhone = json["ShipperPhone"];
    _phone = json["Phone"];
    _description = json["Description"];
    _pickupLocation = json["PickupLocation"];
    _pickupLatitude = json["PickupLatitude"];
    _pickupLongitude = json["PickupLongitude"];
    _dropoffLocation = json["DropoffLocation"];
    _dropoffLatitude = json["DropoffLatitude"];
    _dropoffLongitude = json["DropoffLongitude"];
    _weight = json["Weight"];
    _loadStatusId = json["LoadStatusId"];
    _status = json["Status"];
    _vehicleCategoryId = json["VehicleCategoryId"];
    _vehicle = json["Vehicle"];
    _shipperCost = json["ShipperCost"];
    _finalCost = json["FinalCost"];
    _costForTransporter = json["CostForTransporter"];
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
    _eSignaturePath = json["ESignaturePath"];
    if (json["LoadCarriers"] != null) {
      _loadCarriers = [];
      json["LoadCarriers"].forEach((v) {
        _loadCarriers.add(LoadCarriers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadId"] = _loadId;
    map["LoadName"] = _loadName;
    map["FullName"] = _fullName;
    map["Email"] = _email;
    map["ShipperName"] = _shipperName;
    map["ShipperPhone"] = _shipperPhone;
    map["Phone"] = _phone;
    map["Description"] = _description;
    map["PickupLocation"] = _pickupLocation;
    map["PickupLatitude"] = _pickupLatitude;
    map["PickupLongitude"] = _pickupLongitude;
    map["DropoffLocation"] = _dropoffLocation;
    map["DropoffLatitude"] = _dropoffLatitude;
    map["DropoffLongitude"] = _dropoffLongitude;
    map["Weight"] = _weight;
    map["LoadStatusId"] = _loadStatusId;
    map["Status"] = _status;
    map["VehicleCategoryId"] = _vehicleCategoryId;
    map["Vehicle"] = _vehicle;
    map["ShipperCost"] = _shipperCost;
    map["FinalCost"] = _finalCost;
    map["CostForTransporter"] = _costForTransporter;
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
    map["ESignaturePath"] = _eSignaturePath;
    if (_loadCarriers != null) {
      map["LoadCarriers"] = _loadCarriers.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// LoadCarrierId : 271
/// LoadId : 367
/// AssignedDriver : "Driver T1"
/// AssignedDriverId : 275
/// AssignedVehicle : "t1 Vehicle"
/// AssignedVehicleId : 161
/// VehiclePlateNo : "214214214"
/// LoadStatus : "Unloading"
/// Longitude : 74.3895553
/// Latitude : 31.4646349

class LoadCarriers {
  int _loadCarrierId;
  int _loadId;
  String _assignedDriver;
  int _assignedDriverId;
  String _assignedVehicle;
  int _assignedVehicleId;
  String _vehiclePlateNo;
  String _loadStatus;
  double _longitude;
  double _latitude;

  int get loadCarrierId => _loadCarrierId;
  int get loadId => _loadId;
  String get assignedDriver => _assignedDriver;
  int get assignedDriverId => _assignedDriverId;
  String get assignedVehicle => _assignedVehicle;
  int get assignedVehicleId => _assignedVehicleId;
  String get vehiclePlateNo => _vehiclePlateNo;
  String get loadStatus => _loadStatus;
  double get longitude => _longitude;
  double get latitude => _latitude;

  LoadCarriers({
      int loadCarrierId, 
      int loadId, 
      String assignedDriver, 
      int assignedDriverId, 
      String assignedVehicle, 
      int assignedVehicleId, 
      String vehiclePlateNo, 
      String loadStatus, 
      double longitude, 
      double latitude}){
    _loadCarrierId = loadCarrierId;
    _loadId = loadId;
    _assignedDriver = assignedDriver;
    _assignedDriverId = assignedDriverId;
    _assignedVehicle = assignedVehicle;
    _assignedVehicleId = assignedVehicleId;
    _vehiclePlateNo = vehiclePlateNo;
    _loadStatus = loadStatus;
    _longitude = longitude;
    _latitude = latitude;
}

  LoadCarriers.fromJson(dynamic json) {
    _loadCarrierId = json["LoadCarrierId"];
    _loadId = json["LoadId"];
    _assignedDriver = json["AssignedDriver"];
    _assignedDriverId = json["AssignedDriverId"];
    _assignedVehicle = json["AssignedVehicle"];
    _assignedVehicleId = json["AssignedVehicleId"];
    _vehiclePlateNo = json["VehiclePlateNo"];
    _loadStatus = json["LoadStatus"];
    _longitude = json["Longitude"];
    _latitude = json["Latitude"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadCarrierId"] = _loadCarrierId;
    map["LoadId"] = _loadId;
    map["AssignedDriver"] = _assignedDriver;
    map["AssignedDriverId"] = _assignedDriverId;
    map["AssignedVehicle"] = _assignedVehicle;
    map["AssignedVehicleId"] = _assignedVehicleId;
    map["VehiclePlateNo"] = _vehiclePlateNo;
    map["LoadStatus"] = _loadStatus;
    map["Longitude"] = _longitude;
    map["Latitude"] = _latitude;
    return map;
  }

}

/// LoadFilesId : 546
/// LoadId : 367
/// FilePath : "http://apitruckoom.jinnbytedev.com/Files/Loads/IMG_1616743503294_compressed7957011039678123676.jpg"

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