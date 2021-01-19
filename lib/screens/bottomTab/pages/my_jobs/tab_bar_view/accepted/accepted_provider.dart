import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
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
  int userId;
  String token;

  init({@required BuildContext context}) async {
    this.context = context;
    connectivityResult = "";
    token = "";
    refreshToken = "";
    await getAcceptedLoad(context: context);
  }

  Future getAcceptedLoad({@required BuildContext context}) async {
    try {
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await Constants.getUserId();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else {
        String tempUrl = getAcceptedLoadApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(tempUrl, headers: {
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

  Future onCancellLoad(
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
        userId = await Constants.getUserId();
        http.Response response = await _networkHelper.post(cancellLoadApi, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        },
          body: {
            "LoadId": loadId,
            "UserId": userId
          }
        );
        if (response.statusCode == 200) {
          await getAcceptedLoad(context: context);
          // tabbarResponse.result.add(value);
          // replytile.removeWhere((item) => item.id == '001')
          print('deleted');
          ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: "Operation performed Succesfully");
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
