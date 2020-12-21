import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/tabbar_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class AcceptedProvider extends ChangeNotifier {
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();

  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  TabbarResponse tabbarResponse = TabbarResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken getToken = GetToken();
  bool isDataFetched = false;
  String refreshToken;
  TokenResponse tokenResponse = TokenResponse.empty();
  Dio dio = Dio();

  var connectivityResult;
  int userId, statusId;
  String token;

  init({@required BuildContext context}) async {
    this.context = context;
    statusId = 5;
    await getAcceptedLoad(context: context);
    connectivityResult = "";
    token = "";
    refreshToken = "";
  }

  // Future TestTokenApi() async{
  //   try {
  //     refreshToken = await PreferenceUtils.getString(Strings.refreshToken);
  //     var formData = Map<String, dynamic>();
  //     // formData['username'] = email;
  //     // formData['password'] = password;
  //     // formData['grant_type'] = "password";
  //     formData['grant_type'] = "refresh_token";
  //     formData['refresh_token'] = refreshToken;
  //     dio.options.contentType = Headers.formUrlEncodedContentType;
  //     Response response = await dio.post(
  //       tokenApi,
  //       data: formData,
  //       options: Options(
  //         contentType: Headers.formUrlEncodedContentType,
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       tokenResponse = TokenResponse.fromJson(response.data);
  //       String tokenRes = tokenResponse.accessToken;
  //
  //       print('refresh token');
  //       token = "Bearer $tokenRes";
  //       await PreferenceUtils.setString(Strings.token, token);
  //       await PreferenceUtils.setString(Strings.refreshToken, tokenResponse.refreshToken);
  //       // await PreferenceUtils.setString(Strings.refreshToken, tokenResponse.refreshToken);
  //       // ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
  //       // currentTime = await (((ms / 1000) / 60).round()).toDouble();
  //       // await PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
  //       print(token);
  //     }
  //     else{
  //       ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: "Unauthorized user");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future getAcceptedLoad({@required BuildContext context}) async {
    try {
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await PreferenceUtils.getInt(Strings.userId);
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else {
        String tempUrl = getLoadApi.replaceAll("{userId}", '$userId');
        String url = tempUrl.replaceAll("{statusId}", '$statusId');
        http.Response response = await _networkHelper.get(url, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        });
        if (response.statusCode == 200) {
          tabbarResponse = TabbarResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          print('success 1');
          if (tabbarResponse.code == 1) {
            isDataFetched = true;
            notifyListeners();
          } else {
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: tabbarResponse.message);
          }
        } else {
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

  Future onDeleteLoad(
      {@required BuildContext context, @required int loadId}) async {
    try {
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else {
        isDataFetched = false;
        notifyListeners();
        String tempUrl = deleteLoadApi.replaceAll("{loadId}", '$loadId');
        http.Response response = await _networkHelper.post(tempUrl, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        });
        if (response.statusCode == 200) {
          await getAcceptedLoad(context: context);
          print('deleted');
          isDataFetched = true;
          notifyListeners();
        } else {
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
