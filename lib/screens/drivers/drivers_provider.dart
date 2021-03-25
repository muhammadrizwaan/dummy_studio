

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/drivers_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class DriversProvider extends ChangeNotifier{
  BuildContext context;

  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  DriversResponse _driversResponse = DriversResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken _getToken = GetToken();
  var connectivityResult;
  bool isDataFetched = false;
  int userId;
  String token;

  init({@required BuildContext context, @required int loadId}) async{
    this.context = context;
    connectivityResult = "";
    isDataFetched = false;
    token = "";
    await getDrivers(loadId);
  }

  Future getDrivers(int loadId) async{
    try{
      int userId = Constants.getUserId();
      connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getDriversApi.replaceAll("{loadId}", '$loadId');
        String url = tempUrl.replaceAll("{userId}", '$userId');
        token = await _getToken.onToken();
        http.Response response = await _networkHelper.get(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _driversResponse = DriversResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_driversResponse.code == 1){
            isDataFetched = true;
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _driversResponse.message);
          }
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.somethingWentWrong);
        }
      }

    }catch(error){
      print(error.toString());
    }
  }

  DriversResponse getDriverList(){
    return this._driversResponse;
  }
}