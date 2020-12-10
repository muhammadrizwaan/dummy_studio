
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class BookLoadDetailProvider extends ChangeNotifier{
  BuildContext context;

  // GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  // NetworkHelper _networkHelper = NetworkHelperImpl();
  // LoadDetailResponse _loadDetailResponse = LoadDetailResponse.empty();
  // CustomPopup _loader = CustomPopup();
  // GetToken getToken = GetToken();
  // bool isDataFetched = false;
  //
  // var connectivityResult;
  // int userId;
  // String token;
  // init({@required BuildContext context}) async{
  //   this.context = context;
  //   connectivityResult = "";
  //   token = "";
  // }
  //
  // Future getLoadDetail({@required BuildContext context, @required int loadId}) async{
  //   try{
  //     token = await getToken.onToken();
  //     connectivityResult = await Connectivity().checkConnectivity();
  //     if(connectivityResult == ConnectivityResult.none){
  //       ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
  //     }
  //     else{
  //       String tempUrl = getLoadDetailApi.replaceAll("{loadId}", '$loadId');
  //       http.Response response = await _networkHelper.get(
  //           tempUrl,
  //           headers: {
  //             'Content-Type': 'application/json',
  //             'Authorization': token
  //           }
  //       );
  //       if(response.statusCode == 200){
  //         _loadDetailResponse = LoadDetailResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
  //         if(_loadDetailResponse.code == 1){
  //           isDataFetched = true;
  //           notifyListeners();
  //         }
  //         else{
  //           ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _loadDetailResponse.message);
  //         }
  //       }
  //       else{
  //         ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.somethingWentWrong);
  //       }
  //     }
  //   }
  //   catch(error){
  //     print(error.toString());
  //   }
  // }

}