import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/common_response.dart';
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
  NetworkHelper _networkHelper = NetworkHelperImpl();
  CommonResponse commonResponse = CommonResponse.empty();
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
    @required String licenseExpiryDate,
    @required int userId,
    @required String tag,
    @required bool onCheck,
  }) async {
    try {
      deviceId = await PreferenceUtils.getString(Strings.deviceId);
      if (businessName.isEmpty || businessName.length < 2) {
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
      } else if (phoneNumber.validatePhoneNumber() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.phoneNumberErrorText);
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
          "LicenseExpiryDate": licenseExpiryDate,
          "UserId": userId
        });
        if (response.statusCode == 200) {
          commonResponse = CommonResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (commonResponse.code == 1) {
            String res = commonResponse.result.token.accessToken;
            String data = "Bearer $res";
            await PreferenceUtils.setString(Strings.token, data);
            await PreferenceUtils.setString(Strings.refreshToken, commonResponse.result.token.refreshToken);
            await PreferenceUtils.setString(Strings.email, commonResponse.result.user.email);
            await PreferenceUtils.setString(Strings.password, commonResponse.result.user.password);
            ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
            currentTime = await (((ms / 1000) / 60).round()).toDouble();
            await PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
            _loader.hideLoader(context);
            ApplicationToast.getLoginSignupToast(
              context: context,
              text: Strings.signupSuccessful,
              onNavigate: () {
                // Navigator.push(context, SlideRightRoute(page: BottomTab(tag: Strings.business,)));
                Navigator.pushAndRemoveUntil(
                    context,
                    SlideRightRoute(page: BottomTab(tag: Strings.business)),
                    ModalRoute.withName(Routes.businessInformation));
              },
            );
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: commonResponse.message);
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
