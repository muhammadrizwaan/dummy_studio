import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/estimated_rate_response.dart';
import 'package:truckoom_shipper/models/api_models/shipper_discount_response.dart';
import 'package:truckoom_shipper/models/api_models/vehicle_category_response.dart';
import 'package:truckoom_shipper/models/api_models/vehicle_type_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/addLoad/add_load.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class SelectVehicleProvider extends ChangeNotifier{
  BuildContext context;

  var connectivityResult;
  String token;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  VehicleTypeResponse _vehicleTypeResponse = VehicleTypeResponse.empty();
  VehicleCategoryResponse _vehicleCategoryResponse = VehicleCategoryResponse.empty();
  VehicleTypeResponse filteredResult = VehicleTypeResponse.empty();
  ShipperDiscountResponse _shipperDiscountResponse = ShipperDiscountResponse.empty();
  CustomPopup _laoder = CustomPopup();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  EstimatedRateResponse _estimatedRateResponse = EstimatedRateResponse.empty();
  GetToken getToken = GetToken();
  List<String> description = List<String>();
  double shipperDiscount = 0.0;
  int vehicleTypeId;
  bool isDataFetched;
  bool _isVehicleFetched = false;

  init({@required BuildContext context}) async{
    isDataFetched = false;
    shipperDiscount = 0.0;
    filteredResult =  VehicleTypeResponse.empty();
    token = "";
    description =[];
    await _getGoodTypesApi();
    await getShipperDiscount();
    this.context = context;
  }

  Future getShipperDiscount() async{
    try{
      token = await getToken.onToken();
      connectivityResult = Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        int userId = Constants.getUserId();
        String tempUrl = getShipperDiscountApi.replaceAll("{userId}", '$userId');
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _shipperDiscountResponse = ShipperDiscountResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_shipperDiscountResponse.code == 1){
            shipperDiscount = _shipperDiscountResponse.result.shipperDiscount;
            print('Shipper discont');
            print(_shipperDiscountResponse.result.shipperDiscount);
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _shipperDiscountResponse.message);
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

  Future _getGoodTypesApi() async{
    try{
      token = await getToken.onToken();
      connectivityResult = Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        http.Response response = await _networkHelper.get(
            getVehicleTypeApi,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _vehicleTypeResponse = VehicleTypeResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_vehicleTypeResponse.code == 1){
            vehicleTypeId = _vehicleTypeResponse.result[0].vehicleTypeId;
            await onGetCategory(context: context, vehicleId: vehicleTypeId);
            // _isVehicleFetched = true;
            isDataFetched = true;
            // notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _vehicleTypeResponse.message);
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

  VehicleTypeResponse getVehicleType(){
    return this._vehicleTypeResponse;
  }


  Future onGetCategory({@required BuildContext context, @required int vehicleId}) async{
    try{
      _vehicleCategoryResponse = VehicleCategoryResponse.empty();
      token = await getToken.onToken();
      connectivityResult = Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        // _laoder.showLoader(context: context);
        String url = getVehicleByVehicleId.replaceAll("{vehicleId}", '$vehicleId');
        http.Response response = await _networkHelper.get(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          _vehicleCategoryResponse = VehicleCategoryResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(_vehicleCategoryResponse.code == 1){
            print(_vehicleCategoryResponse.result.length);
            // _laoder.hideLoader(context);
            // isDataFetched = true;
            _isVehicleFetched = false;
            print('category api called');
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: _vehicleTypeResponse.message);
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

  Future onEstimatedRate({
    @required BuildContext context,
    @required String pickupLatitude,
    @required String pickupLongitude,
    @required String dropoffLatitude,
    @required String dropoffLongitude,
    @required String pickupLocation,
    @required String dropoffLocation,
    @required int VehicleTypeId,
    @required int vehicleCategoryId,
    @required int distance,
  }) async {
    try {
      token = await getToken.onToken();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (VehicleTypeId < 1) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.goodTypeErrorText);
      }
      else if (vehicleCategoryId < 1) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.goodTypeErrorText);
      }
      else {
        _laoder.showLoader(context: context);
        http.Response response =
        await _networkHelper.post(estimatedLoadPriceApi, headers: {
          "Content-Type": "application/json",
          'Authorization': token
        }, body: {
          // "PickupLocation": pickupLocation,
          // "PickupLatitude": pickupLatitude,
          // "PickupLongitude": pickupLongitude,
          // "DropoffLocation": dropoffLocation,
          // "DropoffLatitude": dropoffLatitude,
          // "DropoffLongitude": dropoffLongitude,
          "Distance": distance,
          "VehicleCount": 1,
          "IsRoundTrip": false,
          "VehicleCategoryId": vehicleCategoryId,
          "ShipperDiscount": shipperDiscount
        });
        if (response.statusCode == 200) {
          _estimatedRateResponse = EstimatedRateResponse.fromJson(
              _genericDecodeEncode.decodeJson(response.body));
          if (_estimatedRateResponse.code == 1) {
            _laoder.hideLoader(context);
            print('Estimated Rate Success');
            print(_estimatedRateResponse.result.shipperIndividualDiscount);
            Navigator.push(
                context,
                SlideRightRoute(
                    page: AddLoad(
                      Rate: _estimatedRateResponse.result.shipperCost,
                      PickupLatitude: pickupLatitude,
                      PickupLongitude: pickupLongitude,
                      DropoffLatitude: dropoffLatitude,
                      DropoffLongitude: dropoffLongitude,
                      PickupLocation: pickupLocation,
                      DropoffLocation: dropoffLocation,
                      VehicleTypeId: VehicleTypeId,
                      VehicleCategoryId: vehicleCategoryId,
                        multiplier: _estimatedRateResponse.result.roundTripMultiplier,
                      Distance: distance
                    )));
          } else {
            _laoder.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _estimatedRateResponse.message);
          }
        } else {
          _laoder.hideLoader(context);
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

  setFilteredList(){
    filteredResult.result.clear();
    for(final listData in _vehicleTypeResponse.result){
      filteredResult.result.add(listData);
    }
  }
  VehicleTypeResponse getRidesByUserIdResponse(){
    return this._vehicleTypeResponse;
  }

  bool stringContains (String searchIn, String searchFor) {
    searchIn = searchIn?.toLowerCase ();
    searchFor = searchFor?.toLowerCase ();
    if (searchIn.contains (searchFor)) {
      return true;
    }
    return false;
  }

  setVehicleTypeId(int id){
    vehicleTypeId = id;
  }

  setData(listData){
    filteredResult.result.add(listData);
    notifyListeners();
  }

  setIsDataLoaded({bool isVehicleFetched}){
    this._isVehicleFetched = isVehicleFetched;
  }

  VehicleTypeResponse  getFilteredList(){
    return this.filteredResult;
  }
  VehicleCategoryResponse  getCategoryResponse(){
    return this._vehicleCategoryResponse;
  }

  getIsVehicleFetched(){
    return this._isVehicleFetched;
  }

}