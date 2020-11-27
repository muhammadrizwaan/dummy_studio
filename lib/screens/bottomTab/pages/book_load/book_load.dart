import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:truckoom_shipper/screens/adding_drop_off/adding_drop_off.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_components.dart';
import 'package:truckoom_shipper/screens/confirmBookLoad/confirm_book_load.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle_components.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../../../animations/slide_right.dart';
import '../../../../animations/slide_right.dart';
import '../../../../animations/slide_right.dart';
import '../../../../res/assets.dart';
import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../res/sizes.dart';
import '../../../../res/strings.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../wallet/wallet.dart';

class BookLoad extends StatefulWidget {
  String tag;

  BookLoad({@required this.tag});

  @override
  _BookLoadState createState() => _BookLoadState();
}

class _BookLoadState extends State<BookLoad> {
  GoogleMapController mapController;
  var location = Location();
  LatLng _center = LatLng(30.3753, 69.3451);
  BookLoadComponents _bookLoadComponents;
  int _value = 1;
  bool pickUpLocation, dropOffLoction;
  int count;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    location.onLocationChanged.listen((currentLocation) {
      _center = LatLng(currentLocation.longitude, currentLocation.latitude);
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 15,
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickUpLocation = false;
    count = 0;
    dropOffLoction = false;
    _bookLoadComponents = BookLoadComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            width: AppSizes.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Book a Load',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: Assets.poppinsMedium,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SlideRightRoute(page: Wallet()));
                  },
                  child: widget.tag == Strings.indiviual
                      ? Icon(
                          FontAwesome5.bell,
                          size: 25,
                          color: AppColors.colorBlack.withOpacity(0.6),
                        )
                      : Icon(
                          Linecons.wallet,
                          size: 20,
                          color: AppColors.colorBlack.withOpacity(0.6),
                        ),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.white,
          // iconTheme: IconThemeData(color: Color.fromRGBO(49, 49, 49, 1)),
        ),
        body: Stack(
          children: [
            CommonWidgets.tabsAppBar2(
                text: 'Book a Load',
                onPress: () {}),
            SizedBox(height: AppSizes.height * 0.04),
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 5,
              ),
              mapType: MapType.terrain,
              trafficEnabled: true,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
            SlidingUpPanel(
              isDraggable: true,
              minHeight: AppSizes.height*0.30,
              maxHeight: AppSizes.height*0.75,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15,),
                topLeft: Radius.circular(15,),
              ),
              panel: Center(
                child: _bottomNavigationContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationContainer() {
    return Container(
      height: AppSizes.height,
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            15,
          ),
          topRight: Radius.circular(
            15,
          ),
        ),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: AppSizes.width * 0.40,
                      height: AppSizes.height * 0.008,
                      decoration: BoxDecoration(
                          color: AppColors.dragContainer,
                          borderRadius: BorderRadius.circular(10))),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: AppSizes.height * 0.03),
                        height: AppSizes.height * 0.11,
                        child: Row(
                          children: [
                            Image.asset(Assets.joint),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                pickUpLocation = !pickUpLocation;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: AppSizes.height * 0.02,
                                left: AppSizes.width * 0.03,
                              ),
                              padding: EdgeInsets.only(
                                left: AppSizes.width * 0.03,
                              ),
                              height: AppSizes.height * 0.06,
                              width: AppSizes.width * 0.85,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGray,
                                  border: pickUpLocation
                                      ? Border.all(color: AppColors.yellow)
                                      : Border.all(
                                          color: AppColors.yellow.withOpacity(0)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Icon(Elusive.location, size: 20, color: AppColors.colorBlack.withOpacity(0.8),),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextView.getLabelText04(
                                    pickUpLocation
                                        ? "Sharjah, SL"
                                        : "Select Pickup Location",
                                    color: Colors.black.withOpacity(
                                      0.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (count == 0) {
                                setState(() {
                                  dropOffLoction = !dropOffLoction;
                                });
                              }
                              if (count != 0) {
                                count = 0;
                                pickUpLocation = false;
                                dropOffLoction = false;
                                Navigator.push(context, SlideRightRoute(page: ConfirmBookLoad()));
                              }
                              count++;
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: AppSizes.width * 0.03),
                              padding: EdgeInsets.only(
                                left: AppSizes.width * 0.03,
                              ),
                              height: AppSizes.height * 0.06,
                              width: AppSizes.width * 0.85,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGray,
                                  border: dropOffLoction
                                      ? Border.all(color: AppColors.yellow)
                                      : Border.all(
                                          color: AppColors.yellow.withOpacity(0)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Icon(Elusive.location, size: 20, color: AppColors.colorBlack.withOpacity(0.8),),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextView.getLabelText04(
                                    dropOffLoction
                                        ? "Al Ain, AL"
                                        : "Select Drop off Location",
                                    color: Colors.black.withOpacity(
                                      0.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: AppSizes.height * 0.005,
                  width: AppSizes.width,
                  margin: EdgeInsets.only(top: AppSizes.height * 0.03),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                  ),
                ),
                SizedBox(height: AppSizes.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: _bookLoadComponents.getLocationPickupText(
                    text: dropOffLoction
                        ? "Drop off Location"
                        : "Pickup Location",
                  ),
                ),
                Container(
                  height: AppSizes.height * 0.05,
                  width: AppSizes.width * 0.85,
                  margin: EdgeInsets.only(
                    top: AppSizes.height * 0.02,
                    left: AppSizes.width * 0.04,
                    right: AppSizes.width * 0.04,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Icon(Elusive.location, size: 20, color: AppColors.colorBlack.withOpacity(0.8),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.width * 0.03,
                      ),
                      Container(
                        color: AppColors.white,
                        child: Text(
                          "at Ras Al Khaimah",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: Assets.poppinsLight,
                            color: AppColors.colorBlack,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: AppSizes.height * 0.05,
                  width: AppSizes.width * 0.85,
                  margin: EdgeInsets.only(
                    top: AppSizes.height * 0.02,
                    left: AppSizes.width * 0.04,
                    right: AppSizes.width * 0.04,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Icon(Elusive.location, size: 20, color: AppColors.colorBlack.withOpacity(0.8),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.width * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            "at Khor Fakkan",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: Assets.poppinsLight,
                                color: AppColors.colorBlack),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: AppSizes.height * 0.05,
                  width: AppSizes.width * 0.85,
                  margin: EdgeInsets.only(
                      top: AppSizes.height * 0.02,
                      left: AppSizes.width * 0.04,
                      right: AppSizes.width * 0.04),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Icon(Elusive.location, size: 20, color: AppColors.colorBlack.withOpacity(0.8),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.width * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            "at Ruwais",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: Assets.poppinsLight,
                                color: AppColors.colorBlack),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: AppSizes.height * 0.05,
                  width: AppSizes.width * 0.85,
                  margin: EdgeInsets.only(
                      top: AppSizes.height * 0.02,
                      left: AppSizes.width * 0.04,
                      right: AppSizes.width * 0.04),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Icon(Elusive.location, size: 20, color: AppColors.colorBlack.withOpacity(0.8),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.width * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            "at Hatta",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: Assets.poppinsLight,
                                color: AppColors.colorBlack),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: AppSizes.height * 0.05,
                  width: AppSizes.width * 0.85,
                  margin: EdgeInsets.only(
                      top: AppSizes.height * 0.02,
                      left: AppSizes.width * 0.04,
                      right: AppSizes.width * 0.04),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Icon(Elusive.location, size: 20, color: AppColors.colorBlack.withOpacity(0.8),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.width * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            "at Ar-Rams",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: Assets.poppinsLight,
                                color: AppColors.colorBlack),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
