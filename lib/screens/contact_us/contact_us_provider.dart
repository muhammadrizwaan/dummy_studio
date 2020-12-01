import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/contact_us_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/utilities/utilities.dart';
import 'package:http/http.dart' as http;

class ContactUsProvider extends ChangeNotifier {
  BuildContext context;
  var connectivity;
  String token;
  ContactUsResponse contactUsResponse = ContactUsResponse.empty();
  TokenResponse tokenResponse = TokenResponse.empty();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CustomPopup _loader = CustomPopup();
  Dio dio = Dio();

  init({@required BuildContext context}) async {
    context = this.context;
    connectivity = "";
    token = "";
  }

  Future getContactUs({@required BuildContext context,
    @required String email,
    @required String message}) async {
    try {
      connectivity = await Connectivity().checkConnectivity();
      token = await onToken();
      print('token is :');
      print(token);
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (email.validateEmail() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.emailErrorText);
      } else if (message.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.messageErrorText);
      } else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(saveQuery, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        }, body: {
          "Subject": "System not working properly",
          "Email": email,
          "Message": message
        });
        if (response.statusCode == 200) {
          contactUsResponse = ContactUsResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (contactUsResponse.code == 1) {
            _loader.hideLoader(context);
            ApplicationToast.getSuccessToast(
                durationTime: 3,
                heading: Strings.success,
                subHeading: Strings.messageSentSuccessfully);
            Navigator.pop(context);
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: contactUsResponse.message);
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
      ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.somethingWentWrong);
      _loader.hideLoader(context);
      print(error.toString());
    }
  }

  Future<String> onToken() async {
      String refreshToken = "";
      token = await PreferenceUtils.getString(Strings.token);
      double previousTime = await PreferenceUtils.getDouble(Strings.tokenTime);

      double ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
      double currentTime = await (((ms / 1000) / 60).round()).toDouble();
      double time = currentTime - previousTime;

      if (time > 15.0) {
        refreshToken = await PreferenceUtils.getString(Strings.refreshToken);
        print('hello');
        print(refreshToken);

        try {
          var formData = Map<String, dynamic>();
          formData['grant_type'] = "refresh_token";
          formData['refresh_token'] = refreshToken;
          dio.options.contentType = Headers.formUrlEncodedContentType;
          Response response = await dio.post(
            tokenApi,
            data: formData,
            options: Options(
              contentType: Headers.formUrlEncodedContentType,
            ),
          );
         if (response.statusCode == 200) {
            tokenResponse = TokenResponse.fromJson(response.data);
            String tokenRes = tokenResponse.accessToken;
            print('refresh token');
            token = "Bearer $tokenRes";
            await PreferenceUtils.setString(
                Strings.token, token);
            await PreferenceUtils.setString(
                Strings.refreshToken, tokenResponse.refreshToken);
            ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
            currentTime = await (((ms / 1000) / 60).round()).toDouble();
            await PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
            print(token);
          }
         else{
           ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: "Unauthorized user");
         }
        } catch (e) {
          print(e.toString());
        }
      }

      return token;
  }
}