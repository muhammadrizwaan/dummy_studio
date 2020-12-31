/// Message : "Operation performed Succesfully"
/// Code : 1
/// Result : [{"LoadFilesId":2037,"LoadId":10165,"FilePath":"/Files/Loads/Screenshot 2020-12-25 at 08.41.52.png"},{"LoadFilesId":2038,"LoadId":10165,"FilePath":"/Files/Loads/Screenshot 2020-12-25 at 03.38.22.png"},{"LoadFilesId":2039,"LoadId":10165,"FilePath":"/Files/Loads/Screenshot 2020-12-25 at 03.37.44.png"},{"LoadFilesId":2040,"LoadId":10165,"FilePath":"/Files/Loads/Screenshot 2020-12-25 at 01.01.09.png"}]

class LoadImagesResponse {
  String _message;
  int _code;
  List<Result> _result;

  String get message => _message;
  int get code => _code;
  List<Result> get result => _result;

//   LoadImagesResponse({
//       String message,
//       int code,
//       List<Result> result}){
//     _message = message;
//     _code = code;
//     _result = result;
// }

  LoadImagesResponse.empty();

  LoadImagesResponse.fromJson(dynamic json) {
    _message = json["Message"];
    _code = json["Code"];
    if (json["Result"] != null) {
      _result = [];
      json["Result"].forEach((v) {
        _result.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Message"] = _message;
    map["Code"] = _code;
    if (_result != null) {
      map["Result"] = _result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// LoadFilesId : 2037
/// LoadId : 10165
/// FilePath : "/Files/Loads/Screenshot 2020-12-25 at 08.41.52.png"

class Result {
  int _loadFilesId;
  int _loadId;
  String _filePath;

  int get loadFilesId => _loadFilesId;
  int get loadId => _loadId;
  String get filePath => _filePath;

  Result({
      int loadFilesId, 
      int loadId, 
      String filePath}){
    _loadFilesId = loadFilesId;
    _loadId = loadId;
    _filePath = filePath;
}

  Result.fromJson(dynamic json) {
    _loadFilesId = json["LoadFilesId"];
    _loadId = json["LoadId"];
    _filePath = json["FilePath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["LoadFilesId"] = _loadFilesId;
    map["LoadId"] = _loadId;
    map["FilePath"] = _filePath;
    return map;
  }

}