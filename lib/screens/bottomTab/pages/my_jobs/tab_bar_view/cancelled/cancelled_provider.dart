
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/loads_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;
class CancelledProvider extends ChangeNotifier{
  BuildContext context;

  MyJobsProvider _myJobsProvider;
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  LoadsResponse _loadsResponse = LoadsResponse.empty();
  GetToken getToken = GetToken();
  bool isLoading = false;
  var connectivityResult;
  int userId;
  String token;

  init({@required BuildContext context}) async{
    this.context = context;
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    connectivityResult = "";
    token = "";
  }

  Future getCancelledLoad({@required BuildContext context, @required int pageNumber}) async{
    try{
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await Constants.getUserId();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getCancelledLoadApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl+pageNumber.toString(),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _loadsResponse = LoadsResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
          if(_loadsResponse.code == 1){
            _myJobsProvider.cancelledList.addAll(_loadsResponse.result.cancelled);
            isLoading = false;
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
  setIsLoading(bool loading){
    return isLoading = loading;
  }
}