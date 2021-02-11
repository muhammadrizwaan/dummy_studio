
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/reviews_response.dart';
import 'package:truckoom_shipper/models/api_models/tabbar_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class DispatchedProvider extends ChangeNotifier{
  BuildContext context;

  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  TabbarResponse tabbarResponse = TabbarResponse.empty();
  ReviewsResponse _reviewsResponse = ReviewsResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken getToken = GetToken();
  bool isDataFetched = false;

  var connectivityResult;
  int userId;
  String token;
  init({@required BuildContext context}) async{
    this.context = context;
    connectivityResult = "";
    token = "";
    await getDispatchLoad(context: context);
  }

  Future getDispatchLoad({@required BuildContext context}) async{
    try{
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      userId = await Constants.getUserId();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getDeliveredLoadApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          tabbarResponse = TabbarResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
          print('success 1');
          if(tabbarResponse.code == 1){
            isDataFetched = true;
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: tabbarResponse.message);
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

  Future onRatingAndReviews({@required BuildContext context,
    @required var score,
    @required int driverId,
    @required int loadId,
    @required String comment
  }) async {
    try {
      int userId = await Constants.getUserId();
      connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (score == 0.0) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.ratingErrorText);
      } else if (comment.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.reviewDescriptionErrorText);
      } else {
        _loader.showLoader(context: context);
        token = await getToken.onToken();
        http.Response response = await _networkHelper.post(saveRatingApi, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        }, body: {
          "Score": score,
          "UserId": driverId,
          "LoadId": loadId,
          "Comment": comment,
          "RatedBy": userId,
          "IsShipper":true
        });
        if (response.statusCode == 200) {
          _reviewsResponse = ReviewsResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (_reviewsResponse.code == 1) {
            _loader.hideLoader(context);
            print('reting success');

          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: _reviewsResponse.message,
            );
          }
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.somethingWentWrong,
          );
        }
      }
    } catch (error) {
      ApplicationToast.getErrorToast(
        durationTime: 3,
        heading: Strings.error,
        subHeading: Strings.somethingWentWrong,
      );
      _loader.hideLoader(context);
      print(error.toString());
    }
  }
}