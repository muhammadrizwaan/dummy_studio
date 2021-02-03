
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/cities_response.dart';
import 'package:truckoom_shipper/models/api_models/edit_profile_response.dart';
import 'package:truckoom_shipper/models/api_models/license_images_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/utilities/utilities.dart';

class BusinessEditProfileProvider extends ChangeNotifier{
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  bool isDataFetched = false;
  EditProfileResponse _editProfileResponse = EditProfileResponse.empty();
  CitiesResponse _citiesResponse = CitiesResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  LicenseImagesResponse _licenseImagesResponse = LicenseImagesResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken _getToken = GetToken();
  List<String> description = List<String>();
  final picker = ImagePicker();
  Dio _dio = Dio();
  File userImage;
  String imagePath;
  String deviceId, token, phone;
  double ms;
  bool isImagePicked;
  double currentTime;
  var connectivity;

  init(BuildContext context) async {
    this.context = context;
    deviceId = "";
    imagePath = "";
    phone = "";
    token = "";
    connectivity = "";
    description = [];
    await getCities(context: context);
  }

  Future onEditImage({@required BuildContext context}) async {
    print('select');
    int userId = await Constants.getUserId();
    final image = await picker.getImage(source: ImageSource.gallery,);
    if (image != null) {
      print('image path');
      print(image.path);
      userImage = File(image.path);
      imagePath = userImage.path.split("/").last;
      print(imagePath);
      try {
        token = await PreferenceUtils.getString(Strings.token);
        FormData formData = FormData.fromMap({
          "Attachment": await MultipartFile.fromFile(
            userImage.path,
            filename: imagePath,
            contentType: MediaType(
              "image",
              "jpg",
            ),
          ),
          "userId": userId,
        });
        Response _response = await _dio.post(
          uploadProfilePictureApi,
          data: formData,
          options: Options(
              contentType: "multipart/form-data",
              headers: {'Authorization': token}),
        );
        if (_response.statusCode == 200) {
          _editProfileResponse = EditProfileResponse.fromJson(_response.data);
          if (_editProfileResponse.code == 1) {
            print('image uploaded');
            print(_editProfileResponse.result.profilePicture);
            await PreferenceUtils.setString(Strings.userImageKey,
                _editProfileResponse.result.profilePicture);
            isImagePicked = true;
            notifyListeners();
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _editProfileResponse.message);
          }
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      } catch (error) {
        print(error.toString());
      }
    } else {
      print('No image selected');
    }
  }

  Future businessUpdateProfile({
    @required BuildContext context,
    @required String name,
    @required String password,
    @required String confirmPassword,
    @required String businessName,
    @required String businessPhone,
    @required String trn,
    @required int city,
    @required String licenseExpiryDate,
  }) async {
    try {
      int userId = Constants.getUserId();
      int cityId = city > 0 ? city : await Constants.getCityId();
      deviceId = await PreferenceUtils.getString(Strings.deviceId);
      connectivity = await (Connectivity().checkConnectivity());
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.internetConnectionError,
        );
      } else if (name.isEmpty) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.nameErrorText,
        );
      } else if (password.isEmpty && password.length < 6) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.passwordErrorText,
        );
      } else if (confirmPassword.isEmpty && confirmPassword.length < 6) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.passwordErrorText,
        );
      }
      else if (password != confirmPassword) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.passwordMatchErrorText,
        );
      }
      else if (businessName.isEmpty) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.businessNameErrorText,
        );
      }
      else if (businessPhone.validatePhoneNumber() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.phoneNumberErrorText);
      }
      else if (trn.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.trnErrorText);
      }
      else {
        _loader.showLoader(context: context);
        token = await _getToken.onToken();
        phone = Constants.getCommpanyPhone();
        http.Response response = await _networkHelper.post(
          getUpdateUserInformationApi,
          headers: {"Content-Type": "application/json", 'Authorization': token},
          body: {
            "UserId": userId,
            "FullName": name,
            "Password": password,
            "DeviceId": deviceId,
            "CityId": cityId,
            "CompanyInformations": [
              {
                "CompanyName": businessName,
                "ContactNumber": businessPhone,
                "TRN": trn,
                "LicenseExpiryDate": licenseExpiryDate
              }
            ]
          }
        );
        if (response.statusCode == 200) {
          _editProfileResponse =
              EditProfileResponse.fromJson(
                  genericDecodeEncode.decodeJson(response.body));
          if (_editProfileResponse.code == 1) {
            print('Updated user');
            Constants.setUserEmail(_editProfileResponse.result.email);
            Constants.setPassword(_editProfileResponse.result.password);
            Constants.setUserName(_editProfileResponse.result.fullName);
            Constants.setUserPhone(_editProfileResponse.result.phone);
            Constants.setCityName(_editProfileResponse.result.cityName);
            Constants.setCityId(_editProfileResponse.result.cityId);
            if(_editProfileResponse.result.companyInformation.isNotEmpty){
              Constants.setCommpanyName(_editProfileResponse.result.companyInformation[0].companyName);
              Constants.setCommpanyPhone(_editProfileResponse.result.companyInformation[0].contactNumber);
              Constants.setCommpanyTrn(_editProfileResponse.result.companyInformation[0].trn);
              Constants.setLicenseExpiryDate(_editProfileResponse.result.companyInformation[0].licenseExpiryDate);
            }
            _loader.hideLoader(context);
            print('Updated user');
            Navigator.pushReplacement(context, SlideRightRoute(page: BusinessProfile()));
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _editProfileResponse.message);
          }
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  Future getCities({@required BuildContext context}) async {
    try {
      connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      }
      else {
        http.Response response = await _networkHelper.get(
          citiesApi,
        );
        if (response.statusCode == 200) {
          _citiesResponse = CitiesResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (_citiesResponse.code == 1) {
            for(int i = 0; i < _citiesResponse.result.length; i++){
              description.add(_citiesResponse.result[i].description);
            }
            isDataFetched = true;
            notifyListeners();
          }
          else {
            ApplicationToast.getErrorToast(durationTime: 3,
                heading: Strings.error,
                subHeading: _citiesResponse.message);
          }
        }
        else {
          ApplicationToast.getErrorToast(durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      }
    }
    catch(error){
      print(error.toString());
    }
  }

  Future onUploadLicenseImages({
    @required BuildContext context,
    @required List images,
  }) async {

    int userId = Constants.getUserId();
    List<MultipartFile> multipart = List<MultipartFile>();
    for (int i = 0; i < images.length; i++) {
      var path = await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
      multipart.add(await MultipartFile.fromFile(path, filename: path.split("/").last));
    }

    try {
      if(images.isNotEmpty){
        FormData formData = FormData.fromMap({
          "Image": multipart,
          "id": userId,
        });
        _loader.showLoader(context: context);
        Response _response = await _dio.post(
          uploadLicenseImages,
          data: formData,
          options: Options(
            contentType: "multipart/form-data",
            // headers: {'Authorization': ""}
          ),
        );
        if (_response.statusCode == 200) {
          _licenseImagesResponse = LicenseImagesResponse.fromJson(_response.data);
          if (_licenseImagesResponse.code == 1) {


            _loader.hideLoader(context);
            await Constants.setLicenseImages(_licenseImagesResponse.result);
            print('License Api success');
            print(_licenseImagesResponse.result[0].filePath);
            notifyListeners();
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: _licenseImagesResponse.message,
            );
          }
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (error) {
      print(error.toString());
    }
  }


  CitiesResponse getCitiesList(){
    return this._citiesResponse;
  }
}