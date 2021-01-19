import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/contact_us_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/utilities/utilities.dart';
import 'package:http/http.dart' as http;

class ContactUsProvider extends ChangeNotifier {
  BuildContext context;
  var connectivity;
  String token, email;
  ContactUsResponse contactUsResponse = ContactUsResponse.empty();
  TokenResponse tokenResponse = TokenResponse.empty();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CustomPopup _loader = CustomPopup();
  Dio dio = Dio();
  GetToken getToken = GetToken();

  init({@required BuildContext context}) async {
    context = this.context;
    connectivity = "";
    token = "";
    email = "";
  }

  Future getContactUs({@required BuildContext context,
    @required String name,
    @required String message,
    @required int callbackStatus
  }) async {
    try {
      int userId = await Constants.getUserId();
      email = await Constants.getUserEmail();
      connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (name.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.subjectErrorText);
      } else if (message.isEmpty) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.messageErrorText);
      } else {
        _loader.showLoader(context: context);
        token = await getToken.onToken();
        http.Response response = await _networkHelper.post(saveQuery, headers: {
          'Content-Type': 'application/json',
          'Authorization': token
        }, body: {
          "Subject": name,
          "Email": email,
          "Message": message,
          "CreatedBy": userId,
          "IsCallback": callbackStatus
        });
        if (response.statusCode == 200) {
          contactUsResponse = ContactUsResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (contactUsResponse.code == 1) {
            _loader.hideLoader(context);
            ApplicationToast.onContactUsAlert(
              context: context,
              onPress: (){
                Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: BottomTab()), ModalRoute.withName(Routes.contactUs));
              },
            );

          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: contactUsResponse.message,
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