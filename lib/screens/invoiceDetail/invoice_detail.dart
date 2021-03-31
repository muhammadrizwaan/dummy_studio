import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail_components.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class InvoiceDetail extends StatefulWidget {
  int Id;

  InvoiceDetail({@required this.Id});

  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  InvoiceDetailComponents _invoiceDetailComponents;
  InvoiceDetailProvider _invoiceDetailProvider;
  var rating = 3.0;

  @override
  void initState() {
    super.initState();
    _invoiceDetailComponents = InvoiceDetailComponents();
    _invoiceDetailProvider =
        Provider.of<InvoiceDetailProvider>(context, listen: false);
    _invoiceDetailProvider.init(context: context, Id: widget.Id);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<InvoiceDetailProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColors.white,
          child: _invoiceDetailProvider.isDataFetched
              ? Stack(
                  children: [
                    Column(
                      children: [
                        CommonWidgets.tabsAppBar2(
                            text: "Invoice Detail",
                            onPress: () {
                              Navigator.pop(context);
                            }),
                        Expanded(
                          child: ListView(
                            children: [
                              Container(
                                margin: EdgeInsets.all(AppSizes.width * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _invoiceDetailComponents.getLogoContainer(
                                        invoiceLogo: _invoiceDetailProvider
                                            .invoiceDetailResponse
                                            .result
                                            .transporterLogo,
                                        name: _invoiceDetailProvider
                                            .invoiceDetailResponse
                                            .result
                                            .transporterName),
                                    _invoiceDetailComponents.getLocationContainer(
                                        pickupLocation: _invoiceDetailProvider
                                            .invoiceDetailResponse
                                            .result
                                            .pickupLocation,
                                        dropOffLocation: _invoiceDetailProvider
                                            .invoiceDetailResponse
                                            .result
                                            .dropOffLocation,
                                        Id: _invoiceDetailProvider
                                            .invoiceDetailResponse
                                            .result
                                            .invoiceId
                                            .toString(),
                                        dateTime: _invoiceDetailProvider
                                            .invoiceDetailResponse
                                            .result
                                            .completedDate),
                                    _invoiceDetailComponents.getTotalContainer(
                                        context: context,
                                        jobName: _invoiceDetailProvider.invoiceDetailResponse.result.invoiceId.toString(),
                                        weight: _invoiceDetailProvider.invoiceDetailResponse.result.weight,
                                        shipperCost: _invoiceDetailProvider.invoiceDetailResponse.result.shipperCost.toString(),
                                        couponDiscount: _invoiceDetailProvider.invoiceDetailResponse.result.couponDiscount.toString(),
                                        vatAmount: _invoiceDetailProvider.invoiceDetailResponse.result.vatAmount.round().toString(),
                                        total: _invoiceDetailProvider.invoiceDetailResponse.result.totalShipperCost.toString()),
                                    _invoiceDetailComponents.getInvoiceLable("Status"),
                                    _invoiceDetailComponents.getStatus(
                                        status: "Loading",
                                        dateTime: _invoiceDetailProvider.loadingDate),
                                    _invoiceDetailComponents.getStatus(
                                        status: "On the way",
                                        dateTime: _invoiceDetailProvider.onTheWayDate),
                                    _invoiceDetailComponents.getStatus(
                                        status: "Unloading",
                                        dateTime: _invoiceDetailProvider.unLoadingDate),
                                    _invoiceDetailComponents.getStatusBold(
                                        status: "Delivered",
                                        dateTime: _invoiceDetailProvider.deliveredDate),

                                    _invoiceDetailComponents.getInvoiceLable("E-Signature"),
                                    _invoiceDetailProvider.invoiceDetailResponse.result.eSignature == null ?
                                    CommonWidgets.onNullData(text: "No Signature") :
                                    CommonWidgets.getSignatureBox(eSignature: _invoiceDetailProvider.invoiceDetailResponse.result.eSignature),

                                    _invoiceDetailComponents
                                        .getInvoiceLable("Reviews"),
                                    SizedBox(height: AppSizes.height * 0.02),
                                    //_invoiceDetailComponents.getReviewContainer(),
                                    SmoothStarRating(
                                      rating: _invoiceDetailProvider.invoiceDetailResponse.result.ratingByTransporter,
                                      isReadOnly: true,
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
                                    SizedBox(height: AppSizes.height * 0.02),
                                    _invoiceDetailComponents
                                        .getInvoiceLable("Remarks"),
                                    _invoiceDetailProvider.invoiceDetailResponse
                                                .result.remarks ==
                                            ""
                                        ? CommonWidgets.onNullData(
                                            text: "No Remarks")
                                        : _invoiceDetailComponents.getRemarks(
                                            text: _invoiceDetailProvider
                                                .invoiceDetailResponse
                                                .result
                                                .remarksByTransporter,
                                          ),
                                    SizedBox(height: AppSizes.height * 0.06),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.width * 0.05,
                            vertical: AppSizes.height * 0.01),
                        child:
                            _invoiceDetailComponents.getInvoiceButtonsContainer(
                                share: "Share",
                                download: "Download",
                                onShare: () {
                                  _invoiceDetailProvider.getInvoiceDownload(
                                      context: context,
                                      Id: widget.Id,
                                      differentiate: 1
                                  );
                                },
                                onDownload: () {
                                  _invoiceDetailProvider.getInvoiceDownload(
                                      context: context,
                                      Id: widget.Id,
                                      differentiate: 0
                                  );
                                },
                            ),
                      ),
                    )
                  ],
                )
              : Center(
                  child: Container(
                    height: AppSizes.height * 0.15,
                    child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                  ),
                ),
        ),
      ),
    );
  }
}
