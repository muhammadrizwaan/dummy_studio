import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/cities_response.dart';
import 'package:truckoom_shipper/models/api_models/edit_profile_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:flutter/material.dart';


class IndividualEditProfileProvider extends ChangeNotifier {
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  EditProfileResponse editProfileResponse = EditProfileResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CitiesResponse citiesResponse = CitiesResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken _getToken = GetToken();
  final picker = ImagePicker();
  Dio _dio = Dio();
  File userImage;
  String imagePath;
  String deviceId, token;
  double ms;
  bool isImagePicked;
  double currentTime;
  var connectivity;
  bool isDataFetched = false;
  List<dynamic> cityList = List<dynamic>();

  init(BuildContext context) async {
    this.context = context;
    deviceId = "";
    isDataFetched = false;
    cityList = [];
    isImagePicked = false;
    imagePath = "";
    token = "";
    connectivity = "";
    await getCities(context: context);
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
          citiesResponse = CitiesResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (citiesResponse.code == 1) {
            for(int i = 0; i < citiesResponse.result.length - 1; i++){
              cityList.add(citiesResponse.result[i]);
            }
            isDataFetched = true;
            notifyListeners();
          }
          else {
            ApplicationToast.getErrorToast(durationTime: 3,
                heading: Strings.error,
                subHeading: citiesResponse.message);
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
    return this.citiesResponse;
  }

  Future onEditImage({@required BuildContext context}) async {
    int userId = await Constants.getUserId();
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = File(image.path);
      imagePath = userImage.path.split("/").last;

      try {
        token = await _getToken.onToken();
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
            Constants.setUserImage(editProfileResponse.result.profilePicture);
            isImagePicked = true;
            notifyListeners();
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: editProfileResponse.message,
            );
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

  Future individualUpdateProfile({
    @required BuildContext context,
    @required String name,
    @required String password,
    @required String confirmPassword,
    @required String cityId
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
      } else if (name.isEmpty || name.length < 2) {
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
      } else if (password != confirmPassword) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.passwordMatchErrorText,
        );
      } else {
        _loader.showLoader(context: context);
        token = await _getToken.onToken();
        http.Response response = await _networkHelper.post(
          getUpdateUserInformationApi,
          headers: {"Content-Type": "application/json", 'Authorization': token},
          body: {
            "UserId": userId,
            "FullName": name,
            "Password": password,
            "DeviceId": deviceId,
            "CityId": cityId
          },
        );
        if (response.statusCode == 200) {
          editProfileResponse =
              EditProfileResponse.fromJson(
                  genericDecodeEncode.decodeJson(response.body));
          if (editProfileResponse.code == 1) {
            await Constants.setUserEmail(editProfileResponse.result.email);
            await Constants.setPassword(editProfileResponse.result.password);
            await Constants.setUserName(editProfileResponse.result.fullName);
            Constants.setCityId(editProfileResponse.result.cityId);
            Constants.setCityName(editProfileResponse.result.cityName);
            _loader.hideLoader(context);
            print('Updated user');
            Navigator.pushReplacement(
                context, SlideRightRoute(page: IndividualProfile()));
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
      }
      print('api');
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}
