/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"RatingId":3,"UserId":134,"LoadId":105,"Score":3.0,"Comment":"Average transporter","RatedBy":124,"RatedOn":"2021-02-06T13:30:45.5674809Z","IsShipper":true}

class ReviewsResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   ReviewsResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  ReviewsResponse.empty();

  ReviewsResponse.fromJson(dynamic json) {
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

/// RatingId : 3
/// UserId : 134
/// LoadId : 105
/// Score : 3.0
/// Comment : "Average transporter"
/// RatedBy : 124
/// RatedOn : "2021-02-06T13:30:45.5674809Z"
/// IsShipper : true

class Result {
  int _ratingId;
  int _userId;
  int _loadId;
  double _score;
  String _comment;
  int _ratedBy;
  String _ratedOn;
  bool _isShipper;

  int get ratingId => _ratingId;
  int get userId => _userId;
  int get loadId => _loadId;
  double get score => _score;
  String get comment => _comment;
  int get ratedBy => _ratedBy;
  String get ratedOn => _ratedOn;
  bool get isShipper => _isShipper;

  Result({
      int ratingId, 
      int userId, 
      int loadId, 
      double score, 
      String comment, 
      int ratedBy, 
      String ratedOn, 
      bool isShipper}){
    _ratingId = ratingId;
    _userId = userId;
    _loadId = loadId;
    _score = score;
    _comment = comment;
    _ratedBy = ratedBy;
    _ratedOn = ratedOn;
    _isShipper = isShipper;
}

  Result.fromJson(dynamic json) {
    _ratingId = json["RatingId"];
    _userId = json["UserId"];
    _loadId = json["LoadId"];
    _score = json["Score"];
    _comment = json["Comment"];
    _ratedBy = json["RatedBy"];
    _ratedOn = json["RatedOn"];
    _isShipper = json["IsShipper"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["RatingId"] = _ratingId;
    map["UserId"] = _userId;
    map["LoadId"] = _loadId;
    map["Score"] = _score;
    map["Comment"] = _comment;
    map["RatedBy"] = _ratedBy;
    map["RatedOn"] = _ratedOn;
    map["IsShipper"] = _isShipper;
    return map;
  }

}