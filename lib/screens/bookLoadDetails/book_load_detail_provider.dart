
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:http/http.dart' as http;

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/load_images_response.dart';
import 'package:truckoom_shipper/models/api_models/save_load_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';


class BookLoadDetailProvider extends ChangeNotifier {
  BuildContext context;
  var connectivityResult;
  int userId;
  String token;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  SaveLoadResponse _saveLoadResponse = SaveLoadResponse.empty();
  LoadImagesResponse _loadImagesResponse = LoadImagesResponse.empty();
  CustomPopup _loader = CustomPopup();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  GetToken _getToken = GetToken();
  BottomTabProvider _bottomTabProvider;
  Dio _dio = Dio();

  init({@required BuildContext context}) async {
    this.context = context;
    token = "";
    _bottomTabProvider = Provider.of<BottomTabProvider>(context, listen: false);
  }

  Future onSaveLoad({@required BuildContext context,
    @required String pickupLocation,
    @required String pickupLatitude,
    @required String pickupLongitude,
    @required String dropoffLocation,
    @required String dropoffLatitude,
    @required String dropoffLongitude,
    @required int vehicleTypeId,
    @required int vehicleCategoryId,
    @required String pickupDateTime,
    @required String receiverName,
    @required String receiverPhone,
    @required int goodTypeId,
    @required String weight,
    @required String noOfVehicles,
    @required String description,
    @required bool isRoundTrip,
    @ required List images,
    @required int distance
  }) async {
    try {
      token = await _getToken.onToken();
      userId = await Constants.getUserId();
      connectivityResult = Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else {
        _loader.showLoader(context: context);
        http.Response response =
        await _networkHelper.post(saveLoadApi, headers: {
          "Content-Type": "application/json",
          'Authorization': token
        }, body: {
          "CreatedBy": userId,
          "PickupLocation": pickupLocation,
          "PickupLatitude": pickupLatitude,
          "PickupLongitude": pickupLongitude,
          "DropoffLocation": dropoffLocation,
          "DropoffLatitude": dropoffLatitude,
          "DropoffLongitude": dropoffLongitude,
          "VehicleTypeId": vehicleTypeId,
          "VehicleCategoryId": vehicleCategoryId,
          "PickupDateTime": pickupDateTime.toString(),
          "ReceiverName": receiverName,
          "ReceiverPhone": receiverPhone,
          "GoodTypeId": goodTypeId,
          "Weight": weight,
          "NoOfVehicles": noOfVehicles,
          "Distance": distance,
          "Description": description,
          "IsRoundTrip": isRoundTrip
        });
        if (response.statusCode == 200) {
          _saveLoadResponse = SaveLoadResponse.fromJson(
              _genericDecodeEncode.decodeJson(response.body));
          if (_saveLoadResponse.code == 1) {
            print('Save Load Success');

            if(images.isNotEmpty){
            await onUploadLoadImages(
                context: context,
                images: images,
                loadId: _saveLoadResponse.result.loadId,
                userId: userId,
            );}
            else{
              Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: BottomTab()), ModalRoute.withName(Routes.bookLoadDetails));
            }
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: _saveLoadResponse.message);
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


  Future onUploadLoadImages({
    @required BuildContext context,
    @required List images,
    @required int loadId,
    @required int userId,
  }) async {
    List<MultipartFile> multipart = List<MultipartFile>();

    for (int i = 0; i < images.length; i++) {
      var path = await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
      multipart.add(await MultipartFile.fromFile(
          path, filename: path.split("/").last));
    }

      try {
        token = await _getToken.onToken();
        FormData formData = FormData.fromMap({
          "Attachment": multipart,
          "loadId": loadId,
          "userId": userId,
        });
        Response _response = await _dio.post(
          uploadLoadImages,
          data: formData,
          options: Options(
              contentType: "multipart/form-data",
              headers: {'Authorization': token}),
        );
        if (_response.statusCode == 200) {
          _loadImagesResponse = LoadImagesResponse.fromJson(_response.data);
          if (_loadImagesResponse.code == 1) {
            _loader.hideLoader(context);
            Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: BottomTab()), ModalRoute.withName(Routes.bookLoadDetails));
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: _loadImagesResponse.message,
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
      } catch (error) {
        print(error.toString());
      }
    }
  }


