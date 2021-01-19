
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/good_types_response.dart';
import 'package:truckoom_shipper/models/api_models/load_images_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/utilities/utilities.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';

class AddLoadProvider extends ChangeNotifier {
  BuildContext context;

  var connectivityResult;
  String token;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GoodTypesResponse _goodTypesResponse = GoodTypesResponse.empty();
  CustomPopup _loader = CustomPopup();
  Dio _dio = Dio();
  LoadImagesResponse loadImagesResponse = LoadImagesResponse.empty();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  GetToken getToken = GetToken();
  List<String> description = List<String>();
  bool isDataFetched;
  int userId;

  init({@required BuildContext context}) async {
    isDataFetched = false;
    token = "";
    description = [];
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

  Future onEstimatedRate(
      {@required BuildContext context,
      @required String pickupDateTime,
      @required String name,
      @required String phone,
      @required String weight,
      @required String numOfVehicle,
      @required String description,
      @required bool isRoundTrip,
      @required int goodTypeId,
      @required int vehicleTypeId,
      @required String pickupLatitude,
      @required String pickupLongitude,
      @required String dropoffLatitude,
      @required String dropoffLongitude,
      @required String pickupLocation,
      @required String dropoffLocation,
      @required int VehicleTypeId,
      @required int vehicleCategoryId,
      @required List imagesList,
      @required String Rate,
      @required int distance,
      }) async {
    try {
      token = await getToken.onToken();
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (name.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.nameErrorText);
      } else if (phone.validatePhoneNumber() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.phoneNumberErrorText);
      } else if (goodTypeId < 1) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.goodTypeErrorText);
      } else if (weight.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.weightErrorText);
      } else if (numOfVehicle.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.noOfVehicleErrorText);
      } else if (imagesList.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.imagesErrorText);
      } else {
        Navigator.push(
          context,
          SlideRightRoute(
            page: BookLoadDetails(
              name: name,
              phone: phone,
              weight: weight,
              numOfVehicle: numOfVehicle,
              description: description,
              isRoundTrip: isRoundTrip,
              pickUpDate: pickupDateTime,
              Rate: Rate,
              pickupLatitude: pickupLatitude,
              pickupLongitude: pickupLongitude,
              dropoffLatitude: dropoffLatitude,
              dropoffLongitude: dropoffLongitude,
              pickupLocation: pickupLocation,
              dropoffLocation: dropoffLocation,
              goodTypeId: goodTypeId,
              vehicleTypeId: vehicleTypeId,
              vehicleCategoryId: vehicleCategoryId,
              images: imagesList,
              Distance: distance
            ),
          ),
        );
      }
    } catch (error) {
      print(error.toString());
    }
  }

  onUploadImages({
    @required BuildContext context,
    @required List ImagesList,
  }) async {
    try {
      _loader.showLoader(context: context);
      userId = Constants.getUserId();
      FormData formData = FormData.fromMap({
        "Attachment": await MultipartFile.fromBytes(
          ImagesList,
          filename: 'some-file-name.jpg',
          contentType: MediaType(
            "image",
            "jpg",
          ),
        ),
        "userId": userId,
        "loadId": 10165,
      });
      Response _response = await _dio.post(
        uploadLoadImages,
        data: formData,
        options: Options(
            contentType: "multipart/form-data",
            headers: {'Authorization': token}),
      );
      if (_response.statusCode == 200) {
        loadImagesResponse = LoadImagesResponse.fromJson(_response.data);
        if (loadImagesResponse.code == 1) {
          print('images uploaded');
          print(loadImagesResponse.result[0].filePath);
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: loadImagesResponse.message);
        }
      } else {
        _loader.hideLoader(context);
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.somethingWentWrong);
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
