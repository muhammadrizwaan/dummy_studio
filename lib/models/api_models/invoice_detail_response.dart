/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"InvoiceId":10164,"TransporterLogo":"/Files/UserImages/Screenshot 2020-10-07 at 22.15.09.png","TransporterName":"babar","PickupLocation":"DHA phase 4","DropOffLocation":"Gulberg","CompletedDate":"Dec 28 2020  4:55AM","Weight":"55","TotalPrice":248439.91,"LoadStatus":[{"LoadStatusId":1,"Status":"Placed","Date":"Dec 28 2020  4:50AM"},{"LoadStatusId":2,"Status":"Assigned By Admin\n","Date":"Dec 28 2020  4:52AM"},{"LoadStatusId":3,"Status":"Accepted By Transporter","Date":"Dec 28 2020  4:52AM"},{"LoadStatusId":5,"Status":"Accepted By Shipper","Date":"Dec 28 2020  4:53AM"},{"LoadStatusId":8,"Status":"Loading","Date":"Dec 28 2020  4:54AM"},{"LoadStatusId":9,"Status":"On The Way","Date":"Dec 28 2020  4:54AM"},{"LoadStatusId":10,"Status":"Unloading","Date":"Dec 28 2020  4:55AM"},{"LoadStatusId":11,"Status":"Delivered","Date":"Dec 28 2020  4:55AM"}],"ESignature":"http://truckoom.jinnbytedev.com/Files/Loads/10164flutter_logo (1).png","Rating":0.0,"Remarks":""}

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

/// InvoiceId : 10164
/// TransporterLogo : "/Files/UserImages/Screenshot 2020-10-07 at 22.15.09.png"
/// TransporterName : "babar"
/// PickupLocation : "DHA phase 4"
/// DropOffLocation : "Gulberg"
/// CompletedDate : "Dec 28 2020  4:55AM"
/// Weight : "55"
/// TotalPrice : 248439.91
/// LoadStatus : [{"LoadStatusId":1,"Status":"Placed","Date":"Dec 28 2020  4:50AM"},{"LoadStatusId":2,"Status":"Assigned By Admin\n","Date":"Dec 28 2020  4:52AM"},{"LoadStatusId":3,"Status":"Accepted By Transporter","Date":"Dec 28 2020  4:52AM"},{"LoadStatusId":5,"Status":"Accepted By Shipper","Date":"Dec 28 2020  4:53AM"},{"LoadStatusId":8,"Status":"Loading","Date":"Dec 28 2020  4:54AM"},{"LoadStatusId":9,"Status":"On The Way","Date":"Dec 28 2020  4:54AM"},{"LoadStatusId":10,"Status":"Unloading","Date":"Dec 28 2020  4:55AM"},{"LoadStatusId":11,"Status":"Delivered","Date":"Dec 28 2020  4:55AM"}]
/// ESignature : "http://truckoom.jinnbytedev.com/Files/Loads/10164flutter_logo (1).png"
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
  List<LoadStatus> _loadStatus;
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
  List<LoadStatus> get loadStatus => _loadStatus;
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
      List<LoadStatus> loadStatus, 
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
    map["TotalPrice"] = _totalPrice;
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
/// Date : "Dec 28 2020  4:50AM"

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