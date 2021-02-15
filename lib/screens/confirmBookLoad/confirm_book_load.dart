import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/confirmBookLoad/confirm_book_load_components.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle.dart';
import 'package:truckoom_shipper/widgets/MapView.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class ConfirmBookLoad extends StatefulWidget {
  String PickupLatitude,
      PickupLongitude,
      DropoffLatitude,
      DropoffLongitude,
      PickupLocation,
      DropoffLocation;
  int Distance;

  ConfirmBookLoad(
      {@required this.PickupLatitude,
      @required this.PickupLongitude,
      @required this.DropoffLatitude,
      @required this.DropoffLongitude,
      @required this.PickupLocation,
      @required this.DropoffLocation,
      @required this.Distance});

  @override
  _ConfirmBookLoadState createState() => _ConfirmBookLoadState();
}

class _ConfirmBookLoadState extends State<ConfirmBookLoad> {
  ConfirmBookLoadComponents _confirmBookLoadComponents;
  LatLng _center = LatLng(30.3753, 69.3451);
  MapView _currMapView;

  @override
  void initState() {
    super.initState();
    _confirmBookLoadComponents = ConfirmBookLoadComponents();
    // _currMapView = _getMapView();
    // _currMapView.getDistance();
    print('Distance is');
    print(double.parse(MapView.distanceBetweenLocations).toInt());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
      return <Widget>[
        SliverAppBar(
          expandedHeight: AppSizes.height * 0.5,
          pinned: true,
          automaticallyImplyLeading: true,
          floating: false,
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                CommonWidgets.tabsAppBar2(
                    text: Strings.bookLoad,
                    onPress: () {
                      Navigator.pop(context);
                    }),
                Expanded(
                  child:  MapView(
                    startLat: double.parse(widget.PickupLatitude),
                    startLong: double.parse(widget.PickupLongitude),
                    endLat: double.parse(widget.DropoffLatitude),
                    endLong: double.parse(widget.DropoffLongitude),
                    apiKey: "IzaSyDHxZ--0FYqNItvE-kf3Sz2jlRtgt0Mp3Q",
                    directionsApiKey: "AIzaSyDTLiSzdkVV8xrO9an282diUlBFMshCwAI",
                  ),
                ),
              ],
            ),
          ),
        )
      ];
    },
    body: Container(
      height: AppSizes.height * 0.5,
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(2),
            topLeft: Radius.circular(2),
          )),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: AppSizes.height * 0.008,
              width: AppSizes.width * 0.40,
              decoration: BoxDecoration(
                color: AppColors.dragContainerslider,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _confirmBookLoadComponents.getLocationContainer(
                    pickupLocation: widget.PickupLocation,
                    dropOffLocation: widget.DropoffLocation),
                SizedBox(height: AppSizes.height * 0.03),
                CommonWidgets.getBottomButton(
                    text: "Confirm",
                    onPress: () {
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          page: SelectVehicle(
                            PickupLatitude: widget.PickupLatitude,
                            PickupLongitude: widget.PickupLongitude,
                            DropoffLatitude: widget.DropoffLatitude,
                            DropoffLongitude: widget.DropoffLongitude,
                            PickupLocation: widget.PickupLocation,
                            DropoffLocation: widget.DropoffLocation,
                            Distance: double.parse(MapView.distanceBetweenLocations).toInt(),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: AppSizes.height * 0.02),
              ],
            ),
          ),
        ],
      ),
    )
    )
    ),);
  }

  _getMapView() {
    return MapView(
      startLat: double.parse(widget.PickupLatitude),
      startLong: double.parse(widget.PickupLongitude),
      endLat: double.parse(widget.DropoffLatitude),
      endLong: double.parse(widget.DropoffLongitude),
      apiKey: "AIzaSyDTLiSzdkVV8xrO9an282diUlBFMshCwAI",
      directionsApiKey: "AIzaSyDTLiSzdkVV8xrO9an282diUlBFMshCwAI",
    );
  }
}
