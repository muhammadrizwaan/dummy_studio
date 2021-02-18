import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/edit_profile_response.dart';
import 'package:truckoom_shipper/models/api_models/license_images_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/utilities/utilities.dart';
import 'package:http/http.dart' as http;

class BusinessInformationProvider extends ChangeNotifier {
  BuildContext context;
  File userImage;
  final picker = ImagePicker();
  String deviceId;
  double ms;
  double currentTime;
  bool _isImagesUploaded = false;
  var connectivityResult;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  EditProfileResponse _editProfileResponse = EditProfileResponse.empty();
  LicenseImagesResponse _licenseImagesResponse = LicenseImagesResponse.empty();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  CustomPopup _loader = CustomPopup();
  Dio _dio = Dio();


  init({@required BuildContext context}) async {
    this.context = context;
    deviceId = "";
    _isImagesUploaded = false;
  }


  Future getBusinessInformation({
    @required BuildContext context,
    @required String businessName,
    @required String phoneNumber,
    @required String trn,
    @required DateTime licenseExpiryDate,
    @required int userId,
    @required bool onCheck,
  }) async {
    try {

      deviceId = await PreferenceUtils.getString(Strings.deviceId);
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      }
      else if (businessName.isEmpty || businessName.length < 2) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.nameErrorText);
      }
      else if (phoneNumber.validatePhoneNumber() == false && phoneNumber.validateLandLineNumber() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.phoneNumberErrorText);
      } else if (trn.validateTRN() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.trnErrorText);
      } else if (Constants.getLicenseImages().length < 1) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.licenseImagesErrorText);
      }
      else if (onCheck == false) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.checkBoxErrorText,
        );
      } else {
        _loader.showLoader(context: context);
        http.Response response =
            await _networkHelper.post(businessSignUpStep2, headers: {
          "Content-Type": "application/json",
        }, body: {
          "CompanyName": businessName,
          "ContactNumber": phoneNumber,
          "TRN": trn,
          "LicenseExpiryDate": licenseExpiryDate.toString(),
          "UserId": userId
        });
        if (response.statusCode == 200) {
          _editProfileResponse = EditProfileResponse.fromJson(
              _genericDecodeEncode.decodeJson(response.body));
          if (_editProfileResponse.code == 1) {
            Constants.setCommpanyName(_editProfileResponse.result.companyInformation[0].companyName);
            Constants.setCommpanyPhone(_editProfileResponse.result.companyInformation[0].contactNumber);
            Constants.setCommpanyTrn(_editProfileResponse.result.companyInformation[0].trn);
            Constants.setLicenseExpiryDate(_editProfileResponse.result.companyInformation[0].licenseExpiryDate);
            _loader.hideLoader(context);
            ApplicationToast.getLoginSignupToast(
              context: context,
              text: Strings.signupSuccessful,
              onNavigate: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    SlideRightRoute(page: BottomTab()),
                    ModalRoute.withName(Routes.businessInformation));
              },
            );

          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _editProfileResponse.message,
            );
          }
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong,
          );
        }
      }
    } catch (error) {
      _loader.hideLoader(context);
      print(error.toString());
    }
  }

  Future onUploadLicenseImages({
    @required BuildContext context,
    @required List images,
    @required int userId,
  }) async {

      List<MultipartFile> multipart = List<MultipartFile>();
      for (int i = 0; i < images.length; i++) {
        final filePath = await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
        File tempFile = File(filePath);
        File compressedFile = await FlutterNativeImage.compressImage(tempFile.path,
          quality: 5,);
        multipart.add(await MultipartFile.fromFile(compressedFile.path, filename: compressedFile.path.split("/").last));
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
            await Constants.setLicenseImages(_licenseImagesResponse.result);
            _loader.hideLoader(context);
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

}
