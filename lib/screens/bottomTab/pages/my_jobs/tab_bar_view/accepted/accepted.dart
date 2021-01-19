import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class Accepted extends StatefulWidget {
  @override
  _AcceptedState createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  AcceptedComponents _acceptedComponents;
  AcceptedProvider _acceptedProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _acceptedComponents = AcceptedComponents();
    _acceptedProvider = Provider.of<AcceptedProvider>(context, listen: false);
    _acceptedProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AcceptedProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: _acceptedProvider.isDataFetched ? 
          _acceptedProvider.tabbarResponse.result.length >0?
            ListView.builder(
              itemCount: _acceptedProvider.tabbarResponse.result.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    _acceptedComponents.getJobContainer(
                        jobDetail: _acceptedProvider.tabbarResponse.result[index].loadId.toString(),
                        pickUpLocation: _acceptedProvider.tabbarResponse.result[index].pickupLocation,
                        destinationLocation: _acceptedProvider.tabbarResponse.result[index].dropoffLocation,
                        startDate: _acceptedProvider.tabbarResponse.result[index].pickupDateTime,
                        time: _acceptedProvider.tabbarResponse.result[index].pickupDateTime,
                        status: _acceptedProvider.tabbarResponse.result[index].status,
                        vehicleType: _acceptedProvider.tabbarResponse.result[index].vehicleTypeName,
                        price: "${Strings.aed} ${_acceptedProvider.tabbarResponse.result[index].shipperCost.round()}",
                        onAlert: () {
                          ApplicationToast.onDescriptionAlert(context: context, description: _acceptedProvider.tabbarResponse.result[index].vehicleTypeDescription);
                        },
                        onTap: () {
                          Navigator.push(
                              context, SlideRightRoute(page: JobDetails(status:"Accepted", loadId: _acceptedProvider.tabbarResponse.result[index].loadId)));
                        },
                        onClickPay: () {
                          Navigator.push(context, SlideRightRoute(page: Payment(loadId: _acceptedProvider.tabbarResponse.result[index].loadId)));
                        },
                        onClickCancel: () {
                          ApplicationToast.onLoadAlert(context: context, onCancellLoad: (){
                            _acceptedProvider.onCancellLoad(context: context, loadId: _acceptedProvider.tabbarResponse.result[index].loadId);
                            Navigator.pop(context);
                          },
                            text: Strings.cancelLoadAlertText,
                          );
                        }),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                  ],
                );
              }):
          Center(
                  child: Container(
                      height: AppSizes.height * 0.15,
                      // width: AppSizes.width,
                      child:
                          CommonWidgets.onNullData(text: Strings.noAvailableLoads)),
                )
          : 
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
