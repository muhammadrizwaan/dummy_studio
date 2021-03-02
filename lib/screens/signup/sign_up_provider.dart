import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/cities_response.dart';
import 'package:truckoom_shipper/models/api_models/common_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/utilities/utilities.dart';


class SignUpProvider extends ChangeNotifier {
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  CommonResponse commonResponse = CommonResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CitiesResponse citiesResponse = CitiesResponse.empty();
  CustomPopup _loader = CustomPopup();
  List<dynamic> cityList = List<dynamic>();
  String deviceId, tempToken;
  double ms;
  bool isDataFetched = false;
  double currentTime;
  var connectivity;

  init(BuildContext context) async {
    this.context = context;
    isDataFetched = false;
    cityList = [];
    deviceId = "";
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

  Future getIndividualSignUp({
    @required BuildContext context,
    @required String cell,
    @required String name,
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required bool onCheck,
    @required String cityId
  }) async {
    try {
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
      } else if (email.validateEmail() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.emailErrorText);
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
      } else if (cityId == null) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.cityErrorText,
        );

      }
      else if (onCheck == false) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.checkBoxErrorText,
        );

      }
      else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(
          individualSignUp,
          headers: {
            "Content-Type": "application/json",
          },
          body: {
            "FullName": name,
            "Email": email,
            "Phone": cell,
            "Password": password,
            "DeviceId": deviceId,
            "CityId": cityId
          },
        );
        if(response.statusCode == 200){
          commonResponse = CommonResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
          if(commonResponse.code == 1){
            print('cityid');
            print(commonResponse.result.user.cityId);
            Constants.setToken(commonResponse.result.token.accessToken);
            Constants.setUserEmail(commonResponse.result.user.email);
            Constants.setPassword(commonResponse.result.user.password);
            Constants.setUserId(commonResponse.result.user.userId);
            Constants.setUserName(commonResponse.result.user.fullName);
            Constants.setUserPhone(commonResponse.result.user.phone);
            Constants.setUser(Strings.indiviual);
            Constants.setCityId(commonResponse.result.user.cityId);
            Constants.setCityName(commonResponse.result.user.cityName);

            ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
            currentTime = await (((ms / 1000) / 60).round()).toDouble();
            await PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
            _loader.hideLoader(context);
            ApplicationToast.getLoginSignupToast(
              context: context,
              text: Strings.signupSuccessful,
              onNavigate: () {
                Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: BottomTab()), ModalRoute.withName(Routes.signup));
              },
            );
          }
          else{
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: commonResponse.message);
          }

        }
        else{
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.authorizationErrorText);
      print(e.toString());
    }
  }

}
