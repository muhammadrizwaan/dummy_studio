import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/vehicle_type_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class SelectVehicleProvider extends ChangeNotifier{
  BuildContext context;

  var connectivityResult;
  String token;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  VehicleTypeResponse _vehicleTypeResponse = VehicleTypeResponse.empty();
  CustomPopup _laoder = CustomPopup();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  GetToken getToken = GetToken();
  List<Result> _getResponse = List<Result>();
  List<String> description = List<String>();
  bool isDataFetched;

  init({@required BuildContext context}) async{
    isDataFetched = false;
    token = "";
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
            _getResponse = _vehicleTypeResponse.result;
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
}