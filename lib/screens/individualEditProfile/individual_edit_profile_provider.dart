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
import 'package:truckoom_shipper/models/api_models/edit_profile_response.dart';
import 'package:truckoom_shipper/models/api_models/individual_update_profile_response.dart';
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
  IndividualUpdateProfileResponse individualUpdateProfileResponse =
      IndividualUpdateProfileResponse.empty();
  EditProfileResponse editProfileResponse = EditProfileResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
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

  init(BuildContext context) async {
    this.context = context;
    deviceId = "";
    isImagePicked = false;
    imagePath = "";
    token = "";
    connectivity = "";
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

  Future individualUpdateProfile({
    @required BuildContext context,
    @required String name,
    @required String password,
    @required String confirmPassword,
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
            "DeviceId": deviceId
          },
        );
        if (response.statusCode == 200) {
          individualUpdateProfileResponse =
              IndividualUpdateProfileResponse.fromJson(
                  genericDecodeEncode.decodeJson(response.body));
          if (individualUpdateProfileResponse.code == 1) {
            await Constants.setUserEmail(individualUpdateProfileResponse.result.email);
            await Constants.setPassword(individualUpdateProfileResponse.result.password);
            await Constants.setUserName(individualUpdateProfileResponse.result.fullName);
            _loader.hideLoader(context);
            print('Updated user');
            Navigator.pushReplacement(
                context, SlideRightRoute(page: IndividualProfile()));
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: individualUpdateProfileResponse.message);
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
