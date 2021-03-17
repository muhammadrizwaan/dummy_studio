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
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/delivered/delivered_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/delivered/delivered_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class Delivered extends StatefulWidget {
  @override
  _DeliveredState createState() => _DeliveredState();
}

class _DeliveredState extends State<Delivered> {

  DeliveredComponents _deliveredComponents;
  DeliveredProvider _deliveredProvider;
  TextEditingController description;
  MyJobsProvider _myJobsProvider;
  ScrollController _scrollController = new ScrollController();
  int pageNumber = 0;
  var rating;

  @override
  void initState() {
    super.initState();
    rating = 0.0;
    pageNumber = 0;
    _deliveredComponents = DeliveredComponents();
    _deliveredProvider = Provider.of<DeliveredProvider>(context, listen: false);
    _deliveredProvider.init(context: context);
    description = TextEditingController();
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    _scrollController
      ..addListener(() {
        if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
          pageNumber = pageNumber + 1;
          _deliveredProvider.setIsLoading(true);
          setState(() {});
          _deliveredProvider.getDeliveredLoad(context: context, pageNumber: pageNumber);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DeliveredProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child:
      Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              color: AppColors.yellow,
              onRefresh: () => onRefresh(),
                      child: _myJobsProvider.deliveredList.length > 0 ?
                      ListView.builder(
                          controller: _scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: _myJobsProvider.deliveredList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: AppSizes.height * 0.02),
                                _deliveredComponents.getJobContainer(
                                  isRated:_myJobsProvider.deliveredList[index].isRated,
                                  jobDetail: _myJobsProvider.deliveredList[index].loadId.toString(),
                                  pickUpLocation: _myJobsProvider.deliveredList[index].pickupLocation,
                                  destinationLocation: _myJobsProvider.deliveredList[index].dropoffLocation,
                                  startDate: _myJobsProvider.deliveredList[index].pickupDateTime,
                                    endDate: _myJobsProvider.deliveredList[index].dropoffDateTime,
                                  startTime: _myJobsProvider.deliveredList[index].pickupDateTime,
                                    endTime: _myJobsProvider.deliveredList[index].dropoffDateTime,
                                  status: _myJobsProvider.deliveredList[index].status,
                                  vehicleType: _myJobsProvider.deliveredList[index].vehicleTypeName,
                                    vehicleCategory: _myJobsProvider.deliveredList[index].vehicleCategoryName,
                                  price: "${Strings.aed} ${_myJobsProvider.deliveredList[index].shipperCost}",
                                  onAlert: () {
                                    ApplicationToast.onDescriptionAlert(
                                        context: context,
                                        description: _myJobsProvider.deliveredList[index].vehicleTypeDescription);
                                  },
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        SlideRightRoute(page: JobDetails(status: "Dispatch", loadId: _myJobsProvider.deliveredList[index].loadId)));
                                  },
                                  onReviews: (){
                                    _onRatingAlert(
                                        _myJobsProvider.deliveredList[index].assignedDriverId,
                                      _myJobsProvider.deliveredList[index].loadId,
                                    );
                                  }

                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.02,
                                ),
                              ],
                            );
                          }):ListView(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(vertical: AppSizes.height * 0.3),
                              child: CommonWidgets.onNullData(text: Strings.noAvailableLoads)
                          ),
                        ],
                      )
                    )

          ),
          _deliveredProvider.isLoading?
          Container(
            height:  AppSizes.height * 0.1,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(AppColors.yellow),
              ),
            ),
          ):
          Container(),
        ],
      )
    );
  }

  _onRatingAlert(int driverId, int loadId,) {
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
                    child: Container(
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
                                        rating = value;
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
                                      height: AppSizes.height * 0.12,
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
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CommonWidgets.getBottomButton(
                                          text: Strings.submit, onPress: () {
                                            _deliveredProvider.onRatingAndReviews(
                                                context: context,
                                                score: rating,
                                                driverId: driverId,
                                                loadId: loadId,
                                                comment: description.text,
                                            );

                                        // hideLoader(context);
                                        rating = 0.0;
                                        description.text = "";
                                        // Navigator.pop(context);
                                        // Navigator.push(context, SlideRightRoute(page: Invoice()));
                                      }),
                                    )
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

  Future<Null> onRefresh() async{
    pageNumber = 0;
    await _myJobsProvider.getLoads(context: context);
  }
}
