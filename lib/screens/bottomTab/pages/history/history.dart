import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../animations/slide_right.dart';
import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../history/history_components.dart';
import '../../../history/history_components.dart';
import '../../../invoiceDetail/invoice_detail.dart';

class HistoryScreen extends StatefulWidget {
  String tag;

  HistoryScreen({@required this.tag});
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  HistoryComponents _components;
  String price;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = "";
    _components = HistoryComponents();
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
                iconName: Assets.bellIconUnpress,
                onPress: () {
                }),
            Divider(
              height: 10,
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
                      _components.getTransectionsContainer(
                        jobDetail: "01",
                        pickUpLocation: "ABC Port:",
                        destinationLocation: "227 Building, UAE:",
                        startDate: "11 Aug, 12:00am",
                        endDate: "12 Aug, 11:00pm",
                        price: "Price: AED 260",
                        status: "Completed",
                        onTap: () {},
                        onInvoice: () {
                          Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                        },
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _components.getTransectionsContainer(
                        jobDetail: "01",
                        pickUpLocation: "ABC Port:",
                        destinationLocation: "227 Building, UAE:",
                        startDate: "11 Aug, 12:00am",
                        endDate: "12 Aug, 11:00pm",
                        price: "Price: AED 260",
                        status: "Completed",
                        onTap: () {},
                        onInvoice: () {
                        },
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _components.getTransectionsContainer(
                        jobDetail: "01",
                        pickUpLocation: "ABC Port:",
                        destinationLocation: "227 Building, UAE:",
                        startDate: "11 Aug, 12:00am",
                        endDate: "12 Aug, 11:00pm",
                        price: "Price: AED 260",
                        status: "Completed",
                        onTap: () {},
                        onInvoice: () {
                        },
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _components.getTransectionsContainer(
                        jobDetail: "01",
                        pickUpLocation: "ABC Port:",
                        destinationLocation: "227 Building, UAE:",
                        startDate: "11 Aug, 12:00am",
                        endDate: "12 Aug, 11:00pm",
                        price: "Price: AED 260",
                        status: "Completed",
                        onTap: () {},
                        onInvoice: () {
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
