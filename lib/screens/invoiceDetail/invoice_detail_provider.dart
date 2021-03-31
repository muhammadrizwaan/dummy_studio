
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/invoice_detail_response.dart';
import 'package:truckoom_shipper/models/api_models/invoice_download_response.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';


class InvoiceDetailProvider extends ChangeNotifier{
  BuildContext context;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  InvoiceDetailResponse invoiceDetailResponse = InvoiceDetailResponse.empty();
  InvoiceDownloadResponse invoiceDownloadResponse = InvoiceDownloadResponse.empty();
  CustomPopup _loader = CustomPopup();
  GetToken _getToken = GetToken();
  bool isDataFetched = false;
  bool isDataFetched2 = false;
  String fileLocation;

  var dio = Dio();
  var connectivityResult;
  String loadingDate,onTheWayDate, unLoadingDate, deliveredDate;
  int userId;
  String token;
  init({@required BuildContext context, @required int Id}) async{
    this.context = context;
    isDataFetched = false;
    isDataFetched2 = false;
    connectivityResult = "";
    token = "";
    fileLocation = "";
    loadingDate = onTheWayDate = unLoadingDate = deliveredDate = "";
    await getInvoiceDetail(context: context, Id: Id);
    getPermission();
  }

  void getPermission() async {
    print("getPermission");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  Future download2(String url, ) async {
    try {
      _loader.showLoader(context: context);
      String path = await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOWNLOADS);

      String fullPath = "$path/$fileLocation.pdf";
      //get pdf from link
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );

      //write in download folder
      File file = File(fullPath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      _loader.hideLoader(context);
      ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: Strings.invoiceDownload);
    }
    catch (e) {
      print("error is");
      print(e);
    }
  }
//progress bar
  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
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
            fileLocation = invoiceDetailResponse.result.invoiceId.toString();
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

  Future getInvoiceDownload({@required BuildContext context, @required int Id, @required int differentiate}) async{
    try{
      connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.internetConnectionError);
      }
      else{
        print('token in api is');
        //print(token);
        _loader.showLoader(context: context);

        String tempUrl = getInvoiceDownloadApi + '$Id';
        http.Response response = await _networkHelper.get(
            tempUrl,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token
            }
        );
        if(response.statusCode == 200){
          invoiceDownloadResponse = InvoiceDownloadResponse.fromJson(_genericDecodeEncode.decodeJson(response.body));
          if(invoiceDownloadResponse.code == 1){
            if (differentiate == 0) {
              download2(invoiceDownloadResponse.result.invoice);
            }
            else {
              //Share.text('$fileLocation', invoiceDownloadResponse.result.invoice, 'text/plain');
              var request = await HttpClient().getUrl(Uri.parse(invoiceDownloadResponse.result.invoice));
              var response = await request.close();
              Uint8List bytes = await consolidateHttpClientResponseBytes(response);
              await Share.file('Truckoom Invoice', '$fileLocation.pdf', bytes, 'file/pdf');
            }

            print(invoiceDownloadResponse.result.invoice);
            /*final taskId = await FlutterDownloader.enqueue(
              url: invoiceDownloadResponse.result.invoice,
              savedDir: 'the path of directory where you want to save downloaded files',
              showNotification: true, // show download progress in status bar (for Android)
              openFileFromNotification: true, // click on notification to open downloaded file (for Android)
            );*/
            print('Link Download');
            isDataFetched2 = true;
            _loader.hideLoader(context);
            //ApplicationToast.getSuccessToast(durationTime: 3, heading: Strings.success, subHeading: Strings.invoiceDownload);

            notifyListeners();
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: invoiceDownloadResponse.message);
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