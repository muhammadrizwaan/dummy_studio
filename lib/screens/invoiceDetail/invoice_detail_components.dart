
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class InvoiceDetailComponents{
  Widget getLogoContainer(){
    return Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: AppSizes.height * 0.02),
            Image(
              image: AssetImage(Assets.invoiceLogo),
            ),
            SizedBox(height: AppSizes.height * 0.02),
            Text('Preimer Transports',
              style: TextStyle(
                fontFamily: Assets.poppinsRegular,
                fontSize: 18,
                color: AppColors.colorBlack,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getLocationContainer(){
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
          ]
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.1,
                child: Image(image: AssetImage(Assets.locationCircleIcon),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: AppSizes.width * 0.05),
              Container(
                // height: AppSizes.height * 0.14,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: AppSizes.height * 0.085,
                      width: AppSizes.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.fromBorderSide()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('From - Anguilla',
                            style: TextStyle(
                                fontFamily: Assets.poppinsRegular,
                                fontSize: 12,
                                color: AppColors.colorBlack.withOpacity(0.4),
                                // fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('Bonarka City Center',
                            style: TextStyle(
                                fontFamily: Assets.poppinsBold,
                                fontSize: 14,
                                color: AppColors.colorBlack,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: AppSizes.height * 0.06,
                      width: AppSizes.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.fromBorderSide()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('To - Australia',
                            style: TextStyle(
                              fontFamily: Assets.poppinsRegular,
                              fontSize: 12,
                              color: AppColors.colorBlack.withOpacity(0.4),
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('My Home',
                            style: TextStyle(
                                fontFamily: Assets.poppinsBold,
                                fontSize: 14,
                                color: AppColors.colorBlack,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
          Divider(height: 10,),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            children: [
              Text('ID:',
                style: TextStyle(
                    fontFamily: Assets.poppinsRegular,
                    fontSize: 13,
                    color: AppColors.colorBlack,
                    // fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                width: 04,
              ),
              Text("5431443675434214", style: TextStyle(
                fontFamily: Assets.poppinsRegular,
                fontSize: 13,
                color: AppColors.colorBlack.withOpacity(0.4,),
                // fontWeight: FontWeight.bold
              ),),
              SizedBox(
                width: 80,
              ),
              Text('Today: 5:15 pm',
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

  Widget getTotalContainer (){
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.03),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Job Name',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text('1100KG Container',
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
              Text('Weight',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text('246KG',
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
              Text('Total Price:',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text('AED ',
                    style: TextStyle(
                      fontFamily: Assets.poppinsMedium,
                      fontSize: 12,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('24,000',
                    style: TextStyle(
                      fontFamily: Assets.poppinsMedium,
                      fontSize: 12,
                      color: AppColors.colorBlack,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getInvoiceLable(@required String lable_name){
    return Text(lable_name,
      style: TextStyle(
          fontFamily: Assets.poppinsMedium,
          fontSize: 16,
          color: AppColors.colorBlack,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget getSignatureBox(){
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: AppSizes.height * 0.18,
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image(
        image: AssetImage(Assets.signature),
      ),
    );
  }

  Widget getReviewContainer(){
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: Image(
        image: AssetImage(Assets.ratingReviewIcon),
      ),
    );
  }

  Widget getRemarks({@required String text}){
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
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


}