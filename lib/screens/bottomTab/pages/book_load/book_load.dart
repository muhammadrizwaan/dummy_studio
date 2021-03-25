import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_provider.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/widgets/MapView.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import '../../../../animations/slide_right.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../widgets/common_widgets.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

import '../../bottom_tab.dart';

class BookLoad extends StatefulWidget {
  @override
  _BookLoadState createState() => _BookLoadState();
}

class _BookLoadState extends State<BookLoad> {
  GoogleMapController mapController;
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  LatLng _center = LatLng(30.3753, 69.3451);
  BookLoadComponents _bookLoadComponents;
  BookLoadProvider _bookLoadProvider;
  int _value = 1;
  bool isPickUp, isDropOff;
  int count;
  String pickupText, dropoffText;
  GoogleMapsPlaces _places = GoogleMapsPlaces();
  // String _apiKey = "AIzaSyDTLiSzdkVV8xrO9an282diUlBFMshCwAI";
  String _apiKey = "AIzaSyAERKSFYMxdSR6mrMmgyesmQOr8miAFd4c";
  double pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude;
  String pickup_location;
  String dropoff_location;

  Future<Null> onDisplayPrediction(Prediction p,
      {@required bool isDeparture}) async {
    if (isDeparture) {
      if (p != null) {
        PlacesDetailsResponse detail =
            await _places.getDetailsByPlaceId(p.placeId);

        var placeId = p.placeId;
        double lat = detail.result?.geometry?.location?.lat;
        double lng = detail.result?.geometry?.location?.lng;

        var address = await Geocoder.local.findAddressesFromQuery(p.description);
        print('pickup location');
        print(address);
        setState(() {
          pickupText = address.first.addressLine;
          pickup_location = address.first.addressLine;
          pickup_latitude = lat;
          pickup_longitude = lng;
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

        var address =
            await Geocoder.local.findAddressesFromQuery(p.description);
        // this.dropoff_location = address.first.locality ?? address.first.addressLine;
        print('dropoff location');
        print(lat);
        print(lat);
        setState(() {
          dropoffText = address.first.addressLine;
          dropoff_location = address.first.addressLine;
          dropoff_latitude = lat;
          dropoff_longitude = lng;
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
    // pickup_latitude = 32.166351;
    // pickup_longitude = 74.195900;
    // dropoff_latitude = 31.582045;
    // dropoff_longitude = 74.329376;
    pickup_latitude = null;
    pickup_longitude = null;
    dropoff_latitude = null;
    dropoff_longitude = null;
    pickup_location = "";
    dropoff_location = "";
  }

  setNotification(){
    Constants.setNotification(false);
    Navigator.push(context, SlideRightRoute(page: Notifications()));
    if(bottomTabState.mounted){
      bottomTabState.setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: AppSizes.height * 0.6,
                child: MapView(
                  startLat:pickup_latitude ,
                  startLong: pickup_longitude,
                  endLat: dropoff_latitude,
                  endLong: dropoff_longitude,
                  apiKey: "AIzaSyAERKSFYMxdSR6mrMmgyesmQOr8miAFd4c",
                  directionsApiKey: "AIzaSyAERKSFYMxdSR6mrMmgyesmQOr8miAFd4c",
                ),
              ),
              Positioned(
                top: 0,
                child: CommonWidgets.tabsAppBar1(
                  text: "Book a Load",
                  iconName: Constants.getNotification()  == false? Assets.notificationIcon: Assets.notificationReceiveIcon,
                  onPress: () {
                    setNotification();
                  },),
              ),

              DraggableScrollableSheet(
                initialChildSize: 0.32,
                minChildSize:  0.32,
                maxChildSize: 0.91,
                  builder:(BuildContext context, myScrollControler){
                  return Container(
                      height: AppSizes.height * 0.5,
                      padding: EdgeInsets.only(top: AppSizes.height * 0.01, bottom: AppSizes.height * 0.1),
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
                                  controller: myScrollControler,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: AppSizes.width * 0.05),
                                      child: Row(
                                        children: [
                                          _bookLoadComponents.getLocationImage(),
                                          SizedBox(width: AppSizes.width * 0.02),
                                          Column(
                                            children: [
                                              _bookLoadComponents.onLocationPickerButton(
                                                context: context,
                                                buttonId: 1,
                                                onPress: () async {
                                                  Prediction p =
                                                  await PlacesAutocomplete.show(
                                                      context: context, apiKey: _apiKey);
                                                  onDisplayPrediction(p, isDeparture: true);
                                                },
                                                text: pickupText,
                                                isSelected: isPickUp,
                                              ),
                                              SizedBox(height: AppSizes.height * 0.02),
                                              _bookLoadComponents.onLocationPickerButton(
                                                context: context,
                                                buttonId: 2,
                                                onPress: () async {
                                                  Prediction p =
                                                  await PlacesAutocomplete.show(
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppSizes.width * 0.05),
                                      child: _bookLoadComponents.getLocationPickupText(
                                          text: "Recent Locations"),
                                    ),
                                    Wrap(
                                      children: [
                                        ...List.generate(
                                            10,
                                                (index) => Column(
                                              children: [
                                                _bookLoadComponents.getHistroyText(
                                                    context: context, text: "at Khor Fakkan"),
                                                SizedBox(height: AppSizes.height *0.01),
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                                                  height: 1,
                                                  color: AppColors.grey,
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                    },
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child:
                  Container(
                    // height: AppSizes.height * 0.07,
                    color: AppColors.white,
                    child: Container(
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
                              pickup_latitude: pickup_latitude.toString(),
                              pickup_longitude: pickup_longitude.toString(),
                              dropoff_latitude: dropoff_latitude.toString(),
                              dropoff_longitude: dropoff_longitude.toString(),
                              pickup_location: pickup_location,
                              dropoff_location: dropoff_location,
                              distance: double.parse(MapView.distanceBetweenLocations).toInt()
                            // distance: coordinateDistance(double.parse(pickup_latitude) , double.parse(pickup_longitude), double.parse(dropoff_latitude), double.parse(dropoff_longitude)).round()
                          );
                        },
                        child: TextView.getBottomButtonText04(
                          "Next",
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
              ),

            ],
          ),
        ),
    );

    // return SafeArea(
    //     child: Scaffold(
    //       body: Stack(
    //         children: [
    //           NestedScrollView(
    //               headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
    //                 return <Widget>[
    //                   SliverAppBar(
    //                     expandedHeight: AppSizes.height * 0.6,
    //                     pinned: true,
    //                     automaticallyImplyLeading: true,
    //                     floating: false,
    //                     toolbarHeight: 0,
    //                     backgroundColor: AppColors.white,
    //                     flexibleSpace: FlexibleSpaceBar(
    //                         background: Column(
    //                           children: [
    //                             CommonWidgets.tabsAppBar1(
    //                               text: "Book a Load",
    //                               iconName: FontAwesome5.bell,
    //                               onPress: () {
    //                                 Navigator.push(context, SlideRightRoute(page: Notifications()));
    //                               },),
    //                             Expanded(
    //                               // height:AppSizes.height * 0.4,
    //                               child:
    //                               GoogleMap(
    //                                 initialCameraPosition: _initialLocation,
    //                                 myLocationEnabled: true,
    //                                 myLocationButtonEnabled: false,
    //                                 mapType: MapType.normal,
    //                                 zoomGesturesEnabled: true,
    //                                 // markers: markers != null ? Set<Marker>.from(markers) : null,
    //                                 zoomControlsEnabled: false,
    //                                 // polylines: Set<Polyline>.of(polylines.values),
    //                                 onMapCreated: (GoogleMapController controller) {mapController = controller;
    //                                 },
    //                               ),
    //                               // MapView(
    //                               //   startLat: double.parse(pickup_latitude),
    //                               //   startLong: double.parse(pickup_longitude),
    //                               //   endLat: double.parse(dropoff_latitude),
    //                               //   endLong: double.parse(dropoff_longitude),
    //                               //   apiKey: "AIzaSyDTLiSzdkVV8xrO9an282diUlBFMshCwAI",
    //                               //   directionsApiKey: "AIzaSyDTLiSzdkVV8xrO9an282diUlBFMshCwAI",
    //                               // ),
    //                             ),
    //                           ],
    //                         )
    //                     ),
    //                   )
    //                 ];
    //               },
    //               body: Container(
    //                   height: AppSizes.height * 0.5,
    //                   padding: EdgeInsets.only(top: AppSizes.height * 0.01),
    //                   decoration: BoxDecoration(
    //                     color: AppColors.white,
    //                   ),
    //                   child: Stack(
    //                     children: [
    //                       Column(
    //                         children: [
    //                           _bookLoadComponents.getSlidingUpLine(),
    //                           Expanded(
    //                             child: ListView(
    //                               children: [
    //                                 Container(
    //                                   margin: EdgeInsets.symmetric(
    //                                       horizontal: AppSizes.width * 0.05),
    //                                   child: Row(
    //                                     children: [
    //                                       _bookLoadComponents.getLocationImage(),
    //                                       SizedBox(width: AppSizes.width * 0.02),
    //                                       Column(
    //                                         children: [
    //                                           _bookLoadComponents.onLocationPickerButton(
    //                                             context: context,
    //                                             onPress: () async {
    //                                               Prediction p =
    //                                               await PlacesAutocomplete.show(
    //                                                   context: context, apiKey: _apiKey);
    //                                               onDisplayPrediction(p, isDeparture: true);
    //                                             },
    //                                             text: pickupText,
    //                                             isSelected: isPickUp,
    //                                           ),
    //                                           SizedBox(height: AppSizes.height * 0.02),
    //                                           _bookLoadComponents.onLocationPickerButton(
    //                                             context: context,
    //                                             onPress: () async {
    //                                               Prediction p =
    //                                               await PlacesAutocomplete.show(
    //                                                   context: context, apiKey: _apiKey);
    //                                               onDisplayPrediction(p, isDeparture: false);
    //                                             },
    //                                             text: dropoffText,
    //                                             isSelected: isDropOff,
    //                                           )
    //                                         ],
    //                                       )
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 _bookLoadComponents.getHorizontalLine(),
    //                                 SizedBox(height: AppSizes.height * 0.02),
    //                                 Padding(
    //                                   padding: EdgeInsets.symmetric(
    //                                       horizontal: AppSizes.width * 0.05),
    //                                   child: _bookLoadComponents.getLocationPickupText(
    //                                       text: "Recent Locations"),
    //                                 ),
    //                                 Wrap(
    //                                   children: [
    //                                     ...List.generate(
    //                                         5,
    //                                             (index) => Column(
    //                                               children: [
    //                                                 _bookLoadComponents.getHistroyText(
    //                                                 context: context, text: "at Khor Fakkan"),
    //                                                 SizedBox(height: AppSizes.height *0.01),
    //                                                 Container(
    //                                                   margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
    //                                                     height: 1,
    //                                                   color: AppColors.grey,
    //                                                 )
    //                                               ],
    //                                             )),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ))
    //           ),
    //           Align(
    //               alignment: Alignment.bottomCenter,
    //               child:
    //               Container(
    //                 // height: AppSizes.height * 0.07,
    //                 color: AppColors.white,
    //                 child: Container(
    //                   height: AppSizes.height * 0.07,
    //                   margin: EdgeInsets.only(
    //                     bottom: AppSizes.width * 0.03,
    //                       left: AppSizes.width * 0.05,
    //                       right: AppSizes.width * 0.05),
    //                   decoration: BoxDecoration(
    //                     color: AppColors.yellow,
    //                     borderRadius: BorderRadius.circular(
    //                       08,
    //                     ),
    //                   ),
    //                   width: AppSizes.width,
    //                   child: FlatButton(
    //                     onPressed: () {
    //                       _bookLoadProvider.onNavigateNext(
    //                           context: context,
    //                           pickup_latitude: pickup_latitude,
    //                           pickup_longitude: pickup_longitude,
    //                           dropoff_latitude: dropoff_latitude,
    //                           dropoff_longitude: dropoff_longitude,
    //                           pickup_location: pickup_location,
    //                           dropoff_location: dropoff_location,
    //                           distance: double.parse(MapView.distanceBetweenLocations).toInt()
    //                           // distance: coordinateDistance(double.parse(pickup_latitude) , double.parse(pickup_longitude), double.parse(dropoff_latitude), double.parse(dropoff_longitude)).round()
    //                       );
    //                     },
    //                     child: TextView.getBottomButtonText04(
    //                       "Next",
    //                       color: AppColors.white,
    //                     ),
    //                   ),
    //                 ),
    //               )
    //           ),
    //         ],
    //       )
    //     ),
    // );
  }

  coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
