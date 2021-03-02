import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class InvoiceDetailComponents {
  Widget getLogoContainer(
      {@required String invoiceLogo, @required String name}) {
    return Center(
      child: Container(
        child: Column(
          children: [
            // Container(
            //   height: AppSizes.height * 0.12,
            //   width: AppSizes.width * 0.25,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(100)
            //   ),
            //   child: Image(
            //     image: invoiceLogo == ""
            //         ? AssetImage(Assets.invoiceLogo)
            //         : NetworkImage('$baseUrl' + '$invoiceLogo'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // SizedBox(height: AppSizes.height * 0.02),
            Text(
              name,
              style: TextStyle(
                  fontFamily: Assets.poppinsRegular,
                  fontSize: 18,
                  color: AppColors.colorBlack,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget getLocationContainer(
      {@required String pickupLocation,
      @required String dropOffLocation,
      @required String Id,
        @required String dateTime
      }) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      decoration: BoxDecoration(
          color: AppColors.white,
          // border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500].withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0))
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.105,
                padding: EdgeInsets.only(top: AppSizes.height * 0.006),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.colorBlack),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.yellow),
                    )
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: 6),
              //   height: AppSizes.height * 0.108,
              //   child: Image(
              //     image: AssetImage(Assets.locationCircleIcon),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              SizedBox(width: AppSizes.width * 0.05),
              Container(
                // height: AppSizes.height * 0.14,
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.height * 0.09,
                      width: AppSizes.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.fromBorderSide()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.pickupLocation,
                            style: TextStyle(
                              fontFamily: Assets.poppinsRegular,
                              fontSize: 12,
                              color: AppColors.colorBlack.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            pickupLocation,
                            maxLines: 2,
                            style: TextStyle(
                                fontFamily: Assets.poppinsBold,
                                fontSize: 14,
                                color: AppColors.colorBlack,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: AppSizes.height * 0.09,
                      width: AppSizes.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.fromBorderSide()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.dropoffLocation,
                            style: TextStyle(
                              fontFamily: Assets.poppinsRegular,
                              fontSize: 12,
                              color: AppColors.colorBlack.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            dropOffLocation,
                            maxLines: 2,
                            style: TextStyle(
                                fontFamily: Assets.poppinsBold,
                                fontSize: 14,
                                color: AppColors.colorBlack,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            height: 10,
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'ID:',
                    style: TextStyle(
                      fontFamily: Assets.poppinsRegular,
                      fontSize: 13,
                      color: AppColors.colorBlack.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 04,
                  ),
                  Text(
                    Id,
                    style: TextStyle(
                      fontFamily: Assets.poppinsRegular,
                      fontSize: 13,
                      color: AppColors.colorBlack.withOpacity(
                        0.4,
                      ),
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  //SizedBox(width: 80,),
                ],
              ),
              Text(
                dateTime,
                style: TextStyle(
                  fontFamily: Assets.poppinsRegular,
                  fontSize: 12,
                  color: AppColors.colorBlack.withOpacity(0.4),
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getStatus({@required String status, @required String dateTime}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(
                // dateTime,
                CommonWidgets.getDateTimeFormate(time: dateTime),
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget getStatusBold({@required String status, @required String dateTime}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(
                // dateTime,
                CommonWidgets.getDateTimeFormate(time: dateTime),
                style: TextStyle(
                    fontFamily: Assets.poppinsMedium,
                    fontSize: 12,
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getTotalContainer({
    @required BuildContext context,
    @required String jobName,
    @required String weight,
    @required String total,
    @required String couponDiscount,
    @required String vatAmount,
    @required String shipperCost
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.03),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Job ID',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(
                jobName,
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weight',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(
                weight,
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cost',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'AED ',
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    shipperCost,
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.colorBlack,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coupon Discount',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'AED ',
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    couponDiscount,
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.colorBlack,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vat Amount',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'AED ',
                    style: TextStyle(
                        fontFamily: Assets.poppinsLight,
                        fontSize: 12,
                        color: AppColors.yellow,
                        // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    vatAmount,
                    style: TextStyle(
                        fontFamily: Assets.poppinsLight,
                        fontSize: 12,
                        color: AppColors.colorBlack,
                        // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price:',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'AED ',
                    style: TextStyle(
                        fontFamily: Assets.poppinsMedium,
                        fontSize: 12,
                        color: AppColors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    total,
                    style: TextStyle(
                        fontFamily: Assets.poppinsMedium,
                        fontSize: 12,
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getInvoiceLable(@required String lable_name) {
    return Text(
      lable_name,
      style: TextStyle(
          fontFamily: Assets.poppinsMedium,
          fontSize: 16,
          color: AppColors.colorBlack,
          fontWeight: FontWeight.bold),
    );
  }


  Widget getReviewContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: Image(
        image: AssetImage(Assets.ratingReviewIcon),
      ),
    );
  }

  Widget getRemarks({@required String text}) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 25),
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.profileTextColor,
          fontSize: 12,
          fontFamily: Assets.poppinsLight,
        ),
      ),
    );
  }

  Widget getInvoiceButtonsContainer(
      {@required String share,
      @required String download,
      @required Function onShare,
      @required Function onDownload}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onDownload(),
            child: Container(
              height: AppSizes.height * 0.065,
              width: AppSizes.width * 0.4,
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(
                  05,
                ),
              ),
              alignment: Alignment.center,
              child: TextView.getLabelText04(download, color: Colors.white),
            ),
          ),
          // SizedBox(
          //   width: 20,
          // ),
          GestureDetector(
            onTap: () => onShare(),
            child: Container(
              height: AppSizes.height * 0.06,
              width: AppSizes.width * 0.42,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(05),
                  border: Border.all(
                    color: AppColors.yellow,
                  )),
              alignment: Alignment.center,
              child: TextView.getLabelText04(share,
                  color: AppColors.yellow.withOpacity(
                    0.8,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
