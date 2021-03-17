
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details_components.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/MapView.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class JobDetails extends StatefulWidget {
  String status;
  int loadId;
  JobDetails({@required this.status, @required this.loadId});

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  LatLng _center = LatLng(30.3753, 69.3451);
  TextEditingController reasonControler;
  JobDetailsComponents _jobDetailsComponents;
  JobDetailsProvider _jobDetailsProvider;

  @override
  void initState() {
    super.initState();
    reasonControler = TextEditingController();
    _jobDetailsComponents = JobDetailsComponents();
    _jobDetailsProvider = Provider.of<JobDetailsProvider>(context, listen: false);
    _jobDetailsProvider.init(context: context, loadId: widget.loadId);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<JobDetailsProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          body: _jobDetailsProvider.isDataFetched?
          Stack(
            children: [
              Container(
                height: AppSizes.height * 0.62,
                child: MapView(
                  startLat: _jobDetailsProvider.loadDetailResponse.result.pickupLatitude,
                  startLong: _jobDetailsProvider.loadDetailResponse.result.pickupLongitude,
                  endLat: _jobDetailsProvider.loadDetailResponse.result.dropoffLatitude,
                  endLong: _jobDetailsProvider.loadDetailResponse.result.dropoffLongitude,
                  // startLat: null,
                  // startLong: null,
                  // endLat: null,
                  // endLong: null,
                  apiKey: "AIzaSyAERKSFYMxdSR6mrMmgyesmQOr8miAFd4c",
                  directionsApiKey: "AIzaSyAERKSFYMxdSR6mrMmgyesmQOr8miAFd4c",
                ),
              ),
              Positioned(
                top: 0,
                child: _jobDetailsComponents.gettabsAppBarDelete(
                    text: Strings.jobDetails,
                    tag: widget.status,
                    onPress: (){Navigator.pop(context);},
                    clickableText: "Delete",
                    onTap: () {
                      ApplicationToast.onReportIssue(
                          context: context,
                          heading: Strings.deleteLoadAlertText,
                          lable: Strings.reasonText,
                          placeHolder: Strings.enterReasonText,
                          onPress: (){
                            _jobDetailsProvider.onDeleteLoad(
                                context: context,
                                loadId: widget.loadId,
                              reason: reasonControler.text
                            );
                          },
                        onClose: (){
                          hideLoader(context);
                        },
                        reasonControler: reasonControler,
                      );
                    }),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.36,
                  minChildSize: 0.36,
                  maxChildSize: 0.91,
                  builder: (BuildContext context, myScrollControler){
                return Container(
                  // height: AppSizes.height,
                  width: AppSizes.width,
                  color: AppColors.white,
                  child: Column(
                    children: [
                      SizedBox(height: AppSizes.height * 0.01),
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
                          controller: myScrollControler,
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
                                  CommonWidgets.getLoadDetailLableWithImage(
                                    image: Assets.loadIcon,
                                    lable: Strings.loadId,
                                    text: _jobDetailsProvider.loadDetailResponse.result.loadId.toString(),
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),

                                  CommonWidgets.getLoadDetailLableWithImage(
                                    image: Assets.roundTripIcon,
                                    lable: Strings.roundTrip,
                                    text: _jobDetailsProvider.loadDetailResponse.result.isRoundTrip ? "Yes" : "No",
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),

                                  CommonWidgets.getLoadDetailCommonText(
                                    icon: LineariconsFree.license,
                                    lable: Strings.pickupDateAndTime,
                                    text: CommonWidgets.getDateTimeFormate(time: _jobDetailsProvider.loadDetailResponse.result.pickupDateTime) ,
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),

                                  CommonWidgets.getLoadDetailCommonText(
                                    icon: Entypo.user,
                                    lable: Strings.receiverName,
                                    text: _jobDetailsProvider.loadDetailResponse.result.receiverName,
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),

                                  CommonWidgets.getLoadDetailCommonText(
                                    icon: Entypo.mobile,
                                    lable: Strings.receiverPhone,
                                    text: _jobDetailsProvider.loadDetailResponse.result.receiverPhone,
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),

                                  CommonWidgets.getLoadDetailLableWithImage(
                                    image: Assets.loadIcon,
                                    lable: Strings.goodType,
                                    text: _jobDetailsProvider.loadDetailResponse.result.goodType,
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),

                                  CommonWidgets.getLoadDetailLableWithImage(
                                    image: Assets.weightIcon,
                                    lable: Strings.weight,
                                    text: _jobDetailsProvider.loadDetailResponse.result.weight,
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),

                                  CommonWidgets.getLoadDetailLableWithImage(
                                    image: Assets.vehicle,
                                    lable: "No of Vehicle",
                                    text: _jobDetailsProvider.loadDetailResponse.result.noOfVehicles.toString(),
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),

                                  CommonWidgets.getLoadDetailCommonText(
                                    icon: Icons.message,
                                    lable: Strings.description,
                                    text: _jobDetailsProvider.loadDetailResponse.result.description,
                                  ),

                                  _jobDetailsProvider.loadDetailResponse.result.loadCarriers.length > 0?
                                  _jobDetailsComponents.getAssignTable():
                                      Container(),

                                  _jobDetailsProvider.loadDetailResponse.result.loadCarriers.length > 0?
                                  Wrap(
                                    children: [
                                      ...List.generate(
                                        _jobDetailsProvider.loadDetailResponse.result.loadCarriers.length,
                                            (index) => _jobDetailsComponents.getTableData(
                                          sr:  index,
                                          driver: _jobDetailsProvider.loadDetailResponse.result.loadCarriers[index].assignedDriver,
                                          vehicle: _jobDetailsProvider.loadDetailResponse.result.loadCarriers[index].assignedVehicle + ' | ' + _jobDetailsProvider.loadDetailResponse.result.loadCarriers[index].vehiclePlateNo,
                                          status: _jobDetailsProvider.loadDetailResponse.result.loadCarriers[index].loadStatus
                                        ),
                                      )
                                    ],
                                  ):
                                      Container(),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  _jobDetailsProvider.loadDetailResponse.result.loadFiles.isNotEmpty?Container(
                                    height: AppSizes.height * 0.1,
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
                                  ):
                                  CommonWidgets.onNullData(text: "No Images"),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  _jobDetailsProvider.loadDetailResponse.result.eSignaturePath == "" ?
                                  Container():
                                  CommonWidgets.getSubHeadingText(text: Strings.receiverSignature),
                                  _jobDetailsProvider.loadDetailResponse.result.eSignaturePath == "" ?
                                  Container() :
                                  CommonWidgets.getSignatureBox(eSignature: _jobDetailsProvider.loadDetailResponse.result.eSignaturePath),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                  })
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
    );

  }
  hideLoader(BuildContext context) {
    reasonControler.text = "";
    Navigator.of(context).pop();
  }
}
