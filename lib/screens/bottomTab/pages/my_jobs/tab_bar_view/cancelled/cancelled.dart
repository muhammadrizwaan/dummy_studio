import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/cancelled/cancelled_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'cancelled_components.dart';

class Cancelled extends StatefulWidget {
  @override
  _CancelledState createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {
  CancelledComponents _cancelledComponents;
  CancelledProvider _cancelledProvider;
  MyJobsProvider _myJobsProvider;
  ScrollController _scrollController = new ScrollController();
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    pageNumber = 0;
    _cancelledComponents = CancelledComponents();
    _cancelledProvider = Provider.of<CancelledProvider>(context, listen: false);
    _cancelledProvider.init(context: context);
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    _scrollController
      ..addListener(() {
        if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
          pageNumber = pageNumber + 1;
          _cancelledProvider.setIsLoading(true);
          setState(() {});
          _cancelledProvider.getCancelledLoad(context: context, pageNumber: pageNumber);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CancelledProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child:
          Column(
            children: [
              Expanded(
                child: _myJobsProvider.cancelledList.length > 0?
                RefreshIndicator(
                  color: AppColors.yellow,
                  onRefresh: () => onRefresh(),
                  child: ListView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _myJobsProvider.cancelledList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: AppSizes.height * 0.02,
                            ),
                            _cancelledComponents.getJobContainer(
                              jobDetail: _myJobsProvider.cancelledList[index].loadId.toString(),
                              pickUpLocation: _myJobsProvider.cancelledList[index].pickupLocation,
                              destinationLocation: _myJobsProvider.cancelledList[index].dropoffLocation,
                              startDate: _myJobsProvider.cancelledList[index].pickupDateTime,
                              time: _myJobsProvider.cancelledList[index].pickupDateTime,
                              status: _myJobsProvider.cancelledList[index].status,
                              vehicleType: _myJobsProvider.cancelledList[index].vehicleTypeName,
                              price: "${Strings.aed} ${_myJobsProvider.cancelledList[index].shipperCost.round()}",
                              onAlert: () {
                                ApplicationToast.onDescriptionAlert(context: context, description: _myJobsProvider.cancelledList[index].vehicleTypeDescription);
                              },
                              onTap: () {
                                Navigator.push(
                                    context, SlideRightRoute(page: JobDetails(status:"InProcess", loadId: _myJobsProvider.cancelledList[index].loadId)));
                              },
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.02,
                            ),
                          ],
                        );
                      }),
                ):
                Center(
                  child: Container(
                      height: AppSizes.height * 0.15,
                      // width: AppSizes.width,
                      child: CommonWidgets.onNullData(text: Strings.noAvailableLoads)
                  ),
                ),
              ),
              _cancelledProvider.isLoading?
              Container(
                height:  AppSizes.height * 0.1,
                color: Colors.transparent,
                child: Center(
                  child: new CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(AppColors.yellow),
                  ),
                ),
              ):
              Container(),
            ],
          )
    );
  }
  Future<Null> onRefresh() async{
    pageNumber = 0;
    await _myJobsProvider.getLoads(context: context);
  }
}
