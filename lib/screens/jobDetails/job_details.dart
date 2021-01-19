import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details_components.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class JobDetails extends StatefulWidget {
  String status;
  int loadId;
  JobDetails({@required this.status, @required this.loadId});

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  LatLng _center = LatLng(30.3753, 69.3451);

  JobDetailsComponents _jobDetailsComponents;
  JobDetailsProvider _jobDetailsProvider;

  @override
  void initState() {
    super.initState();
    _jobDetailsComponents = JobDetailsComponents();
    _jobDetailsProvider = Provider.of<JobDetailsProvider>(context, listen: false);
    _jobDetailsProvider.init(context: context, loadId: widget.loadId);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<JobDetailsProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          body: Container(
            color: AppColors.white,
            child: _jobDetailsProvider.isDataFetched? Column(
              children: [

                _jobDetailsComponents.gettabsAppBarDelete(
                    text: Strings.jobDetails,
                    tag: widget.status,
                    onPress: (){Navigator.pop(context);},
                    clickableText: "Delete",
                    onTap: () {
                      ApplicationToast.onLoadAlert(context: context, onCancellLoad: (){
                        _jobDetailsProvider.onDeleteLoad(context: context, loadId: widget.loadId);
                        Navigator.pop(context);
                      }, text: Strings.deleteLoadAlertText);
                      // _alertDeleteContainer();
                    }),
                SizedBox(height: AppSizes.height * 0.005),
                Expanded(
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: CameraPosition(target: _center, zoom: 5),
                      ),
                      SlidingUpPanel(
                          isDraggable: true,
                          minHeight: AppSizes.height*0.4,
                          maxHeight: AppSizes.height*0.75,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2)),
                        panel: _onSlidingUpPanel(),
                      )
                    ],
                  ),
                )
              ],
            ):
            Center(
              child: Container(
                height: AppSizes.height * 0.15,
                // width: AppSizes.width,
                child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
              ),
            ),
          )
      ),
    );
  }

  _onSlidingUpPanel() {
    return Container(
      height: AppSizes.height * 0.5,
      padding: EdgeInsets.only(top: 20),
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
          SizedBox(height: AppSizes.height * 0.01),
          Expanded(
            child: ListView(
              children: [
                CommonWidgets.getWalletPriceBox(
                    walletPrice: _jobDetailsProvider.loadDetailResponse.result.shipperCost.toString()
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      _jobDetailsComponents.getLocationContainer(
                          pickupLocation: _jobDetailsProvider.loadDetailResponse.result.pickupLocation,
                          dropOffLocation: _jobDetailsProvider.loadDetailResponse.result.dropoffLocation
                      ),
                      TextView.getLabelText04(
                          Strings.roundTrip,
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.001),
                      TextView.getLabel2Text04(_jobDetailsProvider.loadDetailResponse.result.isRoundTrip? "Yes": "No", color: AppColors.colorBlack),
                      SizedBox(height: AppSizes.height * 0.02),

                      TextView.getLabelText04(
                          Strings.pickupDateAndTime,
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.001),
                      TextView.getLabel2Text04(_jobDetailsProvider.loadDetailResponse.result.pickupDateTime, color: AppColors.colorBlack),
                      SizedBox(height: AppSizes.height * 0.02),

                      TextView.getLabelText04(
                          Strings.receiverName,
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.001),
                      TextView.getLabel2Text04(_jobDetailsProvider.loadDetailResponse.result.receiverName, color: AppColors.colorBlack),
                      SizedBox(height: AppSizes.height * 0.02),

                      TextView.getLabelText04(
                          Strings.receiverPhone,
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.001),
                      TextView.getLabel2Text04(_jobDetailsProvider.loadDetailResponse.result.phone, color: AppColors.colorBlack),
                      SizedBox(height: AppSizes.height * 0.02),

                      TextView.getLabelText04(
                          Strings.goodType,
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.001),
                      TextView.getLabel2Text04(_jobDetailsProvider.loadDetailResponse.result.goodType, color: AppColors.colorBlack),
                      SizedBox(height: AppSizes.height * 0.02),

                      TextView.getLabelText04(
                          Strings.weight,
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.001),
                      TextView.getLabel2Text04(_jobDetailsProvider.loadDetailResponse.result.vehicle, color: AppColors.colorBlack),
                      SizedBox(height: AppSizes.height * 0.02),

                      TextView.getLabelText04(
                          "No of Vehicle",
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.001),
                      TextView.getLabel2Text04(_jobDetailsProvider.loadDetailResponse.result.noOfVehicles.toString(), color: AppColors.colorBlack),
                      SizedBox(height: AppSizes.height * 0.02),

                      TextView.getLabelText04(
                          Strings.description,
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.001),
                      TextView.getDescriptionText(
                          _jobDetailsProvider.loadDetailResponse.result.description,
                          color: AppColors.colorBlack
                      ),
                      SizedBox(height: AppSizes.height * 0.02),

                      _jobDetailsProvider.loadDetailResponse.result.loadFiles.isNotEmpty?Container(
                        height: AppSizes.height * 0.1,
                        child: Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _jobDetailsProvider.loadDetailResponse.result.loadFiles.length,
                              itemBuilder: (context, index){
                                return Row(
                                  children: [
                                    SizedBox(width: AppSizes.width * 0.01,),
                                    Container(
                                      height: AppSizes.height * 0.1,
                                      width: AppSizes.width * 0.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Image(
                                        image: NetworkImage(baseUrl+_jobDetailsProvider.loadDetailResponse.result.loadFiles[index].filePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: AppSizes.width * 0.01,),
                                  ],
                                );
                              }),
                        ),
                      ):
                          CommonWidgets.onNullData(text: "No Images"),
                      SizedBox(height: AppSizes.height * 0.02),
                    ],
                  ),
                )
              ],
            ),
          ),
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
