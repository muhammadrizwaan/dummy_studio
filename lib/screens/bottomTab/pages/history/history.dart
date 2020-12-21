import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/history/history_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/history/history_provider.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/screens/wallet/wallet.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import '../../../../animations/slide_right.dart';
import 'package:provider/provider.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../invoiceDetail/invoice_detail.dart';

class HistoryScreen extends StatefulWidget {
  String tag;

  HistoryScreen({@required this.tag});
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  HistoryComponents _historyComponents;
  HistoryProvider _historyProvider;
  String price;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _historyProvider = Provider.of<HistoryProvider>(context, listen: false);
    _historyProvider.init(context: context);
    price = "";
    _historyComponents = HistoryComponents();
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
                iconName: widget.tag == Strings.indiviual
                    ? FontAwesome5.bell
                    : Linecons.wallet,
                onPress: () {
                  widget.tag == Strings.indiviual
                      ? Navigator.push(
                      context, SlideRightRoute(page: Notifications()))
                      : Navigator.push(
                      context, SlideRightRoute(page: Wallet()));
                },),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _historyProvider.isDataFetched?
                  ListView.builder(
                    itemCount: _historyProvider.historyResponse.result.length,
                      itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppSizes.width * 0.05),
                      child: Column(children: [
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _historyComponents.getHistoryContainer(
                          jobDetail: _historyProvider.historyResponse.result[index].loadId.toString(),
                          pickUpLocation: _historyProvider.historyResponse.result[index].pickupLocation,
                          destinationLocation: _historyProvider.historyResponse.result[index].dropoffLocation,
                          startDate: _historyProvider.historyResponse.result[index].pickupDate,
                          endDate: _historyProvider.historyResponse.result[index].pickupDate,
                          price: "${Strings.aed} ${_historyProvider.historyResponse.result[index].shipperCost.round()}",
                          status: _historyProvider.historyResponse.result[index].status,
                          vehicleType: _historyProvider.historyResponse.result[index].vehicleTypeName,
                          startTime: _historyProvider.historyResponse.result[index].pickupTime,
                          endTime: _historyProvider.historyResponse.result[index].pickupTime,
                          onTap: () {
                            ApplicationToast.onDescriptionAlert(context: context, description: _historyProvider.historyResponse.result[index].vehicleTypeDescription);
                          },
                          onInvoice: () {
                            Navigator.push(context, SlideRightRoute(page: InvoiceDetail(Id:_historyProvider.historyResponse.result[index].loadId)));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                      ]),
                    );
                  }
              ):
              Center(
                child: Container(
                  height: AppSizes.height * 0.15,
                  // width: AppSizes.width,
                  child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ));
  }
}
