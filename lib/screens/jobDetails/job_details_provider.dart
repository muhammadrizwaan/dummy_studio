

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/load_detail_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/widgets/loader.dart';

class JobDetailsProvider extends ChangeNotifier{
  BuildContext context;

  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  LoadDetailResponse loadDetailResponse = LoadDetailResponse.empty();
  PlacedProvider _placedProvider;
  CustomPopup _loader = CustomPopup();
  GetToken getToken = GetToken();
  bool isDataFetched = false;

  var connectivityResult;
  int userId;
  String token;
  init({@required BuildContext context, @required int loadId}) async{
    this.context = context;
    connectivityResult = "";
    isDataFetched = false;
    token = "";
    _placedProvider = Provider.of<PlacedProvider>(context, listen: false);
    await getLoadDetail(context: context, loadId: loadId);
  }

  Future getLoadDetail({@required BuildContext context, @required int loadId}) async{
    try{
      int userId = Constants.getUserId();
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getLoadDetailApi.replaceAll("{loadId}", '$loadId');
        String url = tempUrl.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          loadDetailResponse = LoadDetailResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(loadDetailResponse.code == 1){
            isDataFetched = true;
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: loadDetailResponse.message);
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

  Future onDeleteLoad(
      {@required BuildContext context,
        @required int loadId,
        @required String reason,
      }) async {
    try {
      int userId = Constants.getUserId();
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (reason.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.pleaseEnterReasonText);
      }
      else {
        _loader.showLoader(context: context);

        http.Response response = await _networkHelper.post(deleteLoadApi, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        },
          body: {
            "LoadId":loadId,
            "DoneBy":userId,
            "Remarks":reason
          }
        );
        if (response.statusCode == 200) {
          print('deleted load');
          notifyListeners();
          _loader.hideLoader(context);
          // Navigator.pop(context);
          Navigator.pushReplacement(context, SlideRightRoute(page: BottomTab()));
          ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: "Operation performed Succesfully");
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