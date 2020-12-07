

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class JobDetailsComponents{
  Widget getLocationContainer(){
    return Container(
      margin: EdgeInsets.only(top: AppSizes.height * 0.05),
      color:Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.12,
                child: Image(image: AssetImage(Assets.userLocation),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: AppSizes.width * 0.03),
              Container(
                // height: AppSizes.height * 0.14,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: AppSizes.height * 0.082,
                      width: AppSizes.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.fromBorderSide()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pickup Location',
                            style: TextStyle(
                              fontFamily: Assets.poppinsRegular,
                              fontSize: 12,
                              color: AppColors.colorBlack,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.002),
                          Text('1 Ash Park, Pembroke Dock, SA7254, Drury Lane, Oldham, OL9 7PH',
                            style: TextStyle(
                              fontFamily: Assets.poppinsLight,
                              fontSize: 12,
                              color: AppColors.colorBlack,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.height * 0.01),
                    Container(
                      // height: AppSizes.height * 0.08,
                      width: AppSizes.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.fromBorderSide()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dropoff Location',
                            style: TextStyle(
                              fontFamily: Assets.poppinsRegular,
                              fontSize: 12,
                              color: AppColors.colorBlack,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.002),
                          Text('1 Ash Park, Pembroke Dock, SA6478, Drury Lane, Dubai, OL9 7PH',
                            style: TextStyle(
                              fontFamily: Assets.poppinsLight,
                              fontSize: 12,
                              color: AppColors.colorBlack,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget getExpectedRate(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 20,
              height: 20,
              child: Image(image: AssetImage(Assets.percentageIcon),
                fit: BoxFit.cover,
              )
          ),
          SizedBox(width: AppSizes.width * 0.03,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rate',
                  style: TextStyle(
                      fontFamily: Assets.poppinsRegular,
                      fontSize: 12,
                      color: AppColors.colorBlack
                  ),
                ),
                SizedBox(height: AppSizes.height * 0.001),
                Text('AED 10,000',
                  style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.colorBlack
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget getLoadImages({@required String images}){
    return Container(
      height: AppSizes.height * 0.08,
      width: AppSizes.width * 0.008,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5)
      ),
      child: Image(image: AssetImage(images),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget gettabsAppBarDelete(
      {@required String text, @required Function onPress,@required String clickableText, @required Function onTap,@required String tag,}) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSizes.width * 0.05,
        right: AppSizes.width * 0.05,
        top: AppSizes.width * 0.05,
        bottom: AppSizes.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => onPress(),
                child: Container(
                  height: AppSizes.height*0.04,
                  width: AppSizes.width*0.04,
                  child: Image.asset(
                      'assets/png/back_arrow_otp.png'
                  ),
                ),
              ),
              SizedBox(width: 15),
              TextView.getAppBarText(
                  text, color:
              AppColors.colorBlack
              ),
            ],
          ),
          GestureDetector(
            onTap: () => onTap(),
            child: Text(
              tag == "Placed"?
                "Delete": "",
              style: TextStyle(
                color: AppColors.colorDelete,
                fontFamily: Assets.poppinsRegular,
                fontSize: 14,
              )
            ),
          ),
          /*RichText(
            text: TextSpan(
              text: clickableText,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 12,
                fontFamily: Assets.poppinsRegular,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => onTap(),
            ),
          ),*/

        ],
      ),
    );
  }
}