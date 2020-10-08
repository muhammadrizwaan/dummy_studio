

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/invoice/invoice_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Invoice extends StatefulWidget {
  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  InvoiceComponents _invoiceComponents;

  @override
  void initState() {
    super.initState();
    _invoiceComponents = InvoiceComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.white,
            child: Column(
              children: [
                CommonWidgets.tabsAppBar2(
                    text: "Invoice",
                    iconName: Assets.backArrow,
                    onPress: (){
                      Navigator.pop(context);
                    }
                ),
                Divider(height: 10,),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                        child: Column(
                            children: [
                              SizedBox(height: AppSizes.height * 0.02,),
                              _invoiceComponents.getInvoiceContainer(
                                jobDetail: "1100 KG Container",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                price: "Price: AED 260",
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _invoiceComponents.getInvoiceContainer(
                                jobDetail: "1100 KG Container",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                price: "Price: AED 260",
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _invoiceComponents.getInvoiceContainer(
                                jobDetail: "1100 KG Container",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                price: "Price: AED 260",
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _invoiceComponents.getInvoiceContainer(
                                jobDetail: "1100 KG Container",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                price: "Price: AED 260",
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _invoiceComponents.getInvoiceContainer(
                                jobDetail: "1100 KG Container",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                price: "Price: AED 260",
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _invoiceComponents.getInvoiceContainer(
                                jobDetail: "1100 KG Container",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                price: "Price: AED 260",
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _invoiceComponents.getInvoiceContainer(
                                jobDetail: "1100 KG Container",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                price: "Price: AED 260",
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _invoiceComponents.getInvoiceContainer(
                                jobDetail: "1100 KG Container",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                price: "Price: AED 260",
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                            ]
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        )
      ),
    );
  }
}
