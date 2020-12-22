
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttericon/meteocons_icons.dart';
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
import 'package:truckoom_shipper/models/api_models/individual_update_profile_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/utilities/utilities.dart';

class BusinessEditProfileProvider extends ChangeNotifier{
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  bool isDataFetched = false;
  EditProfileResponse _editProfileResponse = EditProfileResponse.empty();
  EditProfileResponse editProfileResponse = EditProfileResponse.empty();
  CitiesResponse _citiesResponse = CitiesResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
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
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = File(image.path);
      imagePath = userImage.path.split("/").last;

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
          editProfileResponse = EditProfileResponse.fromJson(_response.data);
          if (editProfileResponse.code == 1) {
            print('image uploaded');
            print(editProfileResponse.result.profilePicture);
            await PreferenceUtils.setString(Strings.userImageKey,
                editProfileResponse.result.profilePicture);
            isImagePicked = true;
            notifyListeners();
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: editProfileResponse.message);
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
      int userId = await Constants.getUserId();
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
      else if (city < 1) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.cityErrorText);
      }
      else {
        _loader.showLoader(context: context);
        token = await _getToken.onToken();
        phone = await PreferenceUtils.getString(Strings.userPhone);
        http.Response response = await _networkHelper.post(
          getUpdateUserInformationApi,
          headers: {"Content-Type": "application/json", 'Authorization': token},
          body: {
            "UserId": userId,
            "FullName": name,
            "Password": password,
            "DeviceId": deviceId,
            "CityId": city,
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
            await Constants.setUserEmail(_editProfileResponse.result.email);
            await Constants.setPassword(_editProfileResponse.result.password);
            await Constants.setUserName(_editProfileResponse.result.fullName);
            await Constants.setUserPhone(_editProfileResponse.result.phone);
            if(_editProfileResponse.result.companyInformations.isNotEmpty){
              await Constants.setCommpanyName(_editProfileResponse.result.companyInformations[0].companyName);
              await Constants.setCommpanyPhone(_editProfileResponse.result.companyInformations[0].contactNumber);
              await Constants.setCommpanyTrn(_editProfileResponse.result.companyInformations[0].trn);
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
      print('api');
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
  CitiesResponse getCitiesList(){
    return this._citiesResponse;
  }
}