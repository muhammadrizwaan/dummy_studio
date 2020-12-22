import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessEditProfile/business_edit_profile.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class BusinessProfile extends StatefulWidget {
  String tag;

  BusinessProfile({@required this.tag});

  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  BusinessProfileComponents _businessProfileComponents;

  @override
  void initState() {
    super.initState();
    _businessProfileComponents = BusinessProfileComponents();
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
              CommonWidgets.ProfileAppBar(
                  heading: Strings.profile,
                  onTap: (){Navigator.pop(context);},
                  onBellTap: (){
                    Navigator.pushReplacement(context, SlideRightRoute(page: BusinessEditProfile()));
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
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _businessProfileComponents.getProfileImage(
                              profileImg: Constants.getUserImage()),
                          SizedBox(
                            height: AppSizes.height * 0.05,
                          ),
                          _businessProfileComponents.getProfileLable(
                              lableText: "Basic Information"),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _businessProfileComponents
                              .getBusinessProfileContainer(
                                  name: Constants.getUserName(),
                                  email: Constants.getUserEmail(),
                                  password: Constants.getPassword(),
                                  country: 'Costa Rica'),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _businessProfileComponents.getProfileLable(
                              lableText: "Business Information"),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _businessProfileComponents
                              .getBusinessInfoProfileContainer(
                                  businessName: Constants.getCommpanyName(),
                                  phoneNumber: Constants.getCommpanyPhone(),
                                  trn: Constants.getCommpanyTrn(),
                                  licenseExpiryDate: Constants.getLicenseExpiryDate().split('T').first
                          ),
                          Center(
                            child: Image(
                              image: AssetImage(Assets.licenceImg),
                              width: 400,
                              height: 200,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.yellow
                                ),
                                height: 10,
                                width: 10,
                              ),
                              SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.grey
                                ),
                                height: 10,
                                width: 10,
                              )
                            ],
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
