import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
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
import 'package:truckoom_shipper/widgets/text_views.dart';

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
          body: Column(
            children: [

              _jobDetailsComponents.gettabsAppBarDelete(
                  text: Strings.jobDetails,
                  tag: widget.tag,
                  onPress: (){Navigator.pop(context);},
                  clickableText: "Delete",
                  onTap: () {
                    _alertDeleteContainer();
                  }),
              /*CommonWidgets.tabsAppBar2(
                  text: Strings.jobDetails,
                  onPress: (){Navigator.pop(context);}
              ),*/
              SizedBox(height: AppSizes.height * 0.005),
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(target: _center, zoom: 5),
                    ),
                    SlidingUpPanel(
                        isDraggable: true,
                        minHeight: AppSizes.height*0.35,
                        maxHeight: AppSizes.height*0.65,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2)),
                      panel: _onSlidingUpPanel(),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  _onSlidingUpPanel() {
    return Container(
      height: AppSizes.height * 0.5,
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(2),
            topLeft: Radius.circular(2),
          )),
      child: ListView(
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
          _jobDetailsComponents.getLocationContainer(),
          SizedBox(height: AppSizes.height * 0.01),
          _jobDetailsComponents.getExpectedRate(),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(
              Strings.roundTrip,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("Yes", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.pickupDateAndTime,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("11 Aug, 12:00am", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.receiverName,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("Kevin Gray", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.receiverPhone,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("(333)465-2835", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.goodType,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("Cargo", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.weight,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("45 Ton", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.description,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getDescriptionText(
              "Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet. Donec congue, nunc vel tempor.Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet.",
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: _jobDetailsComponents.getLoadImages(images: Assets.vehicle_img)),
              Expanded(child: _jobDetailsComponents.getLoadImages(images: Assets.vehicle_img)),
              Expanded(child: _jobDetailsComponents.getLoadImages(images: Assets.vehicle_img)),
              Expanded(child: _jobDetailsComponents.getLoadImages(images: Assets.vehicle_img)),
              Expanded(child: _jobDetailsComponents.getLoadImages(images: Assets.vehicle_img)),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
        ],
      ),
    );
  }

  _alertDeleteContainer() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.1,
                        right: AppSizes.width * 0.1,
                        top: AppSizes.width * 0.08,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.08,
                        left: AppSizes.width * 0.08,
                        right: AppSizes.width * 0.08,
                      ),
                      height: AppSizes.height * 0.24,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView.getTabBarAlertText(
                              "Are you sure you want to delete the job?",
                              color: AppColors.colorBlack,
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  //Navigator.push(context, SlideRightRoute(page: MyLoads(selectedPage: 1)));
                                  //Navigator.push(context, MaterialPageRoute(builder:(context) => MyLoads(2)));
                                },
                                child: Container(
                                  height: AppSizes.height * 0.05,
                                  width: AppSizes.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(
                                      04,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextView.getTabBarButtonText("Yes",
                                      color: Colors.white),
                                ),
                              ),
                              // SizedBox(
                              //   width: 20,
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: AppSizes.height * 0.05,
                                  width: AppSizes.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        04,
                                      ),
                                      border: Border.all(
                                        color: AppColors.yellow,
                                      )),
                                  alignment: Alignment.center,
                                  child: TextView.getTabBarButtonText("No",
                                      color: AppColors.yellow),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.425),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                        Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Entypo.air,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }
}
