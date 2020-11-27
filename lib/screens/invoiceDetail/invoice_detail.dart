
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class InvoiceDetail extends StatefulWidget {
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  InvoiceDetailComponents _invoiceDetailComponents;
  var rating = 3.0;

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
          color: AppColors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  CommonWidgets.tabsAppBar2(
                      text: "Invoice Detail",
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
                              SizedBox(height: AppSizes.height*0.02),
                              //_invoiceDetailComponents.getReviewContainer(),
                              SmoothStarRating(
                                rating: rating,
                                isReadOnly: false,
                                size: 30,
                                color: AppColors.yellow,
                                borderColor: AppColors.grey,
                                filledIconData: Icons.star,
                                halfFilledIconData: Icons.star_half,
                                defaultIconData: Icons.star_border,
                                starCount: 5,
                                allowHalfRating: true,
                                spacing: 2.0,
                                onRated: (value) {
                                  print("rating value -> $value");
                                  // print("rating value dd -> ${value.truncate()}");
                                },
                              ),
                              SizedBox(height: AppSizes.height*0.02),
                              _invoiceDetailComponents.getInvoiceLable("Remarks"),
                              _invoiceDetailComponents.getRemarks(
                                  text: 'Proin ex ipsum, facilisis id tincidunt sed, vulputate in lacus. Donec pharetra faucibus leo, vitae vestibulum leo scelerisque eu. Nam enim dolor, porta at ex ut, eleifend tristique metus. Integer sit'
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, vertical: AppSizes.height * 0.01),
                  child: _invoiceDetailComponents.getInvoiceButtonsContainer(
                      share: "Share",
                      download: "Download",
                      onShare: (){},
                      onDownload: (){}
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }


}
