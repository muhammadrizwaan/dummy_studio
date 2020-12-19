/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : {"UserId":2057,"FullName":"Driver C","Email":"","PhoneNumber":"2233422","LicenseNumber":"123-456-789-0","ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","Ratings":[{"RatingId":5,"UserId":2053,"ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","FullName":"Driver C","Review":"High class service, will use for future shipments as well","Rating":5.0,"Date":"Dec 12 2020 12:00AM"},{"RatingId":6,"UserId":2053,"ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","FullName":"Driver C","Review":"High class service, will use for future shipments as well","Rating":5.0,"Date":"Dec 12 2020 12:00AM"},{"RatingId":7,"UserId":2053,"ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","FullName":"Driver C","Review":"High class service, will use for future shipments as well","Rating":5.0,"Date":"Dec 12 2020 12:00AM"},{"RatingId":8,"UserId":2053,"ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","FullName":"Driver C","Review":"High class service, will use for future shipments as well","Rating":5.0,"Date":"Dec 12 2020 12:00AM"}]}

class DriverDetailResponse {
  String _message;
  int _code;
  Result _result;

  String get message => _message;
  int get code => _code;
  Result get result => _result;

//   DriverDetailResponse({
//       String message,
//       int code,
//       Result result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  DriverDetailResponse.empty();

  DriverDetailResponse.fromJson(dynamic json) {
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

/// UserId : 2057
/// FullName : "Driver C"
/// Email : ""
/// PhoneNumber : "2233422"
/// LicenseNumber : "123-456-789-0"
/// ProfilePicture : "/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg"
/// Ratings : [{"RatingId":5,"UserId":2053,"ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","FullName":"Driver C","Review":"High class service, will use for future shipments as well","Rating":5.0,"Date":"Dec 12 2020 12:00AM"},{"RatingId":6,"UserId":2053,"ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","FullName":"Driver C","Review":"High class service, will use for future shipments as well","Rating":5.0,"Date":"Dec 12 2020 12:00AM"},{"RatingId":7,"UserId":2053,"ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","FullName":"Driver C","Review":"High class service, will use for future shipments as well","Rating":5.0,"Date":"Dec 12 2020 12:00AM"},{"RatingId":8,"UserId":2053,"ProfilePicture":"/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg","FullName":"Driver C","Review":"High class service, will use for future shipments as well","Rating":5.0,"Date":"Dec 12 2020 12:00AM"}]

class Result {
  int _userId;
  String _fullName;
  String _email;
  String _phoneNumber;
  String _licenseNumber;
  String _profilePicture;
  List<Ratings> _ratings;

  int get userId => _userId;
  String get fullName => _fullName;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get licenseNumber => _licenseNumber;
  String get profilePicture => _profilePicture;
  List<Ratings> get ratings => _ratings;

  Result({
      int userId, 
      String fullName, 
      String email, 
      String phoneNumber, 
      String licenseNumber, 
      String profilePicture, 
      List<Ratings> ratings}){
    _userId = userId;
    _fullName = fullName;
    _email = email;
    _phoneNumber = phoneNumber;
    _licenseNumber = licenseNumber;
    _profilePicture = profilePicture;
    _ratings = ratings;
}

  Result.fromJson(dynamic json) {
    _userId = json["UserId"];
    _fullName = json["FullName"];
    _email = json["Email"];
    _phoneNumber = json["PhoneNumber"];
    _licenseNumber = json["LicenseNumber"];
    _profilePicture = json["ProfilePicture"];
    if (json["Ratings"] != null) {
      _ratings = [];
      json["Ratings"].forEach((v) {
        _ratings.add(Ratings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["UserId"] = _userId;
    map["FullName"] = _fullName;
    map["Email"] = _email;
    map["PhoneNumber"] = _phoneNumber;
    map["LicenseNumber"] = _licenseNumber;
    map["ProfilePicture"] = _profilePicture;
    if (_ratings != null) {
      map["Ratings"] = _ratings.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// RatingId : 5
/// UserId : 2053
/// ProfilePicture : "/Files/UserImages/34324003_277740429434236_6306705307154251776_n.jpg"
/// FullName : "Driver C"
/// Review : "High class service, will use for future shipments as well"
/// Rating : 5.0
/// Date : "Dec 12 2020 12:00AM"

class Ratings {
  int _ratingId;
  int _userId;
  String _profilePicture;
  String _fullName;
  String _review;
  double _rating;
  String _date;

  int get ratingId => _ratingId;
  int get userId => _userId;
  String get profilePicture => _profilePicture;
  String get fullName => _fullName;
  String get review => _review;
  double get rating => _rating;
  String get date => _date;

  Ratings({
      int ratingId, 
      int userId, 
      String profilePicture, 
      String fullName, 
      String review, 
      double rating, 
      String date}){
    _ratingId = ratingId;
    _userId = userId;
    _profilePicture = profilePicture;
    _fullName = fullName;
    _review = review;
    _rating = rating;
    _date = date;
}

  Ratings.fromJson(dynamic json) {
    _ratingId = json["RatingId"];
    _userId = json["UserId"];
    _profilePicture = json["ProfilePicture"];
    _fullName = json["FullName"];
    _review = json["Review"];
    _rating = json["Rating"];
    _date = json["Date"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["RatingId"] = _ratingId;
    map["UserId"] = _userId;
    map["ProfilePicture"] = _profilePicture;
    map["FullName"] = _fullName;
    map["Review"] = _review;
    map["Rating"] = _rating;
    map["Date"] = _date;
    return map;
  }

}