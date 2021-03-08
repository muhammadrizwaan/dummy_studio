import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Accepted extends StatefulWidget {
  @override
  _AcceptedState createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  AcceptedComponents _acceptedComponents;
  AcceptedProvider _acceptedProvider;
  MyJobsProvider _myJobsProvider;
  ScrollController _scrollController = new ScrollController();
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    pageNumber = 0;
    _acceptedComponents = AcceptedComponents();
    _acceptedProvider = Provider.of<AcceptedProvider>(context, listen: false);
    _acceptedProvider.init(context: context);
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    _scrollController
      ..addListener(() {
        if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
          pageNumber = pageNumber + 1;
          _acceptedProvider.setIsLoading(true);
          setState(() {});
          _acceptedProvider.getAcceptedLoad(context: context, pageNumber: pageNumber);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AcceptedProvider>(context, listen: true);
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
                    child: _myJobsProvider.acceptedList.length >0?
                    ListView.builder(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _myJobsProvider.acceptedList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: AppSizes.height * 0.02,
                            ),
                            _acceptedComponents.getJobContainer(
                                jobDetail: _myJobsProvider.acceptedList[index].loadId.toString(),
                                pickUpLocation: _myJobsProvider.acceptedList[index].pickupLocation,
                                destinationLocation: _myJobsProvider.acceptedList[index].dropoffLocation,
                                startDate: _myJobsProvider.acceptedList[index].pickupDateTime,
                                time: _myJobsProvider.acceptedList[index].pickupDateTime,
                                status: _myJobsProvider.acceptedList[index].status,
                                vehicleType: _myJobsProvider.acceptedList[index].vehicleTypeName,
                                vehicleCategory: _myJobsProvider.acceptedList[index].vehicleCategoryName,
                                price: "${Strings.aed} ${_myJobsProvider.acceptedList[index].shipperCost.round()}",
                                onAlert: () {
                                  ApplicationToast.onDescriptionAlert(context: context, description: _myJobsProvider.acceptedList[index].vehicleTypeDescription);
                                },
                                onTap: () {
                                  Navigator.push(
                                      context, SlideRightRoute(page: JobDetails(status:"Accepted", loadId: _myJobsProvider.acceptedList[index].loadId)));
                                },
                                onClickPay: () {
                                  Navigator.push(context, SlideRightRoute(page: Payment(loadId: _myJobsProvider.acceptedList[index].loadId)));
                                },
                                onClickCancel: () {
                                  ApplicationToast.onLoadAlert(context: context, onCancellLoad: (){
                                    _acceptedProvider.onCancellLoad(context: context, loadId: _myJobsProvider.acceptedList[index].loadId);
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
              _acceptedProvider.isLoading?
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
