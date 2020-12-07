
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class AddLoadComponents {
  Widget getLocationContainer(){
    return Container(
      // margin: EdgeInsets.only(top: 20),
      // padding: EdgeInsets.all(AppSizes.width * 0.05),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: AppColors.borderColor)
      // ),
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
            width: 21,
              height: 21,
              child: Image(image: AssetImage(Assets.percentageIcon,),
                fit: BoxFit.fill,
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
                SizedBox(height: AppSizes.height * 0.01,),
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

  Widget getNameTextField(
      { @required IconData leftIcon, @required String hintText, @required TextEditingController textEditingController,}) {
    return Container(
      height: AppSizes.height * 0.07,
      width: AppSizes.width,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        // border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
              opacity: 0.7,
              child: Icon(
                leftIcon,
                size: 20,
              )),
          // Image(image: AssetImage('$leftIcon')) ,
          Container(
            margin: EdgeInsets.only(left: 5),
            width: AppSizes.width * 0.8,
            // color: AppColors.yellow,
            child: TextField(
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: Assets.poppinsLight,
                fontSize: 12,
                color: AppColors.colorBlack,
              ),
              controller: textEditingController,
              // readOnly: true,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  fontFamily: Assets.poppinsLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getMessageTextField(
      { @required IconData leftIcon, @required String hintText, @required TextEditingController textEditingController,}) {
    return Container(
      height: AppSizes.height * 0.12,
      width: AppSizes.width,
      padding: EdgeInsets.symmetric( horizontal: AppSizes.width * 0.03),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        // border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Opacity(
              opacity: 0.7,
              child: Icon(
                leftIcon,
                size: 20,
              ),
            ),
            // child: Image(image: AssetImage(Assets.messageIcon)),
          ),
          SizedBox(width: AppSizes.width * 0.02,),
          Container(
            width: AppSizes.width * 0.75,
            child: TextField(
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: Assets.poppinsLight,
                    fontSize: 12,
                    color: AppColors.colorBlack
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,//Normal textInputField will be displayed
                maxLines: 5,
                controller: textEditingController,
                // readOnly: true,
                decoration: InputDecoration(
                  // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    color: AppColors.colorBlack,
                    fontFamily: Assets.poppinsLight,
                  ),
                ),
                textAlignVertical: TextAlignVertical.top
            ),
          ),
        ],
      ),
    );
  }
}