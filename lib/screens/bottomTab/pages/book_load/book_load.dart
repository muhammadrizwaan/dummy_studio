import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_components.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../../../animations/slide_right.dart';
import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../res/strings.dart';
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
                      widget.tag == Strings.indiviual ?
                      Navigator.push(context, SlideRightRoute(page: Notifications()))
                          :
                      Navigator.push(context, SlideRightRoute(page: Wallet()));
                    },
                    child: Icon(FontAwesome5.bell, size: 20, color: AppColors.colorBlack.withOpacity(0.6),),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.white,
        ),
        body: Stack(
          children: [
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15,),
                topRight: Radius.circular(15,),
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
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.height * 0.03),
                    height: AppSizes.height * 0.1,
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
                        onTap: (){
                          setState(() {
                            pickUpLocation = !pickUpLocation;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: AppSizes.height * 0.02,
                              left: AppSizes.width * 0.03),
                          padding: EdgeInsets.only(
                            left: AppSizes.width * 0.03,
                          ),
                          height: AppSizes.height * 0.06,
                          width: AppSizes.width * 0.85,
                          decoration: BoxDecoration(
                              color:  AppColors.lightGray,
                              border: pickUpLocation ? Border.all(color: AppColors.yellow) : Border.all(color: AppColors.yellow.withOpacity(0)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Icon(
                                Linecons.location,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextView.getLabelText04(
                                pickUpLocation ? "Urbana, IL" : "Select Pick up location",
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
                        onTap: (){
                          if(count == 0){
                            setState(() {
                              dropOffLoction =! dropOffLoction;
                            });
                          }
                          if(count != 0){
                            count = 0 ;
                            pickUpLocation = false;
                            dropOffLoction = false;
                            Navigator.push(context, SlideRightRoute(page: JobDetails(tag: widget.tag,)));
                            // Navigator.push(context, SlideRightRoute(page: SelectVehicle()));
                          }
                          count ++;
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: AppSizes.width * 0.03),
                          padding: EdgeInsets.only(
                            left: AppSizes.width * 0.03,
                          ),
                          height: AppSizes.height * 0.06,
                          width: AppSizes.width * 0.85,
                          decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: dropOffLoction ? Border.all(color: AppColors.yellow) : Border.all(color: AppColors.yellow.withOpacity(0)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Icon(
                                Linecons.location,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextView.getLabelText04(
                                dropOffLoction ? "Chicago, IL" : "Select Drop off location",
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
                ]),
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
                      text: dropOffLoction ? "Drop off location" : "Pickup Location" ),
                ),
                Container(
                  height: AppSizes.height*0.06,
                  width: AppSizes.width,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: AppSizes.width*0.03, left: AppSizes.width*0.05,),
                  child: Row(
                    children: [
                      Container(
                        width: AppSizes.width*0.12,
                        height: AppSizes.height*0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08,),
                          color:  AppColors.lightGray,
                        ),
                        child: Icon(Linecons.location, size: 20,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: AppSizes.width*0.50,
                        child: TextView.getLabelText04("at Australia", color: AppColors.colorBlack.withOpacity(0.6)),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 10, left: AppSizes.width*0.05, right: AppSizes.width*0.05,),
                  color: AppColors.colorBlack.withOpacity(0.2),
                ),
                Container(
                  height: AppSizes.height*0.06,
                  width: AppSizes.width,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: AppSizes.width*0.03, left: AppSizes.width*0.05,),
                  child: Row(
                    children: [
                      Container(
                        width: AppSizes.width*0.12,
                        height: AppSizes.height*0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08,),
                          color:  AppColors.lightGray,
                        ),
                        child: Icon(Linecons.location, size: 20,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: AppSizes.width*0.50,
                        child: TextView.getLabelText04("at Australia", color: AppColors.colorBlack.withOpacity(0.6)),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 10, left: AppSizes.width*0.05, right: AppSizes.width*0.05,),
                  color: AppColors.colorBlack.withOpacity(0.2),
                ),
                Container(
                  height: AppSizes.height*0.06,
                  width: AppSizes.width,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: AppSizes.width*0.03, left: AppSizes.width*0.05,),
                  child: Row(
                    children: [
                      Container(
                        width: AppSizes.width*0.12,
                        height: AppSizes.height*0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08,),
                          color:  AppColors.lightGray,
                        ),
                        child: Icon(Linecons.location, size: 20,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: AppSizes.width*0.50,
                        child: TextView.getLabelText04("at Australia", color: AppColors.colorBlack.withOpacity(0.6)),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 10, left: AppSizes.width*0.05, right: AppSizes.width*0.05,),
                  color: AppColors.colorBlack.withOpacity(0.2),
                ),
                Container(
                  height: AppSizes.height*0.06,
                  width: AppSizes.width,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: AppSizes.width*0.03, left: AppSizes.width*0.05,),
                  child: Row(
                    children: [
                      Container(
                        width: AppSizes.width*0.12,
                        height: AppSizes.height*0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08,),
                          color:  AppColors.lightGray,
                        ),
                        child: Icon(Linecons.location, size: 20,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: AppSizes.width*0.50,
                        child: TextView.getLabelText04("at Australia", color: AppColors.colorBlack.withOpacity(0.6)),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 10, left: AppSizes.width*0.05, right: AppSizes.width*0.05,),
                  color: AppColors.colorBlack.withOpacity(0.2),
                ),
                Container(
                  height: AppSizes.height*0.06,
                  width: AppSizes.width,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: AppSizes.width*0.03, left: AppSizes.width*0.05,),
                  child: Row(
                    children: [
                      Container(
                        width: AppSizes.width*0.12,
                        height: AppSizes.height*0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08,),
                          color:  AppColors.lightGray,
                        ),
                        child: Icon(Linecons.location, size: 20,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: AppSizes.width*0.50,
                        child: TextView.getLabelText04("at Australia", color: AppColors.colorBlack.withOpacity(0.6)),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 10, left: AppSizes.width*0.05, right: AppSizes.width*0.05,),
                  color: AppColors.colorBlack.withOpacity(0.2),
                ),
                Container(
                  height: AppSizes.height*0.06,
                  width: AppSizes.width,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: AppSizes.width*0.03, left: AppSizes.width*0.05,),
                  child: Row(
                    children: [
                      Container(
                        width: AppSizes.width*0.12,
                        height: AppSizes.height*0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08,),
                          color:  AppColors.lightGray,
                        ),
                        child: Icon(Linecons.location, size: 20,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: AppSizes.width*0.50,
                        child: TextView.getLabelText04("at Australia", color: AppColors.colorBlack.withOpacity(0.6)),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 10, left: AppSizes.width*0.05, right: AppSizes.width*0.05,),
                  color: AppColors.colorBlack.withOpacity(0.2),
                ),
                Container(
                  height: AppSizes.height*0.06,
                  width: AppSizes.width,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: AppSizes.width*0.03, left: AppSizes.width*0.05,),
                  child: Row(
                    children: [
                      Container(
                        width: AppSizes.width*0.12,
                        height: AppSizes.height*0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08,),
                          color:  AppColors.lightGray,
                        ),
                        child: Icon(Linecons.location, size: 20,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: AppSizes.width*0.50,
                        child: TextView.getLabelText04("at Australia", color: AppColors.colorBlack.withOpacity(0.6)),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 10, left: AppSizes.width*0.05, right: AppSizes.width*0.05,),
                  color: AppColors.colorBlack.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
