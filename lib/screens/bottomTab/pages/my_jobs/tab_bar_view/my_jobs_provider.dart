

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/load_counts_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class MyJobsProvider extends ChangeNotifier{
  BuildContext context;

  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  LoadCountsResponse _loadCountsResponse = LoadCountsResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken _getToken = GetToken();
  bool isDataFetched = false;
  var connectivityResult;
  int userId;
  String token;

  init({@required BuildContext context}) async{
    this.context = context;
    await getLoadCounts(context: context);
  }

  Future getLoadCounts({@required BuildContext context}) async{
    try{
      token = await _getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await Constants.getUserId();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        // _loader.showLoader(context: context);
        String tempUrl = getLoadCountsApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _loadCountsResponse = LoadCountsResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_loadCountsResponse.code == 1){
            isDataFetched = true;
            // _loader.hideLoader(context);
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _loadCountsResponse.message);
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

  LoadCountsResponse onLoadCounts(){
    return this._loadCountsResponse;
  }
}