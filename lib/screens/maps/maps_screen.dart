import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/maps/maps_components.dart';
import 'package:truckoom_shipper/screens/wallet/wallet.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

import 'maps_provider.dart';

final Map<String, Marker> _markers = {};

class Maps extends StatefulWidget {
  String tag;

  Maps({@required this.tag});
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  MapComponents _mapComponents;

  Completer<GoogleMapController> _controller = Completer();

  int _currentIndex = 0;
  GoogleMapController mapController;
  var location = Location();
  LatLng _center = LatLng(30.3753, 69.3451);
  MapsProvider provider;
  bool onClick;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    location.onLocationChanged.listen((currentLocation) {
      _center = LatLng(currentLocation.longitude, currentLocation.latitude);
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 5,
          ),
        ),
      );
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mapComponents = MapComponents();
    provider = Provider.of<MapsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MapsProvider>(context, listen: true);
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
                  onTap: (){Navigator.push(context, SlideRightRoute(page: Wallet()));},
                    child: Image(image: AssetImage(Assets.walletIcon),)
                )
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
                iconName: Assets.walletIcon,
                onPress: (){}
            ),
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
            Container(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.05,
                maxChildSize: 0.9,
                builder: (BuildContext context, myscrollController) {
                  return Container(
                    color: Color.fromRGBO(19, 192, 21, 0),
                    child: ListView(
                      controller: myscrollController,
                      children: [
                        _bottomNavigationContainer(),
                      ],
                    ),
                  );
                },
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
      padding: EdgeInsets.all(15),
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

                      width: AppSizes.width*0.40,
                      height: AppSizes.height*0.008,
                      decoration:BoxDecoration(
                          color: AppColors.dragContainer,
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Container(
                       margin: EdgeInsets.only(top: AppSizes.height*0.03),
                       height: AppSizes.height*0.1,
                       child: Row(
                         children: [
                           Image.asset(Assets.joint),
                         ],
                       ),
                     ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: AppSizes.height*0.02,left: AppSizes.width*0.03),
                            height: AppSizes.height*0.05,
                            width: AppSizes.width*0.85,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius : BorderRadius.circular(10)
                            ),
                            child: TextField(
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: Assets.poppinsLight,
                                  fontSize: 12,
                                  color: AppColors.colorBlack
                              ),
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: AppSizes.height* 0.001),
                                prefixIcon: Image.asset(Assets.location),
                                hintText:"Search Pickup Location",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  fontFamily: Assets.poppinsLight,
                                ),

                              ),

                            )
                          ),
                          SizedBox(height: AppSizes.height*0.04,),
                          Container(
                              margin: EdgeInsets.only(left: AppSizes.width*0.03),
                              height: AppSizes.height*0.05,
                              width: AppSizes.width*0.85,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGray,
                                  borderRadius : BorderRadius.circular(10)
                              ),
                              child: TextField(
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: Assets.poppinsLight,
                                    fontSize: 12,
                                    color: AppColors.colorBlack
                                ),
                                decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.symmetric(vertical: AppSizes.height* 0.001),
                                  prefixIcon: Image.asset(Assets.location),
                                  hintText:"Search DropOff Location",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: Assets.poppinsLight,
                                  ),

                                ),

                              )
                          ),
                        ],
                      ),
                    ]),
                Container(height: AppSizes.height*0.005,
                width: AppSizes.width,
                margin: EdgeInsets.only(top: AppSizes.height*0.03),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                ),),
                SizedBox(height: AppSizes.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: _mapComponents.getLocationPickupText(text: "Pickup Location"),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideRightRoute(page: BottomTab(tag: widget.tag,)));
                  },
                  child: Container(
                    height: AppSizes.height*0.05,
                    width: AppSizes.width*0.85,

                    margin: EdgeInsets.only(top: AppSizes.height*0.02,left: AppSizes.width*0.04,right: AppSizes.width*0.04),
                    decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(10)

                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8)
                          ),

                          child: Row(
                            children: [Image.asset(Assets.location)],
                          ),
                        ),
                        SizedBox(width: AppSizes.width*0.03,),
                        Row(
                          children: [
                            Text(
                              "at Australia",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Assets.poppinsLight,
                                  color: AppColors.colorBlack
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideRightRoute(page: BottomTab(tag: widget.tag,)));
                  },
                  child: Container(
                    height: AppSizes.height*0.05,
                    width: AppSizes.width*0.85,

                    margin: EdgeInsets.only(top: AppSizes.height*0.02,left: AppSizes.width*0.04,right: AppSizes.width*0.04),
                    decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(10)

                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8)
                          ),

                          child: Row(
                            children: [Image.asset(Assets.location)],
                          ),
                        ),
                        SizedBox(width: AppSizes.width*0.03,),
                        Row(
                          children: [
                            Text(
                              "at Australia",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Assets.poppinsLight,
                                  color: AppColors.colorBlack
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideRightRoute(page: BottomTab(tag: widget.tag,)));
                  },
                  child: Container(
                    height: AppSizes.height*0.05,
                    width: AppSizes.width*0.85,

                    margin: EdgeInsets.only(top: AppSizes.height*0.02,left: AppSizes.width*0.04,right: AppSizes.width*0.04),
                    decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(10)

                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8)
                          ),

                          child: Row(
                            children: [Image.asset(Assets.location)],
                          ),
                        ),
                        SizedBox(width: AppSizes.width*0.03,),
                        Row(
                          children: [
                            Text(
                              "at Australia",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Assets.poppinsLight,
                                  color: AppColors.colorBlack
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideRightRoute(page: BottomTab(tag: widget.tag,)));
                  },
                  child: Container(
                    height: AppSizes.height*0.05,
                    width: AppSizes.width*0.85,

                    margin: EdgeInsets.only(top: AppSizes.height*0.02,left: AppSizes.width*0.04,right: AppSizes.width*0.04),
                    decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(10)

                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8)
                          ),

                          child: Row(
                            children: [Image.asset(Assets.location)],
                          ),
                        ),
                        SizedBox(width: AppSizes.width*0.03,),
                        Row(
                          children: [
                            Text(
                              "at Australia",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Assets.poppinsLight,
                                  color: AppColors.colorBlack
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideRightRoute(page: BottomTab(tag: widget.tag,)));
                  },
                  child: Container(
                    height: AppSizes.height*0.05,
                    width: AppSizes.width*0.85,

                    margin: EdgeInsets.only(top: AppSizes.height*0.02,left: AppSizes.width*0.04,right: AppSizes.width*0.04),
                    decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(10)

                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8)
                          ),

                          child: Row(
                            children: [Image.asset(Assets.location)],
                          ),
                        ),
                        SizedBox(width: AppSizes.width*0.03,),
                        Row(
                          children: [
                            Text(
                              "at Australia",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Assets.poppinsLight,
                                  color: AppColors.colorBlack
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
