



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import 'driver_details_components.dart';

class DriverDetailScreen extends StatefulWidget {
  final String tag;
  int driverId;
  DriverDetailScreen({@required this.tag, @required this.driverId});
  @override
  _DriverDetailScreenState createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  DriverDetailComponents _driverDetailComponents;
  DriverDetailProvider _driverDetailProvider;
  TextEditingController description;
  var rating = 3.0;
  @override
  void initState() {
    super.initState();
    _driverDetailComponents = DriverDetailComponents();
    description = TextEditingController();
    _driverDetailProvider = Provider.of<DriverDetailProvider>(context, listen: false);
    _driverDetailProvider.init(context: context, driverId: widget.driverId);
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<DriverDetailProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: _driverDetailProvider.isDataFetched? Column(
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
                      height: AppSizes.height * 0.9,
                      padding: EdgeInsets.all(AppSizes.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height * 0.01,),
                          _driverDetailComponents.getProfileImage(
                              profileImg: _driverDetailProvider.driverDetailResponse.result.profilePicture
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _driverDetailComponents.getBoxContainer(
                              name: _driverDetailProvider.driverDetailResponse.result.fullName,
                              email: _driverDetailProvider.driverDetailResponse.result.email,
                              phone_number: _driverDetailProvider.driverDetailResponse.result.phoneNumber !=null?_driverDetailProvider.driverDetailResponse.result.phoneNumber:"",
                              License_number: _driverDetailProvider.driverDetailResponse.result.licenseNumber
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          _driverDetailProvider.driverDetailResponse.result.licenseImages.length > 0 ?
                          Container(
                            height: AppSizes.height * 0.25,
                            child: new Swiper(
                              itemCount: _driverDetailProvider.driverDetailResponse.result.licenseImages.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // color: Colors.amber,
                                    image: DecorationImage(
                                        image: NetworkImage(baseUrl+_driverDetailProvider.driverDetailResponse.result.licenseImages[index].filePath),
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
                          Container(),
                          SizedBox(height: AppSizes.height * 0.02),
                          // _driverDetailComponents.getProfileLable(
                          //     lableText: 'Reviews'
                          // ),
                          // SizedBox(height: AppSizes.height * 0.01,),
                          // _driverDetailProvider.driverDetailResponse.result.ratings.isNotEmpty? Expanded(
                          //   child: ListView.builder(
                          //     itemCount: _driverDetailProvider.driverDetailResponse.result.ratings.length,
                          //       itemBuilder: (context, index){
                          //       return Column(
                          //         children: [
                          //           SizedBox(height: AppSizes.height * 0.01,),
                          //           _driverDetailComponents.getReviewsContainer(
                          //               leftIcon: _driverDetailProvider.driverDetailResponse.result.ratings[index].profilePicture,
                          //               userName: _driverDetailProvider.driverDetailResponse.result.ratings[index].fullName,
                          //               message: _driverDetailProvider.driverDetailResponse.result.ratings[index].review,
                          //               time: '3:41 PM',
                          //               ratings: _driverDetailProvider.driverDetailResponse.result.ratings[index].rating.toString(),
                          //               onPressReview: () {
                          //                 _onRatingAlert();
                          //               }
                          //           ),
                          //         ],
                          //       );
                          //   }),
                          // ):
                          // CommonWidgets.onNullData(text: "No Reviews"),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ):
          Center(
            child: Container(
              height: AppSizes.height * 0.15,
              child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  _onRatingAlert() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
                color: AppColors.blackTextColor.withOpacity(0.5),
                child: Scaffold(
                  backgroundColor: AppColors.blackTextColor.withOpacity(0.5),
                  body: Center(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: AppSizes.width * 0.12,
                            right: AppSizes.width * 0.12,
                            top: AppSizes.width * 0.07,
                          ),
                          padding: EdgeInsets.all(AppSizes.height * 0.02),
                          height: AppSizes.height * 0.5,
                          width: AppSizes.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: ListView(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: AppSizes.height * 0.02),
                                  TextView.getRatingPopUpHeaderText("Ratings & Reviews", color: AppColors.colorBlack),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  SmoothStarRating(
                                    rating: rating,
                                    isReadOnly: false,
                                    size: 30,
                                    color: AppColors.yellow,
                                    borderColor: AppColors.grey,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border,
                                    starCount: 5,
                                    allowHalfRating: true,
                                    spacing: 2.0,
                                    onRated: (value) {
                                      print("rating value -> $value");
                                      // print("rating value dd -> ${value.truncate()}");
                                    },
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  TextView.getLightText05("Remarks",
                                      color: AppColors.colorBlack,
                                      textAlign: TextAlign.center),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.02),
                                    height: AppSizes.height * 0.15,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                        Border.all(color: AppColors.borderColor)),
                                    child: TextField(
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontFamily: Assets.poppinsLight,
                                            fontSize: 12,
                                            color: AppColors.colorBlack),
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        //Normal textInputField will be displayed
                                        maxLines: 5,
                                        controller: description,
                                        // readOnly: true,
                                        decoration: InputDecoration(
                                          // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
                                          hintText: "Description",
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 12,
                                            color: AppColors.colorBlack,
                                            fontFamily: Assets.poppinsLight,
                                          ),
                                        ),
                                        textAlignVertical: TextAlignVertical.top),
                                  ),
                                  SizedBox(height: AppSizes.height * 0.03),
                                  CommonWidgets.getBottomButton(
                                      text: Strings.submit, onPress: () {})
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: AppSizes.width * 0.81,
                                top: AppSizes.height * 0.015),
                            height: AppSizes.width * 0.1,
                            width: AppSizes.width * 0.1,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.yellow),
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: AppColors.yellow,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            );
          },
        )
      },
    };
  }
}
