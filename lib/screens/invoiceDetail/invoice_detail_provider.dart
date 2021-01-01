
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/driver_detail_response.dart';
import 'package:truckoom_shipper/models/api_models/invoice_detail_response.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:http/http.dart' as http;

class InvoiceDetailProvider extends ChangeNotifier{
  BuildContext context;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  InvoiceDetailResponse invoiceDetailResponse = InvoiceDetailResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken _getToken = GetToken();
  bool isDataFetched = false;

  var connectivityResult;
  String loadingDate,onTheWayDate, unLoadingDate, deliveredDate;
  int userId;
  String token;
  init({@required BuildContext context, @required int Id}) async{
    this.context = context;
    connectivityResult = "";
    token = "";
    loadingDate = onTheWayDate = unLoadingDate = deliveredDate = "";
    await getInvoiceDetail(context: context, Id: Id);
  }

  Future getInvoiceDetail({@required BuildContext context, @required int Id}) async{
    try{
      token = await _getToken.onToken();
      connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        String tempUrl = getInvoiceDetailApi.replaceAll("{Id}", '$Id');
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          invoiceDetailResponse = InvoiceDetailResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(invoiceDetailResponse.code == 1){
            if(invoiceDetailResponse.result.loadStatus.length > 0){
            for(int i = 0; i < invoiceDetailResponse.result.loadStatus.length; i++){
              if(invoiceDetailResponse.result.loadStatus[i].loadStatusId == 8){
                loadingDate = invoiceDetailResponse.result.loadStatus[i].date;
              }
              if(invoiceDetailResponse.result.loadStatus[i].loadStatusId == 9){
                onTheWayDate = invoiceDetailResponse.result.loadStatus[i].date;
              }
              if(invoiceDetailResponse.result.loadStatus[i].loadStatusId == 10){
                unLoadingDate = invoiceDetailResponse.result.loadStatus[i].date;
              }
              if(invoiceDetailResponse.result.loadStatus[i].loadStatusId == 11){
                deliveredDate = invoiceDetailResponse.result.loadStatus[i].date;
              }
            }
            }
            print('Invoice detail api success');
            isDataFetched = true;
            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: invoiceDetailResponse.message);
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

}