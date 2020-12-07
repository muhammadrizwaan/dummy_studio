/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"QueryId":7,"Subject":"System not working properly","Email":"johndoe@gmail.com","Message":"I tried to login but nothing is happening. Please look into this issue."}

class ContactUsResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

  ContactUsResponse.empty();
//   ContactUsResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  ContactUsResponse.fromJson(dynamic json) {
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

/// QueryId : 7
/// Subject : "System not working properly"
/// Email : "johndoe@gmail.com"
/// Message : "I tried to login but nothing is happening. Please look into this issue."

class Result {
  int _queryId;
  String _subject;
  String _email;
  String _message;

  int get queryId => _queryId;
  String get subject => _subject;
  String get email => _email;
  String get message => _message;

  Result({
      int queryId, 
      String subject, 
      String email, 
      String message}){
    _queryId = queryId;
    _subject = subject;
    _email = email;
    _message = message;
}

  Result.fromJson(dynamic json) {
    _queryId = json["QueryId"];
    _subject = json["Subject"];
    _email = json["Email"];
    _message = json["Message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["QueryId"] = _queryId;
    map["Subject"] = _subject;
    map["Email"] = _email;
    map["Message"] = _message;
    return map;
  }

}