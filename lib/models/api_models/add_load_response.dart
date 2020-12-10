import 'package:truckoom_shipper/models/api_models/common_response.dart';
import 'package:truckoom_shipper/models/api_models/load_detail_response.dart';

/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"LoadId":10026,"PickupLocation":"DHA phase 4","PickupLatitude":31.5387449,"PickupLongitude":74.3336802,"DropoffLocation":"Gulberg","DropoffLatitude":31.4646271,"DropoffLongitude":74.3873937,"Distance":0.0,"VehicleTypeId":3,"VehicleCategoryId":15,"ShipperId":2053,"AssignedTranporterId":null,"TranporterCost":null,"AssignedDriverId":null,"AssignedVehicleId":null,"ESignaturePath":null,"PickupDateTime":"2020-10-10T00:00:00","ReceiverName":"Khan","ReceiverPhone":"3000209","ReceiverEmail":null,"Weight":"45 Ton","GoodTypeId":1,"Description":"Sensitive Good","NoOfVehicles":20,"LoadStatusId":1,"PaymentMethodId":null,"PromoCodeId":null,"PromoDiscount":0.0,"ShipperCost":25053.47,"FinalTotal":25053.47,"RoundTripMultiplier":1.5,"RoundTripCost":0.0,"CommissionCost":10021.39,"CommissionMultiplier":40.0,"IsRoundTrip":false,"LoadFiles":[],"Ratings":[],"CreatedBy":2053,"CreatedOn":"2020-12-10T05:59:49.5663466-06:00","UpdatedBy":null,"UpdatedOn":null,"IsActive":true}

class AddLoadResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   AddLoadResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  AddLoadResponse.empty();

  AddLoadResponse.fromJson(dynamic json) {
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

/// LoadId : 10026
/// PickupLocation : "DHA phase 4"
/// PickupLatitude : 31.5387449
/// PickupLongitude : 74.3336802
/// DropoffLocation : "Gulberg"
/// DropoffLatitude : 31.4646271
/// DropoffLongitude : 74.3873937
/// Distance : 0.0
/// VehicleTypeId : 3
/// VehicleCategoryId : 15
/// ShipperId : 2053
/// AssignedTranporterId : null
/// TranporterCost : null
/// AssignedDriverId : null
/// AssignedVehicleId : null
/// ESignaturePath : null
/// PickupDateTime : "2020-10-10T00:00:00"
/// ReceiverName : "Khan"
/// ReceiverPhone : "3000209"
/// ReceiverEmail : null
/// Weight : "45 Ton"
/// GoodTypeId : 1
/// Description : "Sensitive Good"
/// NoOfVehicles : 20
/// LoadStatusId : 1
/// PaymentMethodId : null
/// PromoCodeId : null
/// PromoDiscount : 0.0
/// ShipperCost : 25053.47
/// FinalTotal : 25053.47
/// RoundTripMultiplier : 1.5
/// RoundTripCost : 0.0
/// CommissionCost : 10021.39
/// CommissionMultiplier : 40.0
/// IsRoundTrip : false
/// LoadFiles : []
/// Ratings : []
/// CreatedBy : 2053
/// CreatedOn : "2020-12-10T05:59:49.5663466-06:00"
/// UpdatedBy : null
/// UpdatedOn : null
/// IsActive : true

class Result {
  int _loadId;
  String _pickupLocation;
  double _pickupLatitude;
  double _pickupLongitude;
  String _dropoffLocation;
  double _dropoffLatitude;
  double _dropoffLongitude;
  double _distance;
  int _vehicleTypeId;
  int _vehicleCategoryId;
  int _shipperId;
  dynamic _assignedTranporterId;
  dynamic _tranporterCost;
  dynamic _assignedDriverId;
  dynamic _assignedVehicleId;
  dynamic _eSignaturePath;
  String _pickupDateTime;
  String _receiverName;
  String _receiverPhone;
  dynamic _receiverEmail;
  String _weight;
  int _goodTypeId;
  String _description;
  int _noOfVehicles;
  int _loadStatusId;
  dynamic _paymentMethodId;
  dynamic _promoCodeId;
  double _promoDiscount;
  double _shipperCost;
  double _finalTotal;
  double _roundTripMultiplier;
  double _roundTripCost;
  double _commissionCost;
  double _commissionMultiplier;
  bool _isRoundTrip;
  List<dynamic> _loadFiles;
  List<dynamic> _ratings;
  int _createdBy;
  String _createdOn;
  dynamic _updatedBy;
  dynamic _updatedOn;
  bool _isActive;

  int get loadId => _loadId;
  String get pickupLocation => _pickupLocation;
  double get pickupLatitude => _pickupLatitude;
  double get pickupLongitude => _pickupLongitude;
  String get dropoffLocation => _dropoffLocation;
  double get dropoffLatitude => _dropoffLatitude;
  double get dropoffLongitude => _dropoffLongitude;
  double get distance => _distance;
  int get vehicleTypeId => _vehicleTypeId;
  int get vehicleCategoryId => _vehicleCategoryId;
  int get shipperId => _shipperId;
  dynamic get assignedTranporterId => _assignedTranporterId;
  dynamic get tranporterCost => _tranporterCost;
  dynamic get assignedDriverId => _assignedDriverId;
  dynamic get assignedVehicleId => _assignedVehicleId;
  dynamic get eSignaturePath => _eSignaturePath;
  String get pickupDateTime => _pickupDateTime;
  String get receiverName => _receiverName;
  String get receiverPhone => _receiverPhone;
  dynamic get receiverEmail => _receiverEmail;
  String get weight => _weight;
  int get goodTypeId => _goodTypeId;
  String get description => _description;
  int get noOfVehicles => _noOfVehicles;
  int get loadStatusId => _loadStatusId;
  dynamic get paymentMethodId => _paymentMethodId;
  dynamic get promoCodeId => _promoCodeId;
  double get promoDiscount => _promoDiscount;
  double get shipperCost => _shipperCost;
  double get finalTotal => _finalTotal;
  double get roundTripMultiplier => _roundTripMultiplier;
  double get roundTripCost => _roundTripCost;
  double get commissionCost => _commissionCost;
  double get commissionMultiplier => _commissionMultiplier;
  bool get isRoundTrip => _isRoundTrip;
  List<dynamic> get loadFiles => _loadFiles;
  List<dynamic> get ratings => _ratings;
  int get createdBy => _createdBy;
  String get createdOn => _createdOn;
  dynamic get updatedBy => _updatedBy;
  dynamic get updatedOn => _updatedOn;
  bool get isActive => _isActive;

  Result({
      int loadId, 
      String pickupLocation, 
      double pickupLatitude, 
      double pickupLongitude, 
      String dropoffLocation, 
      double dropoffLatitude, 
      double dropoffLongitude, 
      double distance, 
      int vehicleTypeId, 
      int vehicleCategoryId, 
      int shipperId, 
      dynamic assignedTranporterId, 
      dynamic tranporterCost, 
      dynamic assignedDriverId, 
      dynamic assignedVehicleId, 
      dynamic eSignaturePath, 
      String pickupDateTime, 
      String receiverName, 
      String receiverPhone, 
      dynamic receiverEmail, 
      String weight, 
      int goodTypeId, 
      String description, 
      int noOfVehicles, 
      int loadStatusId, 
      dynamic paymentMethodId, 
      dynamic promoCodeId, 
      double promoDiscount, 
      double shipperCost, 
      double finalTotal, 
      double roundTripMultiplier, 
      double roundTripCost, 
      double commissionCost, 
      double commissionMultiplier, 
      bool isRoundTrip, 
      List<dynamic> loadFiles, 
      List<dynamic> ratings, 
      int createdBy, 
      String createdOn, 
      dynamic updatedBy, 
      dynamic updatedOn, 
      bool isActive}){
    _loadId = loadId;
    _pickupLocation = pickupLocation;
    _pickupLatitude = pickupLatitude;
    _pickupLongitude = pickupLongitude;
    _dropoffLocation = dropoffLocation;
    _dropoffLatitude = dropoffLatitude;
    _dropoffLongitude = dropoffLongitude;
    _distance = distance;
    _vehicleTypeId = vehicleTypeId;
    _vehicleCategoryId = vehicleCategoryId;
    _shipperId = shipperId;
    _assignedTranporterId = assignedTranporterId;
    _tranporterCost = tranporterCost;
    _assignedDriverId = assignedDriverId;
    _assignedVehicleId = assignedVehicleId;
    _eSignaturePath = eSignaturePath;
    _pickupDateTime = pickupDateTime;
    _receiverName = receiverName;
    _receiverPhone = receiverPhone;
    _receiverEmail = receiverEmail;
    _weight = weight;
    _goodTypeId = goodTypeId;
    _description = description;
    _noOfVehicles = noOfVehicles;
    _loadStatusId = loadStatusId;
    _paymentMethodId = paymentMethodId;
    _promoCodeId = promoCodeId;
    _promoDiscount = promoDiscount;
    _shipperCost = shipperCost;
    _finalTotal = finalTotal;
    _roundTripMultiplier = roundTripMultiplier;
    _roundTripCost = roundTripCost;
    _commissionCost = commissionCost;
    _commissionMultiplier = commissionMultiplier;
    _isRoundTrip = isRoundTrip;
    _loadFiles = loadFiles;
    _ratings = ratings;
    _createdBy = createdBy;
    _createdOn = createdOn;
    _updatedBy = updatedBy;
    _updatedOn = updatedOn;
    _isActive = isActive;
}

  Result.fromJson(dynamic json) {
    _loadId = json["LoadId"];
    _pickupLocation = json["PickupLocation"];
    _pickupLatitude = json["PickupLatitude"];
    _pickupLongitude = json["PickupLongitude"];
    _dropoffLocation = json["DropoffLocation"];
    _dropoffLatitude = json["DropoffLatitude"];
    _dropoffLongitude = json["DropoffLongitude"];
    _distance = json["Distance"];
    _vehicleTypeId = json["VehicleTypeId"];
    _vehicleCategoryId = json["VehicleCategoryId"];
    _shipperId = json["ShipperId"];
    _assignedTranporterId = json["AssignedTranporterId"];
    _tranporterCost = json["TranporterCost"];
    _assignedDriverId = json["AssignedDriverId"];
    _assignedVehicleId = json["AssignedVehicleId"];
    _eSignaturePath = json["ESignaturePath"];
    _pickupDateTime = json["PickupDateTime"];
    _receiverName = json["ReceiverName"];
    _receiverPhone = json["ReceiverPhone"];
    _receiverEmail = json["ReceiverEmail"];
    _weight = json["Weight"];
    _goodTypeId = json["GoodTypeId"];
    _description = json["Description"];
    _noOfVehicles = json["NoOfVehicles"];
    _loadStatusId = json["LoadStatusId"];
    _paymentMethodId = json["PaymentMethodId"];
    _promoCodeId = json["PromoCodeId"];
    _promoDiscount = json["PromoDiscount"];
    _shipperCost = json["ShipperCost"];
    _finalTotal = json["FinalTotal"];
    _roundTripMultiplier = json["RoundTripMultiplier"];
    _roundTripCost = json["RoundTripCost"];
    _commissionCost = json["CommissionCost"];
    _commissionMultiplier = json["CommissionMultiplier"];
    _isRoundTrip = json["IsRoundTrip"];
    if (json["LoadFiles"] != null) {
      _loadFiles = [];
      json["LoadFiles"].forEach((v) {
        _loadFiles.add(LoadFiles.fromJson(v));
      });
    }
    if (json["Ratings"] != null) {
      _ratings = [];
      json["Ratings"].forEach((v) {
        _ratings.add(Ratings.fromJson(v));
      });
    }
    _createdBy = json["CreatedBy"];
    _createdOn = json["CreatedOn"];
    _updatedBy = json["UpdatedBy"];
    _updatedOn = json["UpdatedOn"];
    _isActive = json["IsActive"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadId"] = _loadId;
    map["PickupLocation"] = _pickupLocation;
    map["PickupLatitude"] = _pickupLatitude;
    map["PickupLongitude"] = _pickupLongitude;
    map["DropoffLocation"] = _dropoffLocation;
    map["DropoffLatitude"] = _dropoffLatitude;
    map["DropoffLongitude"] = _dropoffLongitude;
    map["Distance"] = _distance;
    map["VehicleTypeId"] = _vehicleTypeId;
    map["VehicleCategoryId"] = _vehicleCategoryId;
    map["ShipperId"] = _shipperId;
    map["AssignedTranporterId"] = _assignedTranporterId;
    map["TranporterCost"] = _tranporterCost;
    map["AssignedDriverId"] = _assignedDriverId;
    map["AssignedVehicleId"] = _assignedVehicleId;
    map["ESignaturePath"] = _eSignaturePath;
    map["PickupDateTime"] = _pickupDateTime;
    map["ReceiverName"] = _receiverName;
    map["ReceiverPhone"] = _receiverPhone;
    map["ReceiverEmail"] = _receiverEmail;
    map["Weight"] = _weight;
    map["GoodTypeId"] = _goodTypeId;
    map["Description"] = _description;
    map["NoOfVehicles"] = _noOfVehicles;
    map["LoadStatusId"] = _loadStatusId;
    map["PaymentMethodId"] = _paymentMethodId;
    map["PromoCodeId"] = _promoCodeId;
    map["PromoDiscount"] = _promoDiscount;
    map["ShipperCost"] = _shipperCost;
    map["FinalTotal"] = _finalTotal;
    map["RoundTripMultiplier"] = _roundTripMultiplier;
    map["RoundTripCost"] = _roundTripCost;
    map["CommissionCost"] = _commissionCost;
    map["CommissionMultiplier"] = _commissionMultiplier;
    map["IsRoundTrip"] = _isRoundTrip;
    if (_loadFiles != null) {
      map["LoadFiles"] = _loadFiles.map((v) => v.toJson()).toList();
    }
    if (_ratings != null) {
      map["Ratings"] = _ratings.map((v) => v.toJson()).toList();
    }
    map["CreatedBy"] = _createdBy;
    map["CreatedOn"] = _createdOn;
    map["UpdatedBy"] = _updatedBy;
    map["UpdatedOn"] = _updatedOn;
    map["IsActive"] = _isActive;
    return map;
  }

}