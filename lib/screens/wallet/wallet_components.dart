


import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class WalletComponents {
  Widget getWalletPriceBox({@required String walletPrice}) {
    return Container(
      width: AppSizes.width,
      height: AppSizes.height * 0.12,
      color: AppColors.lightGray,
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: AppSizes.height * 0.12,
            width: AppSizes.width * 0.12,
            child: Image(image: AssetImage(Assets.walletIcon2),
            ),
          ),
          SizedBox(width: AppSizes.width*0.02),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Total Value',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'AED',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.colorBlack,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: AppSizes.width*0.02),
                  Text(
                    walletPrice,
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.colorBlack,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getDetailWalletBox({@required String alreadyPaid, @required String pending}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: AppSizes.width*0.4,
          height: AppSizes.height * 0.14,
          //color: AppColors.blueColor,
            decoration: BoxDecoration(
                color: AppColors.white,
                //border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  /*BoxShadow(
                      color: AppColors.white,
                      //spreadRadius: 0.5,
                      //blurRadius: 0.5,
                      offset: Offset(0, 0))*/
                ]),
          margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'AED',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: AppSizes.width*0.02),
                  Text(
                    alreadyPaid,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Text(
                'Paid',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.colorGreenDark,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),

        ),
        //SizedBox(width: AppSizes.width*0.01),
        Container(
          width: AppSizes.width*0.4,
          height: AppSizes.height * 0.14,
          //color: AppColors.blueColor,
          decoration: BoxDecoration(
              color: AppColors.white,
              //border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                /*BoxShadow(
                      color: AppColors.white,
                      //spreadRadius: 0.5,
                      //blurRadius: 0.5,
                      offset: Offset(0, 0))*/
              ]),
          margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'AED',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: AppSizes.width*0.02),
                  Text(
                    pending,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Text(
                'Pending',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.maroonColor,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),

        ),
      ],
    );
  }

  Widget getWalletTable({@required String walletPrice}) {
    return Container(
      width: AppSizes.width,
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: AppSizes.height * 0.04,
                child: Text(
                  'Transactions',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: AppSizes.width*0.02),
            ],
          ),
          Container(
            height: AppSizes.height * 0.05,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.height * 0.01),
            color: AppColors.lightGray,
            child: Row(
              children: [
                Container(
                  width: AppSizes.width * 0.198,
                  child: Text(
                    'ID',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.black,),
                  ),
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                  width: AppSizes.width * 0.198,
                  child: Text(
                    'Name',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.black,
                        ),
                  ),
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                  width: AppSizes.width * 0.198,
                  child: Text(
                    'Amount',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.black,
                        ),
                  ),
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                  width: AppSizes.width * 0.198,
                  child: Text(
                    'Date',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.black,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getWalletTableData({
  @required String id,
    @required String name,
    @required String amount,
    @required String date
}){
    return Container(
      width: AppSizes.width,
      height: AppSizes.height * 0.04,
      color: AppColors.white,

      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.height * 0.01),
            child: Row(
              children: [
                Container(
                    height: AppSizes.height * 0.025,
                  width: AppSizes.width * 0.198,
                  child: TextView.getWalletTableDataText(id, color: AppColors.WalletTableDataColor)
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                    height: AppSizes.height * 0.025,
                  width: AppSizes.width * 0.198,
                  child: TextView.getWalletTableDataText(name, color: AppColors.WalletTableDataColor)
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                    height: AppSizes.height * 0.025,
                  width: AppSizes.width * 0.198,
                  child: TextView.getWalletTableDataBoldText(amount, color: AppColors.WalletTableDataColor)
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                  height: AppSizes.height * 0.025,
                  width: AppSizes.width * 0.198,
                  child: TextView.getWalletTableDataText(
                    DateTimeFormat.format(DateTime.parse(date), format: 'M j, Y'),
                      color: AppColors.WalletTableDataColor,
                  )
                ),
              ],
            ),
          ),
          Container(
            height: AppSizes.height * 0.002,
            color: AppColors.grey,
          )
        ],
      ),
    );

  }
}