import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/common_response.dart';
import 'package:truckoom_shipper/models/api_models/edit_profile_response.dart';
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
import 'package:multipart_request/multipart_request.dart' as multipart;

class BusinessInformationProvider extends ChangeNotifier {
  BuildContext context;
  File userImage;
  final picker = ImagePicker();
  String deviceId;
  double ms;
  double currentTime;
  var connectivityResult;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  EditProfileResponse _editProfileResponse = EditProfileResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CustomPopup _loader = CustomPopup();


  init({@required BuildContext context}) async {
    this.context = context;
    deviceId = "";
  }

  Future getImage({@required BuildContext context}) async{
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = File(image.path);
      print(image);
      print(userImage);
    }else{
      print('No image selected');
    }

    notifyListeners();
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
      else if (phoneNumber.validatePhoneNumber() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.phoneNumberErrorText);
      } else if (trn.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.trnErrorText);
      } else if (onCheck == false) {
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
              genericDecodeEncode.decodeJson(response.body));
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
    } catch (error) {
      _loader.hideLoader(context);
      print(error.toString());
    }
  }
}
