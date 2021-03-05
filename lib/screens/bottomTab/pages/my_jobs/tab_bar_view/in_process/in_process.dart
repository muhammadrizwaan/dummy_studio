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
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process_provider.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class InProcess extends StatefulWidget {
  @override
  _InProcessState createState() => _InProcessState();
}

class _InProcessState extends State<InProcess> {
  InProcessComponents _inProcessComponents;
  InProcessProvider _inProcessProvider;
  MyJobsProvider _myJobsProvider;
  ScrollController _scrollController = new ScrollController();
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    pageNumber = 0;
    _inProcessComponents = InProcessComponents();
    _inProcessProvider = Provider.of<InProcessProvider>(context, listen: false);
    _inProcessProvider.init(context: context);
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    _scrollController
      ..addListener(() {
        if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
          pageNumber = pageNumber + 1;
          _inProcessProvider.setIsLoading(true);
          setState(() {});
          _inProcessProvider.getInProcessLoad(context: context, pageNumber: pageNumber);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<InProcessProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child:
          Column(
            children: [
              Expanded(
                child:RefreshIndicator(
                  color: AppColors.yellow,
                  onRefresh: () => onRefresh(),
                  child: _myJobsProvider.inProcessList.length > 0?
                  ListView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: _myJobsProvider.inProcessList.length,
                      itemBuilder: (context, index){
                    return Column(
                      children: [
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _inProcessComponents.getJobContainer(
                          context: context,
                          jobDetail: _myJobsProvider.inProcessList[index].loadId.toString(),
                          pickUpLocation: _myJobsProvider.inProcessList[index].pickupLocation,
                          destinationLocation: _myJobsProvider.inProcessList[index].dropoffLocation,
                          startDate: _myJobsProvider.inProcessList[index].pickupDateTime,
                          time:  _myJobsProvider.inProcessList[index].pickupDateTime,
                          status: _myJobsProvider.inProcessList[index].status,
                          statusId: _myJobsProvider.inProcessList[index].loadStatusId,
                          vehicleType: _myJobsProvider.inProcessList[index].vehicleTypeName,
                          vehicleCategory: _myJobsProvider.inProcessList[index].vehicleCategoryName,
                          price: "${Strings.aed} ${_myJobsProvider.inProcessList[index].shipperCost.round()}",
                          onAlert: (){
                            ApplicationToast.onDescriptionAlert(context: context, description: _myJobsProvider.inProcessList[index].vehicleTypeDescription);
                          },
                          onTap: (){
                            Navigator.push(context, SlideRightRoute(page: JobDetails(status:"InProcess", loadId: _myJobsProvider.inProcessList[index].loadId)));
                          },
                          onDriverDetail: () {
                            Navigator.push(context, SlideRightRoute(page: DriverDetailScreen(driverId:_myJobsProvider.inProcessList[index].assignedDriverId)));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                      ],
                    );
                  }):ListView(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.height * 0.3),
                          child: CommonWidgets.onNullData(text: Strings.noAvailableLoads)
                      ),
                    ],
                  )
                )
              ),
              _inProcessProvider.isLoading?
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
