/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"InvoiceId":10022,"TransporterLogo":"","TransporterName":"Kohli Transporter","PickupLocation":"tyesgjkh","DropOffLocation":"jkhjkhkj","CompletedDate":"Dec  8 2020  5:27AM","Weight":"56","TotalPrice":6728052.25,"LoadStatus":"Delivered","ESignature":"/Files/Loads/100221b907cad177181b12cea64203dcb7623.jpg","Rating":0.0,"Remarks":""}

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

/// InvoiceId : 10022
/// TransporterLogo : ""
/// TransporterName : "Kohli Transporter"
/// PickupLocation : "tyesgjkh"
/// DropOffLocation : "jkhjkhkj"
/// CompletedDate : "Dec  8 2020  5:27AM"
/// Weight : "56"
/// TotalPrice : 6728052.25
/// LoadStatus : "Delivered"
/// ESignature : "/Files/Loads/100221b907cad177181b12cea64203dcb7623.jpg"
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
  double _totalPrice;
  String _loadStatus;
  String _eSignature;
  double _rating;
  String _remarks;

  int get invoiceId => _invoiceId;
  String get transporterLogo => _transporterLogo;
  String get transporterName => _transporterName;
  String get pickupLocation => _pickupLocation;
  String get dropOffLocation => _dropOffLocation;
  String get completedDate => _completedDate;
  String get weight => _weight;
  double get totalPrice => _totalPrice;
  String get loadStatus => _loadStatus;
  String get eSignature => _eSignature;
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
      double totalPrice, 
      String loadStatus, 
      String eSignature, 
      double rating, 
      String remarks}){
    _invoiceId = invoiceId;
    _transporterLogo = transporterLogo;
    _transporterName = transporterName;
    _pickupLocation = pickupLocation;
    _dropOffLocation = dropOffLocation;
    _completedDate = completedDate;
    _weight = weight;
    _totalPrice = totalPrice;
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
    _totalPrice = json["TotalPrice"];
    _loadStatus = json["LoadStatus"];
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
    map["TotalPrice"] = _totalPrice;
    map["LoadStatus"] = _loadStatus;
    map["ESignature"] = _eSignature;
    map["Rating"] = _rating;
    map["Remarks"] = _remarks;
    return map;
  }

}