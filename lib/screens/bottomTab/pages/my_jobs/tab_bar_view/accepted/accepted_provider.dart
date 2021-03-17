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
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/widgets/loader.dart';

class AcceptedProvider extends ChangeNotifier {
  BuildContext context;

  MyJobsProvider _myJobsProvider;
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  LoadsResponse _loadsResponse = LoadsResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken getToken = GetToken();
  var connectivityResult;
  int userId;
  String token;
  bool isLoading = false;

  init({@required BuildContext context}) async {
    this.context = context;
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    connectivityResult = "";
    isLoading = false;
    token = "";
  }

  Future getAcceptedLoad({@required BuildContext context, @required int pageNumber}) async {
    try {
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await Constants.getUserId();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else {
        String tempUrl = getAcceptedLoadApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl+pageNumber.toString(),
            headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        });
        if (response.statusCode == 200) {
          _loadsResponse = LoadsResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (_loadsResponse.code == 1) {
            _myJobsProvider.acceptedList.addAll(_loadsResponse.result.accepted);
            isLoading = false;
            notifyListeners();
          } else {
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _loadsResponse.message);
          }
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

  Future onCancellLoad(
      {@required BuildContext context,
        @required int loadId,
        @required String reason,
      }) async {
    try {
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
        userId = await Constants.getUserId();
        http.Response response = await _networkHelper.post(cancellLoadApi, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        },
          body: {
            "LoadId": loadId,
            "UserId": userId,
            "Reason": reason
          }
        );
        if (response.statusCode == 200) {
          _loadsResponse = LoadsResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
          if(_loadsResponse.code == 1){
            _myJobsProvider.placedList = _loadsResponse.result.placed;
            _myJobsProvider.acceptedList = _loadsResponse.result.accepted;
            _myJobsProvider.inProcessList = _loadsResponse.result.inProcess;
            _myJobsProvider.cancelledList = _loadsResponse.result.cancelled;
            _myJobsProvider.deliveredList = _loadsResponse.result.delivered;
            _myJobsProvider.placedCount =_loadsResponse.result.counts.placed;
            _myJobsProvider.acceptedCount =_loadsResponse.result.counts.accepted;
            _myJobsProvider.inProcessCount =_loadsResponse.result.counts.inProcess;
            _myJobsProvider.cancelledCount =_loadsResponse.result.counts.cancelled;
            _myJobsProvider.deliveredCount =_loadsResponse.result.counts.delivered;
            _loader.hideLoader(context);
            notifyListeners();
            Navigator.of(context).pop();
            ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: _loadsResponse.message);
          }
        } else {
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong,
          );
        }
      }
    } catch (error) {
      print(error.toString());
    }
  }

  setIsLoading(bool loading){
    return isLoading = loading;
  }
}
