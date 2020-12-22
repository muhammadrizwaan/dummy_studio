

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/driver_detail_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class DriverDetailProvider extends ChangeNotifier{
  BuildContext context;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  DriverDetailResponse driverDetailResponse = DriverDetailResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken _getToken = GetToken();
  bool isDataFetched = false;

  var connectivityResult;
  String token;
  init({@required BuildContext context, @required int driverId}) async{
    this.context = context;
    connectivityResult = "";
    token = "";
    await getDriverDetail(context: context, driverId: driverId);
  }

  Future getDriverDetail({@required BuildContext context, @required int driverId}) async{
    try{
      token = await _getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getDriverDetailApi.replaceAll("{driverId}", '$driverId');
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          driverDetailResponse = DriverDetailResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(driverDetailResponse.code == 1){
            print('Driver detail api success');
            isDataFetched = true;
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: driverDetailResponse.message);
          }
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.somethingWentWrong);
        }
      }
    }
    catch(error){
      print(error.toString());
    }
  }

}