class LoginResponse {
  String message;
  int code;
  Result result;

  // LoginResponse({this.message, this.code, this.result});
  LoginResponse.empty();
  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  int userId;
  String email;
  String password;
  String phone;
  Null address;
  int userTypeId;
  int userStatusId;
  String fullName;
  int cityId;
  String deviceId;
  Null emiratesId;
  bool isBusinessAccount;
  bool isActive;
  Null isAvailable;
  String createdOn;
  int createdBy;
  Null updatedOn;
  Null updatedBy;
  List<CompanyInformations> companyInformations;
  List<UserDocuments> userDocuments;
  List<DriverDetails> driverDetails;
  List<Ratings> ratings;

  Result(
      {this.userId,
        this.email,
        this.password,
        this.phone,
        this.address,
        this.userTypeId,
        this.userStatusId,
        this.fullName,
        this.cityId,
        this.deviceId,
        this.emiratesId,
        this.isBusinessAccount,
        this.isActive,
        this.isAvailable,
        this.createdOn,
        this.createdBy,
        this.updatedOn,
        this.updatedBy,
        this.companyInformations,
        this.userDocuments,
        this.driverDetails,
        this.ratings});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    email = json['Email'];
    password = json['Password'];
    phone = json['Phone'];
    address = json['Address'];
    userTypeId = json['UserTypeId'];
    userStatusId = json['UserStatusId'];
    fullName = json['FullName'];
    cityId = json['CityId'];
    deviceId = json['DeviceId'];
    emiratesId = json['EmiratesId'];
    isBusinessAccount = json['IsBusinessAccount'];
    isActive = json['IsActive'];
    isAvailable = json['IsAvailable'];
    createdOn = json['CreatedOn'];
    createdBy = json['CreatedBy'];
    updatedOn = json['UpdatedOn'];
    updatedBy = json['UpdatedBy'];
    if (json['CompanyInformations'] != null) {
      companyInformations = new List<CompanyInformations>();
      json['CompanyInformations'].forEach((v) {
        companyInformations.add(new CompanyInformations.fromJson(v));
      });
    }
    if (json['UserDocuments'] != null) {
      userDocuments = new List<UserDocuments>();
      json['UserDocuments'].forEach((v) {
        userDocuments.add(new UserDocuments.fromJson(v));
      });
    }
    if (json['DriverDetails'] != null) {
      driverDetails = new List<DriverDetails>();
      json['DriverDetails'].forEach((v) {
        driverDetails.add(new DriverDetails.fromJson(v));
      });
    }
    if (json['Ratings'] != null) {
      ratings = new List<Ratings>();
      json['Ratings'].forEach((v) {
        ratings.add(new Ratings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['Phone'] = this.phone;
    data['Address'] = this.address;
    data['UserTypeId'] = this.userTypeId;
    data['UserStatusId'] = this.userStatusId;
    data['FullName'] = this.fullName;
    data['CityId'] = this.cityId;
    data['DeviceId'] = this.deviceId;
    data['EmiratesId'] = this.emiratesId;
    data['IsBusinessAccount'] = this.isBusinessAccount;
    data['IsActive'] = this.isActive;
    data['IsAvailable'] = this.isAvailable;
    data['CreatedOn'] = this.createdOn;
    data['CreatedBy'] = this.createdBy;
    data['UpdatedOn'] = this.updatedOn;
    data['UpdatedBy'] = this.updatedBy;
    if (this.companyInformations != null) {
      data['CompanyInformations'] =
          this.companyInformations.map((v) => v.toJson()).toList();
    }
    if (this.userDocuments != null) {
      data['UserDocuments'] =
          this.userDocuments.map((v) => v.toJson()).toList();
    }
    if (this.driverDetails != null) {
      data['DriverDetails'] =
          this.driverDetails.map((v) => v.toJson()).toList();
    }
    if (this.ratings != null) {
      data['Ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyInformations {
  int companyId;
  String companyName;
  String contactNumber;
  String tRN;
  Null companyLandline;
  Null licenseExpiryDate;
  Null companyAddress;
  int userId;

  CompanyInformations(
      {this.companyId,
        this.companyName,
        this.contactNumber,
        this.tRN,
        this.companyLandline,
        this.licenseExpiryDate,
        this.companyAddress,
        this.userId});

  CompanyInformations.fromJson(Map<String, dynamic> json) {
    companyId = json['CompanyId'];
    companyName = json['CompanyName'];
    contactNumber = json['ContactNumber'];
    tRN = json['TRN'];
    companyLandline = json['CompanyLandline'];
    licenseExpiryDate = json['LicenseExpiryDate'];
    companyAddress = json['CompanyAddress'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompanyId'] = this.companyId;
    data['CompanyName'] = this.companyName;
    data['ContactNumber'] = this.contactNumber;
    data['TRN'] = this.tRN;
    data['CompanyLandline'] = this.companyLandline;
    data['LicenseExpiryDate'] = this.licenseExpiryDate;
    data['CompanyAddress'] = this.companyAddress;
    data['UserId'] = this.userId;
    return data;
  }
}

class UserDocuments {
  int userDocumentId;
  int userId;
  int documentTypeId;
  String filePath;
  bool isActive;
  String updatedOn;
  int updatedBy;

  UserDocuments(
      {this.userDocumentId,
        this.userId,
        this.documentTypeId,
        this.filePath,
        this.isActive,
        this.updatedOn,
        this.updatedBy});

  UserDocuments.fromJson(Map<String, dynamic> json) {
    userDocumentId = json['UserDocumentId'];
    userId = json['UserId'];
    documentTypeId = json['DocumentTypeId'];
    filePath = json['FilePath'];
    isActive = json['IsActive'];
    updatedOn = json['UpdatedOn'];
    updatedBy = json['UpdatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserDocumentId'] = this.userDocumentId;
    data['UserId'] = this.userId;
    data['DocumentTypeId'] = this.documentTypeId;
    data['FilePath'] = this.filePath;
    data['IsActive'] = this.isActive;
    data['UpdatedOn'] = this.updatedOn;
    data['UpdatedBy'] = this.updatedBy;
    return data;
  }
}

class DriverDetails {
  int driverDetailId;
  int driverId;
  String licenseFrontPath;
  String licenseBackPath;
  Null emiratesId;

  DriverDetails(
      {this.driverDetailId,
        this.driverId,
        this.licenseFrontPath,
        this.licenseBackPath,
        this.emiratesId});

  DriverDetails.fromJson(Map<String, dynamic> json) {
    driverDetailId = json['DriverDetailId'];
    driverId = json['DriverId'];
    licenseFrontPath = json['LicenseFrontPath'];
    licenseBackPath = json['LicenseBackPath'];
    emiratesId = json['EmiratesId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DriverDetailId'] = this.driverDetailId;
    data['DriverId'] = this.driverId;
    data['LicenseFrontPath'] = this.licenseFrontPath;
    data['LicenseBackPath'] = this.licenseBackPath;
    data['EmiratesId'] = this.emiratesId;
    return data;
  }
}

class Ratings {
  int ratingId;
  int userId;
  int loadId;
  int score;
  String comment;
  int ratedBy;
  String ratedOn;

  Ratings(
      {this.ratingId,
        this.userId,
        this.loadId,
        this.score,
        this.comment,
        this.ratedBy,
        this.ratedOn});

  Ratings.fromJson(Map<String, dynamic> json) {
    ratingId = json['RatingId'];
    userId = json['UserId'];
    loadId = json['LoadId'];
    score = json['Score'];
    comment = json['Comment'];
    ratedBy = json['RatedBy'];
    ratedOn = json['RatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RatingId'] = this.ratingId;
    data['UserId'] = this.userId;
    data['LoadId'] = this.loadId;
    data['Score'] = this.score;
    data['Comment'] = this.comment;
    data['RatedBy'] = this.ratedBy;
    data['RatedOn'] = this.ratedOn;
    return data;
  }
}