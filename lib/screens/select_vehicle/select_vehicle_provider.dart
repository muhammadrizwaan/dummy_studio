import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/estimated_rate_response.dart';
import 'package:truckoom_shipper/models/api_models/vehicle_by_vehicle_id_response.dart';
import 'package:truckoom_shipper/models/api_models/vehicle_category_response.dart';
import 'package:truckoom_shipper/models/api_models/vehicle_type_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/addLoad/add_load.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_details.dart';
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
  VehicleCategoryResponse filteredResult = VehicleCategoryResponse.empty();
  CustomPopup _laoder = CustomPopup();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  EstimatedRateResponse _estimatedRateResponse = EstimatedRateResponse.empty();
  GetToken getToken = GetToken();
  List<String> description = List<String>();
  // List<dynamic> data = List<dynamic>();

  bool isDataFetched;
  bool _isVehicleFetched = false;

  init({@required BuildContext context}) async{
    isDataFetched = false;
    filteredResult =  VehicleCategoryResponse.empty();
    token = "";
    // data = [];
    description =[];
    await _getGoodTypesApi();
    this.context = context;
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
            for(int i = 0; i < _vehicleTypeResponse.result.length; i++){
              description.add(_vehicleTypeResponse.result[i].description);
            }
            isDataFetched = true;
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

  VehicleTypeResponse getVehicleType(){
    return this._vehicleTypeResponse;
  }


  Future onGetVehicleById({@required BuildContext context, @required int vehicleId}) async{
    try{
      token = await getToken.onToken();
      connectivityResult = Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        _laoder.showLoader(context: context);
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
            _laoder.hideLoader(context);
            // data = _vehicleCategoryResponse.result;
            for(final data in _vehicleCategoryResponse.result){
              filteredResult.result.add(data);
            }
            _isVehicleFetched = true;
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
          "PickupLocation": pickupLocation,
          "PickupLatitude": pickupLatitude,
          "PickupLongitude": pickupLongitude,
          "DropoffLocation": dropoffLocation,
          "DropoffLatitude": dropoffLatitude,
          "DropoffLongitude": dropoffLongitude,
          "VehicleCount": 1,
          "IsRoundTrip": false,
          "VehicleCategoryId": vehicleCategoryId
        });
        if (response.statusCode == 200) {
          _estimatedRateResponse = EstimatedRateResponse.fromJson(
              _genericDecodeEncode.decodeJson(response.body));
          if (_estimatedRateResponse.code == 1) {
            _laoder.hideLoader(context);
            print('Estimated Rate Success');
            Navigator.push(
                context,
                SlideRightRoute(
                    page: AddLoad(
                      Rate: _estimatedRateResponse.result.totalCost,
                      PickupLatitude: pickupLatitude,
                      PickupLongitude: pickupLongitude,
                      DropoffLatitude: dropoffLatitude,
                      DropoffLongitude: dropoffLongitude,
                      PickupLocation: pickupLocation,
                      DropoffLocation: dropoffLocation,
                      VehicleTypeId: VehicleTypeId,
                      VehicleCategoryId: vehicleCategoryId,
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
    for(final listData in _vehicleCategoryResponse.result){
      filteredResult.result.add(listData);
    }
  }
  VehicleCategoryResponse getRidesByUserIdResponse(){
    return this._vehicleCategoryResponse;
  }

  bool stringContains (String searchIn, String searchFor) {
    searchIn = searchIn?.toLowerCase ();
    searchFor = searchFor?.toLowerCase ();
    if (searchIn.contains (searchFor)) {
      return true;
    }
    return false;
  }

  setData(listData){
    filteredResult.result.add(listData);
    notifyListeners();
  }

  setIsDataLoaded({bool isVehicleFetched}){
    this._isVehicleFetched = isVehicleFetched;
  }

  VehicleCategoryResponse  getFilteredList(){
    return this.filteredResult;
  }

  getIsVehicleFetched(){
    return this._isVehicleFetched;
  }

}