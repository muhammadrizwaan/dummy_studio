class PhoneNumberResponse {
  String message;
  int code;
  Result result;

  // PhoneNumberResponse({this.message, this.code, this.result});
  PhoneNumberResponse.empty();
  PhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    code = json['Code'];
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Code'] = this.code;
    if (this.result != null) {
      data['Result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String key;
  String value;

  Result({this.key, this.value});

  Result.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Key'] = this.key;
    data['Value'] = this.value;
    return data;
  }
}