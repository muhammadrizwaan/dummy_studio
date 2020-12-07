
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class AcceptedProvider extends ChangeNotifier{
  BuildContext context;

  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  CustomPopup _loader = CustomPopup();

  var connectivityResult;
  var userId, statusId;
  init({@required BuildContext context}) async{
    this.context = context;
    connectivityResult = "";
    userId ="";
    statusId = 1;
  }

  Future getAcceptedLoad({@required BuildContext context}) async{
    try{
      connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        _loader.showLoader(context: context);
        String tempUrl = getLoadApi.replaceAll("{userId}", userId);
        String url = tempUrl.replaceAll("{statusId}", statusId);
        http.Response response = await _networkHelper.get(
          url,
        );

      }
    }
    catch(error){
      print(error.toString());
    }
  }
}