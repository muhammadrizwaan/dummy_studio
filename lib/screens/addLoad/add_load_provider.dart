import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/estimated_rate_response.dart';
import 'package:truckoom_shipper/models/api_models/good_types_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/utilities/utilities.dart';

class AddLoadProvider extends ChangeNotifier {
  BuildContext context;

  var connectivityResult;
  String token;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GoodTypesResponse _goodTypesResponse = GoodTypesResponse.empty();
  EstimatedRateResponse _estimatedRateResponse = EstimatedRateResponse.empty();
  CustomPopup _laoder = CustomPopup();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  GetToken getToken = GetToken();
  List<String> description = List<String>();
  bool isDataFetched;

  init({@required BuildContext context}) async {
    isDataFetched = false;
    token = "";
    await _getGoodTypesApi();
    this.context = context;
  }

  GoodTypesResponse getGoodType() {
    return this._goodTypesResponse;
  }

  Future _getGoodTypesApi() async {
    try {
      token = await getToken.onToken();
      connectivityResult = Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else {
        http.Response response = await _networkHelper.get(getGoodTypeApi,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            });
        if (response.statusCode == 200) {
          _goodTypesResponse = GoodTypesResponse.fromJson(
              _genericDecodeEncode.decodeJson(response.body));
          if (_goodTypesResponse.code == 1) {
            for (int i = 0; i < _goodTypesResponse.result.length; i++) {
              description.add(_goodTypesResponse.result[i].description);
            }
            isDataFetched = true;
            notifyListeners();
          } else {
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _goodTypesResponse.message);
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

  Future onEstimatedRate({@required BuildContext context,
    DateTime pickupDateTime,
    String name,
    String phone,
    String weight,
    int vehicle,
    String description,
    bool isRoundTrip
  }) async{
    try {
      token = await getToken.onToken();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      }
      else if (name.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.nameErrorText);
      }
      else if (phone.validatePhoneNumber() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.phoneNumberErrorText);
      } else if (weight.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.weightErrorText);
      } else if (vehicle == null) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.noOfVehicleErrorText);
      }
     else {
        _laoder.showLoader(context: context);
        http.Response response = await _networkHelper.post(businessSignUpStep2, headers: {
          "Content-Type": "application/json",
          'Authorization': token
        }, body:
        {
          "PickupLocation": "Pindi Stop",
          "PickupLatitude": "31.4600457",
          "PickupLongitude": "74.3269687",
          "DropoffLocation": "DHA Phase 4",
          "DropoffLatitude": "31.4646271",
          "DropoffLongitude": "74.3873937",
          "VehicleCount": 2,
          "IsRoundTrip": isRoundTrip,
          "VehicleCategoryId": 2
        }
        );
      }
      } catch (error) {
      print(error.toString());
    }
  }
  }
