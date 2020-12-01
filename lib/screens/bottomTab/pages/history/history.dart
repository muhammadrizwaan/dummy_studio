import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/history/history_components.dart';

import '../../../../animations/slide_right.dart';
import '../../../../res/assets.dart';
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
  String price;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = "";
    _historyComponents = HistoryComponents();
  }
  @override
  Widget build(BuildContext context) {
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
                  // GetToken.getToken();
                }),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.width * 0.05),
                    child: Column(children: [
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _historyComponents.getTransectionsContainer(
                        jobDetail: "01",
                        pickUpLocation: "ABC Port:",
                        destinationLocation: "227 Building, UAE:",
                        startDate: "11 Aug,",
                        endDate: "12 Aug,",
                        price: "AED 260",
                        status: "Completed",
                        startTime: "11:00pm",
                        endTime: "11:00pm",
                        onTap: () {},
                        onInvoice: () {
                          Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                        },
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _historyComponents.getTransectionsContainer(
                        jobDetail: "01",
                        pickUpLocation: "ABC Port:",
                        destinationLocation: "227 Building, UAE:",
                        startDate: "11 Aug,",
                        endDate: "12 Aug,",
                        price: "AED 260",
                        status: "Completed",
                        startTime: "11:00pm",
                        endTime: "11:00pm",
                        onTap: () {},
                        onInvoice: () {
                          Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                        },
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _historyComponents.getTransectionsContainer(
                        jobDetail: "01",
                        pickUpLocation: "ABC Port:",
                        destinationLocation: "227 Building, UAE:",
                        startDate: "11 Aug,",
                        endDate: "12 Aug,",
                        price: "AED 260",
                        status: "Completed",
                        startTime: "11:00pm",
                        endTime: "11:00pm",
                        onTap: () {},
                        onInvoice: () {
                          Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                        },
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _historyComponents.getTransectionsContainer(
                        jobDetail: "01",
                        pickUpLocation: "ABC Port:",
                        destinationLocation: "227 Building, UAE:",
                        startDate: "11 Aug,",
                        endDate: "12 Aug,",
                        price: "AED 260",
                        status: "Completed",
                        startTime: "11:00pm",
                        endTime: "11:00pm",
                        onTap: () {},
                        onInvoice: () {
                          Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                        },
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                    ]),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
