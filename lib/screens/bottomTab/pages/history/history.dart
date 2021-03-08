import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/history/history_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/history/history_provider.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import '../../../../animations/slide_right.dart';
import 'package:provider/provider.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../invoiceDetail/invoice_detail.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  HistoryComponents _historyComponents;
  HistoryProvider _historyProvider;
  String price;
  ScrollController _scrollController = new ScrollController();
  int pageNumber = 0;
  @override
  void initState() {
    price = "";
    pageNumber = 0;
    _historyComponents = HistoryComponents();
    _historyProvider = Provider.of<HistoryProvider>(context, listen: false);
    _historyProvider.init(context: context, page: pageNumber);
    _scrollController
      ..addListener(() {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          pageNumber = pageNumber + 1;
          _historyProvider.setIsLoading(true);
          setState(() {});
          _historyProvider.getPlacedLoad(context: context, pageNumber: pageNumber);
        }
      });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<HistoryProvider>(context, listen: true);
    return Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.white,
        child: Column(
          children: [
            CommonWidgets.tabsAppBar1(
              text: "History",
              iconName: FontAwesome5.bell,
              onPress: () {
                Navigator.push(context, SlideRightRoute(page: Notifications()));
              },),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _historyProvider.isDataFetched?

              RefreshIndicator(
                color: AppColors.yellow,
                onRefresh: () => onRefresh(),
                child: _historyProvider.histroyList.length > 0?
                ListView.builder(
                    itemCount: _historyProvider.histroyList.length,
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppSizes.width * 0.05),
                        child: Column(children: [
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _historyComponents.getHistoryContainer(
                            jobDetail: _historyProvider.histroyList[index].loadId.toString(),
                            pickUpLocation: _historyProvider.histroyList[index].pickupLocation,
                            destinationLocation: _historyProvider.histroyList[index].dropoffLocation,
                            startDate: _historyProvider.histroyList[index].pickupDate,
                            endDate: _historyProvider.histroyList[index].pickupDate,
                            price: "${Strings.aed} ${_historyProvider.histroyList[index].shipperCost.round()}",
                            status: _historyProvider.histroyList[index].status,
                            vehicleType: _historyProvider.histroyList[index].vehicleTypeName,
                            vehicleCategory: _historyProvider.histroyList[index].vehicleTypeName,
                            startTime: _historyProvider.histroyList[index].pickupTime,
                            endTime: _historyProvider.histroyList[index].pickupTime,
                            onTap: () {
                              ApplicationToast.onDescriptionAlert(context: context, description: _historyProvider.histroyList[index].vehicleTypeDescription);
                            },
                            onInvoice: () {
                              Navigator.push(context, SlideRightRoute(page: InvoiceDetail(Id:_historyProvider.histroyList[index].loadId)));
                            },
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                        ]),
                      );
                    }
                ):Center(
                  child: Container(
                      height: AppSizes.height * 0.15,
                      // width: AppSizes.width,
                      child: CommonWidgets.onNullData(text: Strings.noAvailableLoads)
                  ),
                )
              )
                  :ListView(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.height * 0.3),
                      // height: AppSizes.height * 0.15,
                      // width: AppSizes.width,
                      child: CommonWidgets.onNullData(text: Strings.noAvailableLoads)
                  ),
                ],
              )
            ),
            _historyProvider.isLoading?
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
        ));
  }


  Future<Null> onRefresh() async{
    pageNumber = 0;
    await _historyProvider.getPlacedLoad(context: context, pageNumber: pageNumber);
  }
}