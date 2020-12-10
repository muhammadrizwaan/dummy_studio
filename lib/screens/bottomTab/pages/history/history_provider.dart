import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/history_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class HistoryProvider extends ChangeNotifier{
  BuildContext context;
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  HistoryResponse historyResponse = HistoryResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken getToken = GetToken();
  bool isDataFetched = false;

  var connectivityResult;
  int userId;
  String token;
  init({@required BuildContext context}) async{
    this.context = context;
    connectivityResult = "";
    await getPlacedLoad(context: context);
    token = "";
  }

  Future getPlacedLoad({@required BuildContext context}) async{
    try{
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await PreferenceUtils.getInt(Strings.userId);
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getHistoryApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          historyResponse = HistoryResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
          if(historyResponse.code == 1){
            isDataFetched = true;
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: historyResponse.message);
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