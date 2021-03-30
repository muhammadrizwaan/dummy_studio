/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"InvoiceId":530,"TransporterLogo":"http://truckoom.jinnbytedev.com/Content/ComingSoon/assets/Images/logo_final.png","TransporterName":"abdullah","PickupLocation":"Lahore, Punjab, Pakistan","DropOffLocation":"Karachi, Karachi City, Sindh, Pakistan","CompletedDate":"2021-03-29T07:25:58.103","Weight":"5","ShipperCost":28818.0,"CouponDiscount":0.0,"VatPercentage":0.01,"VatAmount":288.18,"TotalShipperCost":29106.18,"TransporterCost":17290.8,"LoadStatus":[{"LoadStatusId":1,"Status":"Placed","Date":"2021-03-29T04:35:44.08"},{"LoadStatusId":2,"Status":"Assigned By Admin\n","Date":"2021-03-29T07:12:32.653"},{"LoadStatusId":3,"Status":"Accepted By Transporter","Date":"2021-03-29T07:12:54.15"},{"LoadStatusId":5,"Status":"Accepted By Shipper","Date":"2021-03-29T07:14:13.6"},{"LoadStatusId":8,"Status":"Loading","Date":"2021-03-29T07:20:31.303"},{"LoadStatusId":9,"Status":"On The Way","Date":"2021-03-29T07:25:17.59"},{"LoadStatusId":10,"Status":"Unloading","Date":"2021-03-29T07:25:31.293"},{"LoadStatusId":11,"Status":"Delivered","Date":"2021-03-29T07:25:58.103"}],"ESignature":"http://apitruckoom.jinnbytedev.com/Files/Loads/00994454load_image.jpg","Rating":2.0,"Remarks":"","RatingByTransporter":5.0,"RemarksByTransporter":""}

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

/// InvoiceId : 530
/// TransporterLogo : "http://truckoom.jinnbytedev.com/Content/ComingSoon/assets/Images/logo_final.png"
/// TransporterName : "abdullah"
/// PickupLocation : "Lahore, Punjab, Pakistan"
/// DropOffLocation : "Karachi, Karachi City, Sindh, Pakistan"
/// CompletedDate : "2021-03-29T07:25:58.103"
/// Weight : "5"
/// ShipperCost : 28818.0
/// CouponDiscount : 0.0
/// VatPercentage : 0.01
/// VatAmount : 288.18
/// TotalShipperCost : 29106.18
/// TransporterCost : 17290.8
/// LoadStatus : [{"LoadStatusId":1,"Status":"Placed","Date":"2021-03-29T04:35:44.08"},{"LoadStatusId":2,"Status":"Assigned By Admin\n","Date":"2021-03-29T07:12:32.653"},{"LoadStatusId":3,"Status":"Accepted By Transporter","Date":"2021-03-29T07:12:54.15"},{"LoadStatusId":5,"Status":"Accepted By Shipper","Date":"2021-03-29T07:14:13.6"},{"LoadStatusId":8,"Status":"Loading","Date":"2021-03-29T07:20:31.303"},{"LoadStatusId":9,"Status":"On The Way","Date":"2021-03-29T07:25:17.59"},{"LoadStatusId":10,"Status":"Unloading","Date":"2021-03-29T07:25:31.293"},{"LoadStatusId":11,"Status":"Delivered","Date":"2021-03-29T07:25:58.103"}]
/// ESignature : "http://apitruckoom.jinnbytedev.com/Files/Loads/00994454load_image.jpg"
/// Rating : 2.0
/// Remarks : ""
/// RatingByTransporter : 5.0
/// RemarksByTransporter : ""

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
  String _eSignature;
  double _rating;
  String _remarks;
  double _ratingByTransporter;
  String _remarksByTransporter;

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
  String get eSignature => _eSignature;
  double get rating => _rating;
  String get remarks => _remarks;
  double get ratingByTransporter => _ratingByTransporter;
  String get remarksByTransporter => _remarksByTransporter;

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
      String eSignature, 
      double rating, 
      String remarks, 
      double ratingByTransporter, 
      String remarksByTransporter}){
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
    _ratingByTransporter = ratingByTransporter;
    _remarksByTransporter = remarksByTransporter;
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
    _ratingByTransporter = json["RatingByTransporter"];
    _remarksByTransporter = json["RemarksByTransporter"];
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
    map["RatingByTransporter"] = _ratingByTransporter;
    map["RemarksByTransporter"] = _remarksByTransporter;
    return map;
  }

}

/// LoadStatusId : 1
/// Status : "Placed"
/// Date : "2021-03-29T04:35:44.08"

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