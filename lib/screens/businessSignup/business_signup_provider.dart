import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/cities_response.dart';
import 'package:truckoom_shipper/models/api_models/common_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/utilities/utilities.dart';

class BusinessSignupProvider extends ChangeNotifier {
  BuildContext context;
  String devicedId;
  var connectivity;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  CommonResponse commonResponse = CommonResponse.empty();
  CitiesResponse citiesResponse = CitiesResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CustomPopup _loader = CustomPopup();

  int id;

  init({@required BuildContext context}) async {
    this.context = context;
    devicedId = "";
    connectivity = "";
    getCities(context: context);
  }

  Future getBusinessSignup({
    @required BuildContext context,
    @required String cell,
    @required String name,
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required int city,
    @required bool onCheck,
    @required String tag,
  }) async {
    try {
      devicedId = await PreferenceUtils.getString(Strings.deviceId);
      connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      }
      else if (name.isEmpty || name.length < 2) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.nameErrorText);
      }
      else if (email.validateEmail() == false) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.emailErrorText);
      }
      else if (cell.validatePhoneNumber() == false) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.passwordErrorText);
      }
      else if (confirmPassword.isEmpty || confirmPassword.length < 6) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.passwordErrorText);
      }
      else if (password != confirmPassword) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.passwordMatchErrorText);
      }
      else if (city.bitLength < 1) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.cityErrorText);
      }
      else if (onCheck == false) {
        ApplicationToast.getErrorToast(durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.checkBoxErrorText);
      }
      else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(
            businessSignUpStep1,
            headers: {
              "Content-Type": "application/json",
            },
            body: {
              "FullName": name,
              "Email": email,
              "Phone": cell,
              "Password": password,
              "DeviceId": devicedId,
              "CityId": city
            }
        );
        if (response.statusCode == 200) {
          commonResponse = CommonResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (commonResponse.code == 1) {
            id = commonResponse.result.user.userId;
            print(id);
            _loader.hideLoader(context);
            Navigator.push(context, SlideRightRoute(
                page: BusinessInformation(tag: tag, userId: id,)));
          }
          else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(durationTime: 3,
                heading: Strings.error,
                subHeading: commonResponse.message);
          }
        }
        else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (error) {
      _loader.hideLoader(context);
      print(error.toString());
      ApplicationToast.getErrorToast(durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.authorizationErrorText);
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
        _loader.showLoader(context: context);
       http.Response response = await _networkHelper.get(
         citiesApi,
       );
        if (response.statusCode == 200) {
          citiesResponse = CitiesResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (citiesResponse.code == 1) {
            _loader.hideLoader(context);
            print("Success");
            print(citiesResponse.result.length);

          }
          else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(durationTime: 3,
                heading: Strings.error,
                subHeading: commonResponse.message);
          }
        }
        else {
          _loader.hideLoader(context);
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
}
