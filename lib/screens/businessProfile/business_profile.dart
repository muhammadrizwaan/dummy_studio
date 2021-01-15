
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessEditProfile/business_edit_profile.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  onBellTap: () {
                    Navigator.pushReplacement(
                        context, SlideRightRoute(page: BusinessEditProfile()));
                  }),
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
                                  country: Constants.getCityName()),
                          SizedBox(height: AppSizes.height * 0.02),
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
                            licenseExpiryDate:
                                Constants.getLicenseExpiryDate() == "" ? "":
                                    DateTimeFormat.format(DateTime.parse(Constants.getLicenseExpiryDate()), format: 'M j, Y'),
                          ),
                          SizedBox(height: AppSizes.height * 0.03),
                          Constants.getLicenseImages().length > 0 ?
                          Container(
                            height: AppSizes.height * 0.25,
                            child: new Swiper(
                              itemCount: Constants.getLicenseImages().length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // color: Colors.amber,
                                    image: DecorationImage(
                                        image: NetworkImage(baseUrl+(Constants.getLicenseImages()[index]["FilePath"])),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                              layout: SwiperLayout.DEFAULT,
                              viewportFraction: 0.8,
                              // itemHeight: AppSizes.height * 0.1,
                              scale: 0.9,
                              pagination: new SwiperPagination(
                                builder: new DotSwiperPaginationBuilder(
                                  color: AppColors.grey,
                                  activeColor: AppColors.yellow,
                                ),
                              ),
                            ),
                          ):
                              CommonWidgets.onNullData(text: "No Images")
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
