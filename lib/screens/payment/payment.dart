import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bank/bank_screen.dart';
import 'package:truckoom_shipper/screens/payment/payment_component.dart';
import 'package:truckoom_shipper/screens/payment/payment_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class Payment extends StatefulWidget {
  int loadId;
  Payment({@required this.loadId});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  PaymentProvider _paymentProvider;
  PaymentComponents _paymentComponents;
  TextEditingController _promoCode;


  @override
  void initState() {
    super.initState();
    _paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    _paymentProvider.init(context: context, LoadId: widget.loadId);
    _paymentComponents = PaymentComponents();
    _promoCode = TextEditingController();
  }



  @override
  Widget build(BuildContext context) {
    Provider.of<PaymentProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.white,
            child: _paymentProvider.isDataFetched?
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidgets.tabsAppBar2(
                        text: "Payment Method",
                        onPress: () {
                          Navigator.pop(context);
                        },
                    ),
                    CommonWidgets.getWalletPriceBox(
                        walletPrice: _paymentProvider.totalPrice.toString()
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(AppSizes.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: AppSizes.height * 0.02),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, SlideRightRoute(page: Bank()));
                                  },
                                  child: CommonWidgets.getPayField(
                                      isPassword: false,
                                      leftIcon: Assets.radioActiveIcon,
                                      // textEditingController: email,
                                      hintText: "Credit Card"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CommonWidgets.getPayField(
                                    isPassword: false,
                                    leftIcon: Assets.radioUnactiveIcon,
                                    // textEditingController: email,
                                    hintText: "Credit"),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // CommonWidgets.getPayField(
                                //     isPassword: false,
                                //     leftIcon: Assets.radioUnactiveIcon,
                                //     // textEditingController: email,
                                //     hintText: "Bank Transfer"),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // CommonWidgets.getPayField(
                                //     isPassword: false,
                                //     leftIcon: Assets.radioUnactiveIcon,
                                //     // textEditingController: email,
                                //     hintText: "Cash"),
                                SizedBox(
                                  height: 30,
                                ),
                                _paymentComponents.getTotalContainer(
                                    context: context,
                                    jobName: _paymentProvider.getLoadCostData().result.loadId.toString(),
                                    total: _paymentProvider.totalPrice.toString(),
                                    couponDiscount: _paymentProvider.couponDiscount.toString(),
                                    vatAmount: _paymentProvider.vatAmount.toString(),
                                    shipperCost: _paymentProvider.newShipperCost.toString(),
                                ),

                                // Container(
                                //   height: AppSizes.height*0.20,
                                //   width: AppSizes.width,
                                //   decoration: BoxDecoration(
                                //     color: AppColors.lightGray,
                                //     border: Border.all(color: AppColors.lightGray),
                                //     borderRadius: BorderRadius.circular(5),
                                //   ),
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         height: AppSizes.height*0.06,
                                //         width: AppSizes.width,
                                //         padding: EdgeInsets.only(top: AppSizes.width*0.05, left: AppSizes.width*0.03,),
                                //         child: TextView.getLabelHeadingText04("Load Summary", color: AppColors.black),
                                //       ),
                                //       SizedBox(
                                //         height: 10,
                                //       ),
                                //       Container(
                                //         padding: EdgeInsets.only(left: AppSizes.width*0.03, right: AppSizes.width*0.03),
                                //         child: Row(
                                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                //             TextView.getLabelText04("Amount", color: AppColors.black.withOpacity(0.6)),
                                //             TextView.getLabelText04("AED 500", color: AppColors.black.withOpacity(0.6)),
                                //           ],
                                //         ),
                                //       ),
                                //       Container(
                                //         padding: EdgeInsets.only(left: AppSizes.width*0.03, right: AppSizes.width*0.03, top: AppSizes.width*0.02),
                                //         child: Row(
                                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                //             TextView.getLabelText04("Discount", color: AppColors.black.withOpacity(0.6),),
                                //             TextView.getLabelText04("AED 250", color: AppColors.black.withOpacity(0.6)),
                                //           ],
                                //         ),
                                //       ),
                                //       Container(
                                //         padding: EdgeInsets.only(left: AppSizes.width*0.03, right: AppSizes.width*0.03, top: AppSizes.width*0.02),
                                //         child: Row(
                                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                //             TextView.getLabelHeadingText04("Total Amount", color: AppColors.black),
                                //             TextView.getLabelHeadingText04("AED 250", color: AppColors.black),
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Container(
                                  padding: EdgeInsets.only(left: AppSizes.width*0.03, right: AppSizes.width*0.03, top: AppSizes.width*0.03,),
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Note:  ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: Assets.poppinsRegular,
                                          color: AppColors.yellow,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: 'Payment is due in advance for approved jobs unless agreed upon otherwise',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Assets.poppinsRegular,
                                                color: AppColors.colorBlack.withOpacity(0.4),
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // open desired screen
                                                }
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
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
                    child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                      child: CommonWidgets.applyCouponContainer(
                          text: 'Submit',
                          onPress: (){
                            ApplicationToast.onPayConfirmationAlert(context: context, onCancellLoad: (){
                              _paymentProvider.onAcceptedByShipper(
                                  context: context,
                                  loadId: widget.loadId,
                              );
                              Navigator.pop(context);
                            },
                              text: Strings.paymentAlertText,
                            );
                          },
                          onCouponPress: (){
                            _onPromoCode();
                          }
                      )
                    )
                ),
              ],
            ) : Center(
              child: Container(
                height: AppSizes.height * 0.15,
                child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
              ),
            ),
        ),
      ),
    );
  }
  _onPromoCode() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Scaffold(
                backgroundColor: AppColors.blackTextColor.withOpacity(0.5),
                body: Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: AppSizes.width * 0.08,
                            right: AppSizes.width * 0.08),
                        height: AppSizes.height * 0.25,
                        width: AppSizes.width,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: AppSizes.width * 0.12,
                          right: AppSizes.width * 0.12,
                          top: AppSizes.width * 0.07,
                        ),
                        padding: EdgeInsets.only(
                          top: AppSizes.height * 0.07,
                        ),
                        height: AppSizes.height * 0.23,
                        width: AppSizes.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                          Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: AppSizes.height * 0.06,
                              width: AppSizes.width,
                              margin: EdgeInsets.only(
                                  left: AppSizes.width * 0.05,
                                  right: AppSizes.width * 0.05,
                                  bottom: AppSizes.height * 0.02
                              ),
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: AppColors.lightGray,
                                border: Border.all(color: AppColors.lightGray),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Container(
                                  child: TextField(
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: Assets.poppinsLight,
                                        fontSize: 12,
                                        color: AppColors.colorBlack),
                                    controller: _promoCode,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: Strings.enterPromo,
                                      hintStyle: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        fontFamily: Assets.poppinsLight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  _paymentProvider.getApplyCoupon(
                                      context: context,
                                      loadId: widget.loadId,
                                      couponCode: _promoCode.text,
                                  );
                                  // hideLoader(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: AppSizes.width * 0.05,
                                      right: AppSizes.width * 0.05),
                                  width: AppSizes.width,
                                  height: AppSizes.height * 0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: AppColors.yellow,
                                    ),
                                    color: AppColors.yellow,
                                  ),
                                  child: Center(
                                    child: Text(
                                      Strings.apply,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: AppColors.white,
                                        fontFamily: Assets.poppinsLight,
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(height: AppSizes.height * 0.01),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: AppSizes.width * 0.42),
                        height: AppSizes.width * 0.15,
                        width: AppSizes.width * 0.15,
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          border:
                          Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Container(
                          //padding: EdgeInsets.all(AppSizes.width * 0.025),
                          child: Image(
                            image: AssetImage(Assets.iconCoupon),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          hideLoader(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: AppSizes.width * 0.81,
                              top: AppSizes.height * 0.015),
                          height: AppSizes.width * 0.1,
                          width: AppSizes.width * 0.1,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(color: AppColors.yellow),
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                          child: Icon(
                            Icons.clear,
                            color: AppColors.yellow,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      },
    };
  }
  hideLoader(BuildContext context) {
    _promoCode.text = "";
    Navigator.of(context).pop();
  }

}
