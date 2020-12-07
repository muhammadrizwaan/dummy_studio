import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../../../bottom_tab.dart';

class Placed extends StatefulWidget {
  @override
  _PlacedState createState() => _PlacedState();
}

class _PlacedState extends State<Placed> {
  PlacedComponents _placedComponents;
  PlacedProvider _placedProvider;
  CustomPopup _loader = CustomPopup();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placedComponents = PlacedComponents();
    _placedProvider = Provider.of<PlacedProvider>(context, listen: false);
    _placedProvider.init(context: context);
    _placedProvider.getPlacedLoad(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PlacedProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: _placedProvider.getIsDataFetched()?
      ListView.builder(
        itemCount: _placedProvider.tabbarResponse.result.length,
          itemBuilder: (context, index){
          return Column(
            children: [
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                jobDetail: _placedProvider.tabbarResponse.result[index].loadId.toString(),
                pickUpLocation: _placedProvider.tabbarResponse.result[index].pickupLocation,
                destinationLocation: _placedProvider.tabbarResponse.result[index].dropoffLocation,
                startDate: "11 Aug,",
                time: '12:00am',
                status: _placedProvider.tabbarResponse.result[index].status,
                price: "AED ${_placedProvider.tabbarResponse.result[index].shipperCost.round()}",
                onAlert: () {
                  _onDescriptionAlert();
                },
                onTap: () {
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
            ],
          );
          }
      ):
      Expanded(
        child: ListView(
          children: [
            Container(
              height: AppSizes.height * 0.15,
              width: AppSizes.width * 0.15,
              child: Lottie.asset(Assets.apiLoading),
            ),
          ],
        ),
      ),
    );
  }

  _onDescriptionAlert(){
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.12,
                        right: AppSizes.width * 0.12,
                        top: AppSizes.width * 0.07,
                      ),
                      padding: EdgeInsets.all(AppSizes.height * 0.02),
                      height: AppSizes.height * 0.23,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: AppSizes.height* 0.02),
                          TextView.getAlertDescriptionText(
                              Strings.description,
                              color: AppColors.colorBlack
                          ),
                          SizedBox(width: AppSizes.width * 0.05),
                          Container(
                            height: AppSizes.height * 0.15,
                            padding: EdgeInsets.all(AppSizes.height * 0.01),
                            margin: EdgeInsets.only(top: AppSizes.height * 0.005),
                            decoration: BoxDecoration(
                              color: AppColors.alertContainer,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: 0.6,
                                  child: Icon(
                                    Icons.message,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: AppSizes.width * 0.01),
                                Container(
                                  width: AppSizes.width * 0.55,
                                  child: TextView.getLabel2Text04(
                                      "Vivamus eget aliquam dui. Integer eu arcu vel arcu suscipit ultrices quis non mauris. Aenean scelerisque, sem eu dictum commodo,ligula",
                                      color: AppColors.colorBlack
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: AppSizes.width * 0.81,
                          top: AppSizes.height * 0.015
                        ),
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
            );
          },
        )
      },
    };
  }
}
