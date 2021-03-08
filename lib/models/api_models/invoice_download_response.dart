/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"Invoice":"https://firebasestorage.googleapis.com/v0/b/truckoom-a1400.appspot.com/o/CustomerList.pdf?alt=media&token=41b5dc83-a405-40db-8551-c4b2d701cf02"}

class InvoiceDownloadResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

  /*InvoiceDownloadResponse({
      String message, 
      int code, 
      Result result}){
    _message = message;
    _code = code;
    _result = result;
}*/
  InvoiceDownloadResponse.empty();

  InvoiceDownloadResponse.fromJson(dynamic json) {
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

/// Invoice : "https://firebasestorage.googleapis.com/v0/b/truckoom-a1400.appspot.com/o/CustomerList.pdf?alt=media&token=41b5dc83-a405-40db-8551-c4b2d701cf02"

class Result {
  String _invoice;

  String get invoice => _invoice;

  Result({
      String invoice}){
    _invoice = invoice;
}

  Result.fromJson(dynamic json) {
    _invoice = json["Invoice"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Invoice"] = _invoice;
    return map;
  }

}