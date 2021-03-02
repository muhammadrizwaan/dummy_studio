

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/loads_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:http/http.dart' as http;

class MyJobsProvider extends ChangeNotifier{
  BuildContext context;

  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  LoadsResponse _loadsResponse = LoadsResponse.empty();
  GetToken _getToken = GetToken();
  bool isDataFetched = false;
  List<dynamic> placedList = List<dynamic>();
  List<dynamic> acceptedList = List<dynamic>();
  List<dynamic> inProcessList = List<dynamic>();
  List<dynamic> cancelledList = List<dynamic>();
  List<dynamic> deliveredList = List<dynamic>();
  int placedCount, acceptedCount, inProcessCount, cancelledCount, deliveredCount;
  var connectivityResult;
  int userId;
  String token;

  init({@required BuildContext context}) async{
    this.context = context;
    await getLoads(context: context);
  }

  Future getLoads({@required BuildContext context}) async{
    try{
      token = await _getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await Constants.getUserId();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getLoadsApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _loadsResponse = LoadsResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_loadsResponse.code == 1){
            placedList = _loadsResponse.result.placed;
            acceptedList = _loadsResponse.result.accepted;
            inProcessList = _loadsResponse.result.inProcess;
            cancelledList = _loadsResponse.result.cancelled;
            deliveredList = _loadsResponse.result.delivered;
            placedCount =_loadsResponse.result.counts.placed;
            acceptedCount =_loadsResponse.result.counts.accepted;
            inProcessCount =_loadsResponse.result.counts.inProcess;
            cancelledCount =_loadsResponse.result.counts.cancelled;
            deliveredCount =_loadsResponse.result.counts.delivered;
            isDataFetched = true;
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _loadsResponse.message);
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