
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_provider.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import '../../../../animations/slide_right.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../res/strings.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../wallet/wallet.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class BookLoad extends StatefulWidget {

  @override
  _BookLoadState createState() => _BookLoadState();
}

class _BookLoadState extends State<BookLoad> {
  GoogleMapController mapController;
  // var location = Location();
  LatLng _center = LatLng(30.3753, 69.3451);
  BookLoadComponents _bookLoadComponents;
  BookLoadProvider _bookLoadProvider;
  int _value = 1;
  bool isPickUp, isDropOff;
  int count;
  String pickupText, dropoffText;

  // String pickup_latitude = "31.5387449";
  // String pickup_longitude = "74.3336802";
  // String dropoff_latitude = "31.5387449";
  // String dropoff_longitude = "31.5387449";
  // String pickup_location = "DHA phase 4";
  // String dropoff_location = "Gulberg";
  GoogleMapsPlaces _places = GoogleMapsPlaces();
  String _apiKey = "AIzaSyDTLiSzdkVV8xrO9an282diUlBFMshCwAI";
  String pickup_latitude;
  String pickup_longitude;
  String dropoff_latitude;
  String dropoff_longitude;
  String pickup_location ;
  String dropoff_location;

  Future<Null> onDisplayPrediction(Prediction p,{@required bool isDeparture}) async{
    if (isDeparture) {
      //selected city is departure/from city
      if (p != null) {
        PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);

        var placeId = p.placeId;
        double lat = detail.result?.geometry?.location?.lat;
        double lng = detail.result?.geometry?.location?.lng;

        var address = await Geocoder.local.findAddressesFromQuery(p.description);
        // this.pickup_location = address.first.locality ?? address.first.addressLine;
        // this.pickup_latitude = lat.toString();
        // this.pickup_longitude = lng.toString();
        print('pickup location');
        print(address);
        setState(() {
          pickupText = address.first.addressLine;
          pickup_location = address.first.addressLine;
          pickup_latitude = lat.toString();
          pickup_longitude = lng.toString();
          isPickUp = true;
        });
      } else {
        print("pridiction is null");
      }
    } else {
      //selected city is destination/to city
      if (p != null) {
        PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId);

        var placeId = p.placeId;
        double lat = detail.result.geometry.location.lat;
        double lng = detail.result.geometry.location.lng;

        var address = await Geocoder.local.findAddressesFromQuery(p.description);
        // this.dropoff_location = address.first.locality ?? address.first.addressLine;
        // this.dropoff_latitude = lat.toString();
        // this.dropoff_longitude = lng.toString();
        print('dropoff location');
        print(address.first.addressLine);
        setState(() {
          dropoffText =address.first.addressLine;
          dropoff_location = address.first.addressLine;
          dropoff_latitude = lat.toString();
          dropoff_longitude = lng.toString();
          isDropOff = true;
        });
      } else {
        print("pridiction is null");
      }
    }
  }




  @override
  void initState() {
    super.initState();
    _bookLoadProvider = Provider.of<BookLoadProvider>(context, listen: false);
    _bookLoadProvider.init(context: context);
    _places = GoogleMapsPlaces(apiKey: _apiKey);
    isPickUp = true;
    count = 0;
    isDropOff = false;
    pickupText = "Select Pickup Location";
    dropoffText = "Select Dropoff Location";
    _bookLoadComponents = BookLoadComponents();
    pickup_latitude = "";
    pickup_longitude = "";
    dropoff_latitude = "";
    dropoff_longitude = "";
    pickup_location = "";
    dropoff_location = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              CommonWidgets.tabsAppBar1(
                text: "Book a Load",
                iconName: Constants.getUser() == Strings.indiviual
                    ? FontAwesome5.bell
                    : Linecons.wallet,
                onPress: () {
                  Constants.getUser() == Strings.indiviual
                      ? Navigator.push(
                      context, SlideRightRoute(page: Notifications()))
                      : Navigator.push(
                      context, SlideRightRoute(page: Wallet()));
                },),
              SizedBox(height: AppSizes.height * 0.005),
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition:
                      CameraPosition(target: _center, zoom: 5),
                    ),
                    SlidingUpPanel(
                      isDraggable: true,
                      minHeight: AppSizes.height * 0.4,
                      maxHeight: AppSizes.height * 0.75,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      panel: _bottomNavigationContainer(),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        Container(
                          height: AppSizes.height * 0.07,
                          margin: EdgeInsets.only(
                              bottom: AppSizes.width * 0.03,
                              left: AppSizes.width * 0.05,
                              right: AppSizes.width * 0.05),
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(
                              08,
                            ),
                          ),
                          width: AppSizes.width,
                          child: FlatButton(
                            onPressed: () {
                              _bookLoadProvider.onNavigateNext(
                                  context: context,
                                  pickup_latitude: pickup_latitude,
                                  pickup_longitude: pickup_longitude,
                                  dropoff_latitude: dropoff_latitude,
                                  dropoff_longitude: dropoff_longitude,
                                  pickup_location: pickup_location,
                                  dropoff_location: dropoff_location,
                              );
                            },
                            child: TextView.getBottomButtonText04(
                              "Next",
                              color: AppColors.white,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
  _bottomNavigationContainer() {
    return Container(
      height: AppSizes.height,
      padding: EdgeInsets.only(top: 20,),
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              _bookLoadComponents.getSlidingUpLine(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                      child: Row(
                        children: [
                          _bookLoadComponents.getLocationImage(),
                          SizedBox(width: AppSizes.width * 0.02),
                          Column(
                            children: [
                              _bookLoadComponents.onLocationPickerButton(
                                context: context,
                                onPress: () async{
                                  Prediction p = await PlacesAutocomplete.show(
                                      context: context, apiKey: _apiKey);
                                  onDisplayPrediction(p, isDeparture: true);
                                },
                                text: pickupText,
                                isSelected: isPickUp,
                              ),
                              SizedBox(height: AppSizes.height * 0.02),
                              _bookLoadComponents.onLocationPickerButton(
                                context: context,
                                onPress: () async{
                                  Prediction p = await PlacesAutocomplete.show(
                                      context: context, apiKey: _apiKey);
                                  onDisplayPrediction(p, isDeparture: false);
                                },
                                text: dropoffText,
                                isSelected: isDropOff,
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    _bookLoadComponents.getHorizontalLine(),

                    SizedBox(height: AppSizes.height * 0.02),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                      child: _bookLoadComponents.getLocationPickupText(
                          text: "Recent Locations"
                      ),
                    ),
                    Wrap(
                      children: [
                        ...List.generate(
                            5,
                                (index) => _bookLoadComponents.getHistroyText(context: context, text: "at Khor Fakkan")
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      )
    );
  }
}
