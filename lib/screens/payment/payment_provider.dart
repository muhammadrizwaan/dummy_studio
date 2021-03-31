import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/coupon_code_response.dart';
import 'package:truckoom_shipper/models/api_models/load_cost_response.dart';
import 'package:truckoom_shipper/models/api_models/loads_response.dart';
import 'package:truckoom_shipper/models/api_models/status_update_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class PaymentProvider extends ChangeNotifier {
  BuildContext context;

  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  CouponCodeResponse _couponCodeResponse = CouponCodeResponse.empty();
  LoadCostResponse _loadCostResponse = LoadCostResponse.empty();
  LoadsResponse _loadsResponse = LoadsResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken getToken = GetToken();
  bool isDataFetched = false;

  var connectivityResult;
  int couponId;
  double shiperCost, newShipperCost, couponDiscount, vatAmount, totalPrice;
  String token;

  init({@required BuildContext context, @required int LoadId}) async {
    this.context = context;
    isDataFetched = false;
    connectivityResult = "";
    token = "";
    couponId = 0;
    shiperCost = newShipperCost = couponDiscount = vatAmount = totalPrice = 0;
    await getLoadCost(context: context, loadId: LoadId);
  }

  Future getLoadCost({@required BuildContext context, @required int loadId}) async{
    try{
      int userId = Constants.getUserId();
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getLoadCostApi.replaceAll("{loadId}", '$loadId');
        String url = tempUrl.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _loadCostResponse = LoadCostResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_loadCostResponse.code == 1){
            newShipperCost = _loadCostResponse.result.finalCost;
            totalPrice = _loadCostResponse.result.finalCost;
            couponDiscount = _loadCostResponse.result.couponDiscount;
            vatAmount = _loadCostResponse.result.valueAddedTax;
            // shiperCost = _loadCostResponse.result.finalCost;
            isDataFetched = true;
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _loadCostResponse.message);
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

  LoadCostResponse getLoadCostData(){
    return _loadCostResponse;
  }

  Future getApplyCoupon(
      {@required BuildContext context,
      @required int loadId,
      @required String couponCode}) async {
    try {
      token = await getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else {
        String tempUrl = getApplyCouponApi.replaceAll("{loadId}", '$loadId');
        String url = tempUrl.replaceAll("{CouponCode}", '$couponCode');
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.get(url, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        });
        if (response.statusCode == 200) {
          _couponCodeResponse = CouponCodeResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if (_couponCodeResponse.code == 1) {
            couponId = _couponCodeResponse.result.couponId;
            shiperCost = _couponCodeResponse.result.newFinalCost;
            newShipperCost = _couponCodeResponse.result.newShipperCost;
            totalPrice = _couponCodeResponse.result.newFinalCost;
            couponDiscount = _couponCodeResponse.result.discountAmount;
            vatAmount = _couponCodeResponse.result.vatAmount;
            notifyListeners();
            _loader.hideLoader(context);
            ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: "Operation performed Succesfully");
            Navigator.of(context).pop();
            notifyListeners();
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _couponCodeResponse.message,
            );
          }
        } else {
          _loader.hideLoader(context);
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

  Future onAcceptedByShipper({
    @required BuildContext context,
    @required int loadId,
  }) async {
    try {
      print('prices');
      print(couponId);
      print(shiperCost);
      token = await getToken.onToken();
      int userId = await Constants.getUserId();
      connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(
          acceptedByShipperApi,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: {
            "LoadId": loadId,
            "UserId": userId,
            "CouponId": couponId, // send as zero if no coupon applied, / get coupon id from apply coupon response
            "PaymentMethodId": 2,
            "AmountPaid": newShipperCost.toString(), // send as zero if no coupon was applied / get new shipper cost from apply coupon response
            "TransactionNumber": "a6a8t82138762138gas2",
            "Status": "200",
            "Response": "Captured"
          }
          // {
          //   "LoadStatus": {
          //     "LoadId": loadId,
          //     "UserId": userId,
          //     "CouponId": couponId,
          //     "NewShipperCost": shiperCost
          //   },
          //   "Payment": {
          //     "Status": "200",
          //     "Response": "Ok"
          //   }
          // }
        );
        if (response.statusCode == 200) {
          _loadsResponse = LoadsResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_loadsResponse.code == 1){
            print('Accepted load');
            notifyListeners();
            _loader.hideLoader(context);
            _alertDialogueContainer();
          }
          else{
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _loadsResponse.message,
            );
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

  _alertDialogueContainer() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.12,
                        right: AppSizes.width * 0.12,
                        top: AppSizes.width * 0.07,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.08,
                      ),
                      height: AppSizes.height * 0.22,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: AppSizes.width*0.03, right: AppSizes.width*0.03),
                            child: Text(
                              "Your Payment is Successfully Done",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.colorBlack,
                                fontFamily: Assets.poppinsMedium,),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              hideLoader(context);
                              Navigator.pushNamedAndRemoveUntil(context, Routes.bottomTab, (r) => false);
                              // hideLoader(context);
                            },
                            child: Text(
                              "Tap to Continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 12,
                                color: AppColors.yellow,
                                fontFamily: Assets.poppinsRegular,
                              ),
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.425),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                        Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Icons.payment,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),)
              ,
            );
          },
        )
      },
    };
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
