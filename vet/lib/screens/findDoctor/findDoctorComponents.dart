import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet/res/assets.dart';
import 'package:vet/res/colors.dart';
import 'package:vet/res/res.dart';

class FindDoctorComponents{
  Widget getAppBar({
    Function ? onBack,
    Function ? onFilter,
    Function ? onBell,
  }){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ()=> onBack!.call(),
            child: Row(
              children: [
                Image(image: AssetImage(Assets.back_icon), height: getHeight()*0.04, width: getWidth()*0.04),
                SizedBox(width: getWidth()*0.02),
                Container(
                  width: getWidth()*0.6,
                  child: Text("Find Doctor",
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: Assets.poppinsBold,
                        fontSize: sizes.largeFontSizeC,
                        color: AppColors.blackColor
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: ()=> onFilter!.call(),
                  child: Image(image: AssetImage(Assets.home_icon), width: getWidth()*0.06, height: getHeight()*0.06),
              ),
              SizedBox(width: getWidth()*0.04),
              GestureDetector(
                onTap: ()=> onBell!.call(),
                  child: Image(
                      image:
                      AssetImage(Assets.home_icon),
                    width: getWidth()*0.06,
                    height: getHeight()*0.06,
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget textField({
    TextEditingController ? textEditingController,
  }){
    return   Container(
      height: getHeight() * 0.085,
      width:  getWidth() *.43,
      color: AppColors.blackColor,
      child: TextField(
        controller: textEditingController,
        obscureText: false,
        cursorHeight: getHeight()*.03,
        // cursorColor:Colors.black,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:BorderSide(
                  color: AppColors.grayColor,
                  width: getWidth()*.001,
                )
            ),
            border: InputBorder.none,
            // icon:ImageIcon(AssetImage(icon??"",),size: getHeight()*.030,color: AppColors.mainColor,),
            contentPadding: EdgeInsets.only(left: getWidth()*.002),
            //border: InputBorder.none,
            hintText: "Search Doctor",
            alignLabelWithHint: false,
            hintStyle: TextStyle(
              color: AppColors.greenColor,
              fontSize: getHeight()*.023,
              fontFamily:Assets.poppinsBold,
            )
        ),
      ),
    );
  }
}