import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child:  _jobDetailsProvider.isDataFetched? Scaffold(
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
                            }),
                        Expanded(
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(target: _center, zoom: 5),
                            ),
                          ),

                        ],
                    ),
                  ),
                )
              ];
            },
            body: Container(
              // height: AppSizes.height,
            width: AppSizes.width,
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
                              TextView.getLabel2Text04(_jobDetailsProvider.loadDetailResponse.result.receiverPhone, color: AppColors.colorBlack),
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ),
          )
      ):
      Center(
        child: Container(
          height: AppSizes.height * 0.15,
          // width: AppSizes.width,
          child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
