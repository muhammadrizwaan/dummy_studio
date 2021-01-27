/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"PaidAmount":10500.0,"PendingAmount":575293.04,"Transactions":[{"LoadId":45,"PaymentMode":"Bank Transfer","Payment":2000.0,"TransactionDate":"2021-01-27T05:14:12.027"},{"LoadId":46,"PaymentMode":"Cash","Payment":2000.0,"TransactionDate":"2021-01-27T05:14:51.883"},{"LoadId":50,"PaymentMode":"Cheque","Payment":5000.0,"TransactionDate":"2021-01-27T05:16:13.333"},{"LoadId":51,"PaymentMode":"Bank Transfer","Payment":500.0,"TransactionDate":"2021-01-27T05:12:50.513"},{"LoadId":51,"PaymentMode":"Payment Gateway","Payment":1000.0,"TransactionDate":"2021-01-27T05:16:26.237"}]}

class WalletResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   WalletResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  WalletResponse.empty();

  WalletResponse.fromJson(dynamic json) {
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

/// PaidAmount : 10500.0
/// PendingAmount : 575293.04
/// Transactions : [{"LoadId":45,"PaymentMode":"Bank Transfer","Payment":2000.0,"TransactionDate":"2021-01-27T05:14:12.027"},{"LoadId":46,"PaymentMode":"Cash","Payment":2000.0,"TransactionDate":"2021-01-27T05:14:51.883"},{"LoadId":50,"PaymentMode":"Cheque","Payment":5000.0,"TransactionDate":"2021-01-27T05:16:13.333"},{"LoadId":51,"PaymentMode":"Bank Transfer","Payment":500.0,"TransactionDate":"2021-01-27T05:12:50.513"},{"LoadId":51,"PaymentMode":"Payment Gateway","Payment":1000.0,"TransactionDate":"2021-01-27T05:16:26.237"}]

class Result {
  double _paidAmount;
  double _pendingAmount;
  List<Transactions> _transactions;

  double get paidAmount => _paidAmount;
  double get pendingAmount => _pendingAmount;
  List<Transactions> get transactions => _transactions;

  Result({
      double paidAmount, 
      double pendingAmount, 
      List<Transactions> transactions}){
    _paidAmount = paidAmount;
    _pendingAmount = pendingAmount;
    _transactions = transactions;
}

  Result.fromJson(dynamic json) {
    _paidAmount = json["PaidAmount"];
    _pendingAmount = json["PendingAmount"];
    if (json["Transactions"] != null) {
      _transactions = [];
      json["Transactions"].forEach((v) {
        _transactions.add(Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["PaidAmount"] = _paidAmount;
    map["PendingAmount"] = _pendingAmount;
    if (_transactions != null) {
      map["Transactions"] = _transactions.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// LoadId : 45
/// PaymentMode : "Bank Transfer"
/// Payment : 2000.0
/// TransactionDate : "2021-01-27T05:14:12.027"

class Transactions {
  int _loadId;
  String _paymentMode;
  double _payment;
  String _transactionDate;

  int get loadId => _loadId;
  String get paymentMode => _paymentMode;
  double get payment => _payment;
  String get transactionDate => _transactionDate;

  Transactions({
      int loadId, 
      String paymentMode, 
      double payment, 
      String transactionDate}){
    _loadId = loadId;
    _paymentMode = paymentMode;
    _payment = payment;
    _transactionDate = transactionDate;
}

  Transactions.fromJson(dynamic json) {
    _loadId = json["LoadId"];
    _paymentMode = json["PaymentMode"];
    _payment = json["Payment"];
    _transactionDate = json["TransactionDate"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadId"] = _loadId;
    map["PaymentMode"] = _paymentMode;
    map["Payment"] = _payment;
    map["TransactionDate"] = _transactionDate;
    return map;
  }

}