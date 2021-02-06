import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/dispatch/dispatch_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/dispatch/dispatch_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class Dispatch extends StatefulWidget {
  @override
  _DispatchState createState() => _DispatchState();
}

class _DispatchState extends State<Dispatch> {
  DispatchComponents _dispatchComponents;
  DispatchedProvider _dispatchedProvider;
  TextEditingController description;
  var rating;

  @override
  void initState() {
    super.initState();
    rating = 3.0;
    _dispatchComponents = DispatchComponents();
    _dispatchedProvider = Provider.of<DispatchedProvider>(context, listen: false);
    _dispatchedProvider.init(context: context);
    description = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DispatchedProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: _dispatchedProvider.isDataFetched
          ? _dispatchedProvider.tabbarResponse.result.length > 0
              ? ListView.builder(
                  itemCount: _dispatchedProvider.tabbarResponse.result.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _dispatchComponents.getJobContainer(
                          jobDetail: _dispatchedProvider.tabbarResponse.result[index].loadId.toString(),
                          pickUpLocation: _dispatchedProvider.tabbarResponse.result[index].pickupLocation,
                          destinationLocation: _dispatchedProvider.tabbarResponse.result[index].dropoffLocation,
                          startDate: _dispatchedProvider.tabbarResponse.result[index].pickupDateTime,
                          time: _dispatchedProvider.tabbarResponse.result[index].pickupDateTime,
                          status: _dispatchedProvider.tabbarResponse.result[index].status,
                          vehicleType: _dispatchedProvider.tabbarResponse.result[index].vehicleTypeName,
                          price: "${Strings.aed} ${_dispatchedProvider.tabbarResponse.result[index].shipperCost.round()}",
                          onAlert: () {
                            ApplicationToast.onDescriptionAlert(
                                context: context,
                                description: _dispatchedProvider.tabbarResponse.result[index].vehicleTypeDescription);
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                SlideRightRoute(page: JobDetails(status: "Dispatch", loadId: _dispatchedProvider.tabbarResponse.result[index].loadId)));
                          },
                          onReviews: (){
                            _onRatingAlert();
                          }
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                      ],
                    );
                  })
              : Center(
                  child: Container(
                      height: AppSizes.height * 0.15,
                      // width: AppSizes.width,
                      child:
                          CommonWidgets.onNullData(text: Strings.noAvailableLoads)),
                )
          : Center(
              child: Container(
                height: AppSizes.height * 0.15,
                // width: AppSizes.width,
                child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
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
                          height: AppSizes.height * 0.45,
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
                                  TextView.getRatingPopUpHeaderText("Review & Ratings", color: AppColors.colorBlack),
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
                                  TextView.getLightText04("Remarks",
                                      color: AppColors.colorBlack,
                                      textAlign: TextAlign.center),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizes.width * 0.02),
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
                                            color: AppColors.colorBlack.withOpacity(0.6),
                                            fontFamily: Assets.poppinsLight,
                                          ),
                                        ),
                                        textAlignVertical: TextAlignVertical.top),
                                  ),
                                  SizedBox(height: AppSizes.height * 0.03),
                                  CommonWidgets.getBottomButton(
                                      text: Strings.submit, onPress: () {
                                    hideLoader(context);
                                    Navigator.pop(context);
                                    // Navigator.push(context, SlideRightRoute(page: Invoice()));
                                  })
                                ],
                              ),
                            ],
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: Container(
                        //     margin: EdgeInsets.only(
                        //         left: AppSizes.width * 0.81,
                        //         top: AppSizes.height * 0.015),
                        //     height: AppSizes.width * 0.1,
                        //     width: AppSizes.width * 0.1,
                        //     decoration: BoxDecoration(
                        //       color: AppColors.white,
                        //       border: Border.all(color: AppColors.yellow),
                        //       borderRadius: BorderRadius.circular(
                        //         50,
                        //       ),
                        //     ),
                        //     child: Icon(
                        //       Icons.clear,
                        //       color: AppColors.yellow,
                        //       size: 25,
                        //     ),
                        //   ),
                        // ),
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
  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
