/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"InvoiceId":10,"TransporterLogo":"/Files/UserImages/image_picker8590741799748320093.jpg","TransporterName":"Transporter 100","PickupLocation":"MM Alam Rd, Theh Block J Gulberg III, Lahore, Punjab, Pakistan","DropOffLocation":"Ferozepur Road & Kalma Chowk Flyover, Garden Block Garden Town, Lahore, Punjab, Pakistan","CompletedDate":"Jan 22 2021  2:54PM","Weight":"55","ShipperCost":295113.0,"CouponDiscount":0.0,"VatPercentage":0.0,"VatAmount":47218.08,"TotalShipperCost":342331.08,"TransporterCost":177067.8,"LoadStatus":[{"LoadStatusId":1,"Status":"Placed","Date":"Jan 19 2021  8:09AM"},{"LoadStatusId":2,"Status":"Assigned By Admin\n","Date":"Jan 19 2021 12:37PM"},{"LoadStatusId":3,"Status":"Accepted By Transporter","Date":"Jan 19 2021 12:40PM"},{"LoadStatusId":5,"Status":"Accepted By Shipper","Date":"Jan 19 2021  2:04PM"},{"LoadStatusId":8,"Status":"Loading","Date":"Jan 21 2021  1:54AM"},{"LoadStatusId":9,"Status":"On The Way","Date":"Jan 21 2021  1:54AM"},{"LoadStatusId":10,"Status":"Unloading","Date":"Jan 21 2021  1:54AM"},{"LoadStatusId":11,"Status":"Delivered","Date":"Jan 22 2021  2:54PM"}],"ESignature":null,"Rating":0.0,"Remarks":""}

class InvoiceDetailResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   InvoiceDetailResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  InvoiceDetailResponse.empty();

  InvoiceDetailResponse.fromJson(dynamic json) {
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

/// InvoiceId : 10
/// TransporterLogo : "/Files/UserImages/image_picker8590741799748320093.jpg"
/// TransporterName : "Transporter 100"
/// PickupLocation : "MM Alam Rd, Theh Block J Gulberg III, Lahore, Punjab, Pakistan"
/// DropOffLocation : "Ferozepur Road & Kalma Chowk Flyover, Garden Block Garden Town, Lahore, Punjab, Pakistan"
/// CompletedDate : "Jan 22 2021  2:54PM"
/// Weight : "55"
/// ShipperCost : 295113.0
/// CouponDiscount : 0.0
/// VatPercentage : 0.0
/// VatAmount : 47218.08
/// TotalShipperCost : 342331.08
/// TransporterCost : 177067.8
/// LoadStatus : [{"LoadStatusId":1,"Status":"Placed","Date":"Jan 19 2021  8:09AM"},{"LoadStatusId":2,"Status":"Assigned By Admin\n","Date":"Jan 19 2021 12:37PM"},{"LoadStatusId":3,"Status":"Accepted By Transporter","Date":"Jan 19 2021 12:40PM"},{"LoadStatusId":5,"Status":"Accepted By Shipper","Date":"Jan 19 2021  2:04PM"},{"LoadStatusId":8,"Status":"Loading","Date":"Jan 21 2021  1:54AM"},{"LoadStatusId":9,"Status":"On The Way","Date":"Jan 21 2021  1:54AM"},{"LoadStatusId":10,"Status":"Unloading","Date":"Jan 21 2021  1:54AM"},{"LoadStatusId":11,"Status":"Delivered","Date":"Jan 22 2021  2:54PM"}]
/// ESignature : null
/// Rating : 0.0
/// Remarks : ""

class Result {
  int _invoiceId;
  String _transporterLogo;
  String _transporterName;
  String _pickupLocation;
  String _dropOffLocation;
  String _completedDate;
  String _weight;
  double _shipperCost;
  double _couponDiscount;
  double _vatPercentage;
  double _vatAmount;
  double _totalShipperCost;
  double _transporterCost;
  List<LoadStatus> _loadStatus;
  dynamic _eSignature;
  double _rating;
  String _remarks;

  int get invoiceId => _invoiceId;
  String get transporterLogo => _transporterLogo;
  String get transporterName => _transporterName;
  String get pickupLocation => _pickupLocation;
  String get dropOffLocation => _dropOffLocation;
  String get completedDate => _completedDate;
  String get weight => _weight;
  double get shipperCost => _shipperCost;
  double get couponDiscount => _couponDiscount;
  double get vatPercentage => _vatPercentage;
  double get vatAmount => _vatAmount;
  double get totalShipperCost => _totalShipperCost;
  double get transporterCost => _transporterCost;
  List<LoadStatus> get loadStatus => _loadStatus;
  dynamic get eSignature => _eSignature;
  double get rating => _rating;
  String get remarks => _remarks;

  Result({
      int invoiceId, 
      String transporterLogo, 
      String transporterName, 
      String pickupLocation, 
      String dropOffLocation, 
      String completedDate, 
      String weight, 
      double shipperCost, 
      double couponDiscount, 
      double vatPercentage, 
      double vatAmount, 
      double totalShipperCost, 
      double transporterCost, 
      List<LoadStatus> loadStatus, 
      dynamic eSignature, 
      double rating, 
      String remarks}){
    _invoiceId = invoiceId;
    _transporterLogo = transporterLogo;
    _transporterName = transporterName;
    _pickupLocation = pickupLocation;
    _dropOffLocation = dropOffLocation;
    _completedDate = completedDate;
    _weight = weight;
    _shipperCost = shipperCost;
    _couponDiscount = couponDiscount;
    _vatPercentage = vatPercentage;
    _vatAmount = vatAmount;
    _totalShipperCost = totalShipperCost;
    _transporterCost = transporterCost;
    _loadStatus = loadStatus;
    _eSignature = eSignature;
    _rating = rating;
    _remarks = remarks;
}

  Result.fromJson(dynamic json) {
    _invoiceId = json["InvoiceId"];
    _transporterLogo = json["TransporterLogo"];
    _transporterName = json["TransporterName"];
    _pickupLocation = json["PickupLocation"];
    _dropOffLocation = json["DropOffLocation"];
    _completedDate = json["CompletedDate"];
    _weight = json["Weight"];
    _shipperCost = json["ShipperCost"];
    _couponDiscount = json["CouponDiscount"];
    _vatPercentage = json["VatPercentage"];
    _vatAmount = json["VatAmount"];
    _totalShipperCost = json["TotalShipperCost"];
    _transporterCost = json["TransporterCost"];
    if (json["LoadStatus"] != null) {
      _loadStatus = [];
      json["LoadStatus"].forEach((v) {
        _loadStatus.add(LoadStatus.fromJson(v));
      });
    }
    _eSignature = json["ESignature"];
    _rating = json["Rating"];
    _remarks = json["Remarks"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["InvoiceId"] = _invoiceId;
    map["TransporterLogo"] = _transporterLogo;
    map["TransporterName"] = _transporterName;
    map["PickupLocation"] = _pickupLocation;
    map["DropOffLocation"] = _dropOffLocation;
    map["CompletedDate"] = _completedDate;
    map["Weight"] = _weight;
    map["ShipperCost"] = _shipperCost;
    map["CouponDiscount"] = _couponDiscount;
    map["VatPercentage"] = _vatPercentage;
    map["VatAmount"] = _vatAmount;
    map["TotalShipperCost"] = _totalShipperCost;
    map["TransporterCost"] = _transporterCost;
    if (_loadStatus != null) {
      map["LoadStatus"] = _loadStatus.map((v) => v.toJson()).toList();
    }
    map["ESignature"] = _eSignature;
    map["Rating"] = _rating;
    map["Remarks"] = _remarks;
    return map;
  }

}

/// LoadStatusId : 1
/// Status : "Placed"
/// Date : "Jan 19 2021  8:09AM"

class LoadStatus {
  int _loadStatusId;
  String _status;
  String _date;

  int get loadStatusId => _loadStatusId;
  String get status => _status;
  String get date => _date;

  LoadStatus({
      int loadStatusId, 
      String status, 
      String date}){
    _loadStatusId = loadStatusId;
    _status = status;
    _date = date;
}

  LoadStatus.fromJson(dynamic json) {
    _loadStatusId = json["LoadStatusId"];
    _status = json["Status"];
    _date = json["Date"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadStatusId"] = _loadStatusId;
    map["Status"] = _status;
    map["Date"] = _date;
    return map;
  }

}