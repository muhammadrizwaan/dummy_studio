
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class InvoiceDetail extends StatefulWidget {
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  InvoiceDetailComponents _invoiceDetailComponents;

  @override
  void initState() {
    super.initState();
    _invoiceDetailComponents = InvoiceDetailComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              CommonWidgets.tabsAppBar2(
                  text: "Invoice Detail",
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
                      margin: EdgeInsets.all(AppSizes.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _invoiceDetailComponents.getLogoContainer(),
                          _invoiceDetailComponents.getLocationContainer(),
                          _invoiceDetailComponents.getTotalContainer(),
                          _invoiceDetailComponents.getInvoiceLable("E-Signature"),
                          _invoiceDetailComponents.getSignatureBox(),
                          _invoiceDetailComponents.getInvoiceLable("Reviews"),
                          _invoiceDetailComponents.getReviewContainer(),
                          _invoiceDetailComponents.getInvoiceLable("Remarks"),
                          _invoiceDetailComponents.getRemarks(
                              text: 'Proin ex ipsum, facilisis id tincidunt sed, vulputate in lacus. Donec pharetra faucibus leo, vitae vestibulum leo scelerisque eu. Nam enim dolor, porta at ex ut, eleifend tristique metus. Integer sit'
                          ),
                          CommonWidgets.getBottomButton(
                              text: 'Download Invoice',
                              onPress: (){}
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
