import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details_components.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle.dart';
import 'package:truckoom_shipper/screens/wallet/wallet.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class JobDetails extends StatefulWidget {
  String tag;

  JobDetails({@required this.tag});

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  LatLng _center = LatLng(30.3753, 69.3451);

  JobDetailsComponents _jobDetailsComponents;

  @override
  void initState() {
    super.initState();
    _jobDetailsComponents = JobDetailsComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 16,
            title: Container(
              width: AppSizes.width,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: AppColors.colorBlack.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(width: AppSizes.width * 0.03),
                  Text(
                    'Book Load',
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: Assets.poppinsMedium,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.white,
          ),
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(target: _center, zoom: 5),
              ),
              SlidingUpPanel(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                panel: _onSlidingUpPanel(),
              )
            ],
          )),
    );
  }

  _onSlidingUpPanel() {
    return Container(
      height: AppSizes.height * 0.5,
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          )),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: AppSizes.height * 0.008,
              width: AppSizes.width * 0.40,
              decoration: BoxDecoration(
                color: AppColors.dragContainer,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          _jobDetailsComponents.getLocationContainer(),
          SizedBox(height: AppSizes.height * 0.03),
          CommonWidgets.getBottomButton(
              text: "Confirm",
              onPress: (){
                Navigator.push(context, SlideRightRoute(page: SelectVehicle(tag: widget.tag)));
              }
          )
        ],
      ),
    );
  }
}
