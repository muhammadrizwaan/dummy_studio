import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
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
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  HistoryResponse historyResponse = HistoryResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken _getToken = GetToken();
  bool isDataFetched = false;
  bool isLoading = false;
  List<dynamic> histroyList = List<dynamic>();

  var connectivityResult;
  int userId;
  String token;
  init({@required BuildContext context, int page}) async{
    this.context = context;
    connectivityResult = "";
    token = "";
    isLoading = false;
    histroyList = [];
    await getPlacedLoad(context: context, pageNumber: page );
  }

  Future getPlacedLoad({@required BuildContext context, @required int pageNumber}) async{
    try{
      // if(pageNumber > 0 && histroyList.isNotEmpty){
      //   isLoading = true;
      // }
      token = await _getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await Constants.getUserId();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        print('token in api is');
        print(token);
        String tempUrl = getHistoryApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl+pageNumber.toString(),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          historyResponse = HistoryResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(historyResponse.code == 1){
            print('success');
            if(pageNumber == 0 || histroyList.isEmpty){
              histroyList = historyResponse.result;
            }
            else{
              histroyList.addAll(historyResponse.result);
              isLoading = false;
            }
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

  setIsLoading(bool loading){
    return isLoading = loading;
  }

}