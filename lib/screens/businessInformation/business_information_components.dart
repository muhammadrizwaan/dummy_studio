import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class BusinessInformationComponents {
  Widget getBusinessSignupStep() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Step ',
          style: TextStyle(
            fontSize: 15,
            fontFamily: Assets.poppinsRegular,
            color: AppColors.grey,
          ),
        ),
        Text(
          '2 0f 2',
          style: TextStyle(
            fontSize: 15,
            fontFamily: Assets.poppinsRegular,
            color: AppColors.yellow,
          ),
        ),
      ],
    );
  }

  Widget getImagePicker({
    @required Function onPress,
  }) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Center(
        child: DottedBorder(
          color: AppColors.addVehicleBorderColor,
          // dashPattern: [6, 3, 2, 3],
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          // padding: EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Container(
              width: AppSizes.width * 0.82,
              height: AppSizes.height * 0.07,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    WebSymbols.plus_circle,
                    size: 15,
                    color: AppColors.colorBlack.withOpacity(0.9),
                  ),
                  TextView.getLabelText04(
                    ' Attach Copy of License',
                    color: AppColors.colorBlack.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDateField({@required String date, @required Function onDate}) {
    return GestureDetector(
      onTap: () => onDate(),
      child: Container(
        height: AppSizes.height * 0.07,
        width: AppSizes.width,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.02),
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: 0.6,
              child: Icon(
                LineariconsFree.license,
                size: 20,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 5),
                width: AppSizes.width * 0.65,
                child:
                    TextView.getLabel2Text04(date, color: AppColors.colorBlack),
              ),
            ),
            Container(
                height: AppSizes.height * 0.035,
                width: AppSizes.width * 0.085,
                child: Image(
                    image: AssetImage('assets/png/check_circle_fill_pn.png')),),
          ],
        ),
      ),
    );
  }
}
