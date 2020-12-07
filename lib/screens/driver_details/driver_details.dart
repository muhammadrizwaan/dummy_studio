



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

import 'driver_details_components.dart';

class DriverDetailScreen extends StatefulWidget {
  final String tag;
  DriverDetailScreen({@required this.tag});
  @override
  _DriverDetailScreenState createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  DriverDetailComponents _driverDetailComponents;

  @override
  void initState() {
    super.initState();
    _driverDetailComponents = DriverDetailComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.tabsAppBar2(
                  text: 'Driver Details',
                  onPress: (){
                    Navigator.pop(context);
                  }
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSizes.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height * 0.01,),
                          _driverDetailComponents.getProfileImage(
                              profileImg: Assets.profileImg
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _driverDetailComponents.getBoxContainer(
                              name: 'Mathew Lawson',
                              email: 'MathewLawson@gmail.com',
                              phone_number: '(430)214-7475',
                              License_number: '743746-748478'
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _driverDetailComponents.getProfileLable(
                              lableText: 'Reviews'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _driverDetailComponents.getReviewsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Mathew Lawson',
                              message: 'Matthew Lawson is a good Driver',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _driverDetailComponents.getReviewsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Mathew Lawson',
                              message: 'Matthew Lawson is a good Driver',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _driverDetailComponents.getReviewsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Mathew Lawson',
                              message: 'Matthew Lawson is a good Driver',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _driverDetailComponents.getReviewsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Mathew Lawson',
                              message: 'Matthew Lawson is a good Driver',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _driverDetailComponents.getReviewsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Mathew Lawson',
                              message: 'Matthew Lawson is a good Driver',
                              time: '3:41 PM'
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
