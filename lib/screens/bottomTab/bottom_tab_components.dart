
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class BottomTabComponents {
  Widget getTextField(
      { @required String leftIcon,@required TextEditingController textEditingController, @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.05,
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: Image(image: AssetImage('$leftIcon')) ,
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14,
            fontFamily: Assets.poppinsLight,
          ),
        ),
      ),
    );
  }

  Widget getVehicleDetail(
      { @required String leftIcon, @required String vehicleType, @required String vehicleDetail}) {
    return Container(
      // height: AppSizes.height * 0.05,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
        padding: EdgeInsets.all(AppSizes.width * 0.03),
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image(image: AssetImage('$leftIcon')) ,
          SizedBox(width: AppSizes.width * 0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Text('$vehicleType',
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsMedium,
                  color: AppColors.colorBlack,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text('$vehicleDetail',
                style: TextStyle(
                    fontSize:11,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.colorBlack,
                    // fontWeight: FontWeight.bold
                ),
              ),
            ],
          )
        ],
      )
    );
  }


  //  £££££££££££££££££££££££££££   My Jobs Components   £££££££££££££££££££

  Widget getSelectViewText (){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      child: Text('Select View',
        style: TextStyle(
            fontSize:14,
            fontFamily: Assets.poppinsLight,
            color: AppColors.colorBlack,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget onSelectViewType({@required String text, @required Function onPress}){
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.width * 0.03,
          vertical: AppSizes.width * 0.02,
        ),
        // width: AppSizes.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.yellow),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text('$text',
          style: TextStyle(
              fontSize:12,
              fontFamily: Assets.poppinsLight,
              color: AppColors.yellow,
              // fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget getJobContainer(
      {
        @required String jobDetail,
        @required String pickUpLocation,
        @required String destinationLocation,
        @required String startDate,
        @required String endDate,
        @required String status,
        @required Function onEdit,
        @required Function onDelete
      })
  {
    return Container(
      // height: AppSizes.height * 0.05,
      // width: AppSizes.width,
      padding: EdgeInsets.all(AppSizes.width * 0.02),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(jobDetail,
            style: TextStyle(
              fontSize:12,
              fontFamily: Assets.poppinsRegular,
              color: AppColors.colorBlack,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: AppSizes.height * 0.01,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: AssetImage(Assets.df_pk_job),
                      height: 40,
                      width: 20,
                    ),
                    SizedBox(width: AppSizes.width * 0.01,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pickUpLocation,
                          style: TextStyle(
                              fontSize:12,
                              fontFamily: Assets.poppinsRegular,
                              color: AppColors.locationText,
                              // fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(destinationLocation,
                          style: TextStyle(
                              fontSize:12,
                              fontFamily: Assets.poppinsRegular,
                              color: AppColors.locationText,
                              // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(startDate,
                      style: TextStyle(
                          fontSize:12,
                          fontFamily: Assets.poppinsRegular,
                          color: AppColors.colorBlack,
                          // fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(endDate,
                      style: TextStyle(
                          fontSize:12,
                          fontFamily: Assets.poppinsRegular,
                          color: AppColors.colorBlack,
                          // fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
          SizedBox(height: AppSizes.height * 0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Status',
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.status,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(status,
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsMedium,
                  color: AppColors.yellow,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: AssetImage(Assets.edit_icon),

              ),
              SizedBox(width: AppSizes.width * 0.01,),
              Text('Edit',
                style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.yellow,
                    // fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: AppSizes.width * 0.04,),
              Image(image: AssetImage(Assets.delete_icon),

              ),
              SizedBox(width: AppSizes.width * 0.01,),
              Text('Delete',
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsMedium,
                  color: AppColors.redColor,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  // £££££££££££££££££££££     Transections Components ££££££££££££££££££££££££

  Widget getTransectionsContainer(
      {
        @required String jobDetail,
        @required String pickUpLocation,
        @required String destinationLocation,
        @required String startDate,
        @required String endDate,
        @required String price,
        @required Function onInvoice,
      })
  {
    return Container(
      // height: AppSizes.height * 0.05,
      // width: AppSizes.width,
      padding: EdgeInsets.all(AppSizes.width * 0.02),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(jobDetail,
                style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(price,
                style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.01,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: AssetImage(Assets.df_pk_job),
                      height: 40,
                      width: 20,
                    ),
                    SizedBox(width: AppSizes.width * 0.01,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pickUpLocation,
                          style: TextStyle(
                            fontSize:12,
                            fontFamily: Assets.poppinsRegular,
                            color: AppColors.locationText,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(destinationLocation,
                          style: TextStyle(
                            fontSize:12,
                            fontFamily: Assets.poppinsRegular,
                            color: AppColors.locationText,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(startDate,
                      style: TextStyle(
                        fontSize:12,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.colorBlack,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(endDate,
                      style: TextStyle(
                        fontSize:12,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.colorBlack,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
          SizedBox(height: AppSizes.height * 0.04,),
          Container(
            width: AppSizes.width,
            height: AppSizes.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.yellow,),
              color: AppColors.yellow,
            ),
            child: FlatButton(
              onPressed: () => onInvoice(),
              child: Text('view Invoice',
                // text,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: AppColors.white,
                  fontFamily: Assets.poppinsLight,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.height * 0.02,),
        ],
      ),
    );
  }



  // ££££££££££££££££££££££££  More Components  £££££££££££££££££££££££££££

  Widget getProfileContainer({@required String ProfileImg, @required String name, @required String email, }){
    return Container(
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      child: Row(
        children: [
          SizedBox(width: AppSizes.width * 0.02,),
          // CircleAvatar(
          //   backgroundImage: AssetImage(ProfileImg),
          //   radius: 40.0,
          //   foregroundColor: AppColors.white,
          // ),
          Image(image: AssetImage(Assets.profileImg),),
          SizedBox(width: AppSizes.width * 0.03,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                style: TextStyle(
                  fontSize:22,
                  fontFamily: Assets.robotoBold,
                  color: AppColors.yellow,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: AppSizes.height * 0.01,),
              Text(email,
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsLight,
                  color: AppColors.emailTextColor,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          )
        ],
      ),
    );

    }


    Widget touchableButton({@required String text, @required Function onPress}) {
      return GestureDetector(
        onTap: () => onPress(),
        child: Container(
          height: AppSizes.height * 0.06,
          width: AppSizes.width,
          color: AppColors.white,
          padding: EdgeInsets.only(left: AppSizes.width * 0.08),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(width: AppSizes.width * 0.08,),
              Text(text,
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsLight,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      );
    }

  Widget getSOSbutton({@required String text, @required Function onPress}) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        height: AppSizes.height * 0.06,
        width: AppSizes.width,
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.08),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(width: AppSizes.width * 0.08,),
            Text(text,
              style: TextStyle(
                fontSize:12,
                fontFamily: Assets.poppinsLight,
                color: AppColors.colorBlack,
                // fontWeight: FontWeight.bold
              ),
            ),
            Image(image: AssetImage(Assets.rightArrow),),
          ],
        ),
      ),
    );
  }





}