
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/wallet_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:http/http.dart' as http;

class WalletProvider extends ChangeNotifier{
  BuildContext context;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  WalletResponse _walletResponse = WalletResponse.empty();
  GetToken _getToken = GetToken();
  bool isDataFetched = false;

  var connectivityResult;
  int userId;
  String token;
  init({@required BuildContext context}) async{
    this.context = context;
    isDataFetched = false;
    connectivityResult = "";
    token = "";
    await getWalletData(context: context);
  }

  Future getWalletData({@required BuildContext context}) async{
    try{
      // _loader.showLoader(context: context);
      token = await _getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await Constants.getUserId();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        print('token in api is');
        print(token);
        String tempUrl = getWalletApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _walletResponse = WalletResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_walletResponse.code == 1){
            print('wallet Api success');
            isDataFetched = true;
            // _loader.hideLoader(context);
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _walletResponse.message);
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

  WalletResponse getWallet(){
    return this._walletResponse;
  }

}