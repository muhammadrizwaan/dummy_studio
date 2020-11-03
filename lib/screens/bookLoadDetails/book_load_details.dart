
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/models/imagesModal.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_detail_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class BookLoadDetails extends StatefulWidget {
  String tag;
  BookLoadDetails({@required this.tag});
  @override
  _BookLoadDetailsState createState() => _BookLoadDetailsState();
}

class _BookLoadDetailsState extends State<BookLoadDetails> {
  LatLng _center = LatLng(30.3753, 69.3451);

  BookLoadDetailComponents _bookLoadDetailComponents;

  @override
  void initState() {
    super.initState();
    _bookLoadDetailComponents = BookLoadDetailComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              CommonWidgets.tabsAppBar2(
                  text: Strings.bookLoadDetails,
                  onPress: (){Navigator.pop(context);}
              ),
              SizedBox(height: AppSizes.height * 0.005),
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(target: _center, zoom: 5),
                    ),
                    SlidingUpPanel(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      panel: _onSlidingUpPanel(),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  _onSlidingUpPanel() {
    return Container(
      height: AppSizes.height * 0.5,
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          )),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: AppSizes.height * 0.008,
              width: AppSizes.width * 0.40,
              decoration: BoxDecoration(
                color: AppColors.dragContainer,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          _bookLoadDetailComponents.getLocationContainer(),
          SizedBox(height: AppSizes.height * 0.01),
          _bookLoadDetailComponents.getExpectedRate(),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(
              Strings.roundTrip,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("Yes", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.pickupDateAndTime,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("11 Aug, 12:00am", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.receiverName,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("Kevin Gray", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.receiverPhone,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("(333)465-2835", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.goodType,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("Cargo", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.weight,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("45 Ton", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),

          TextView.getLabelText04(
              Strings.description,
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getDescriptionText(
              "Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet. Donec congue, nunc vel tempor.Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet.",
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: _bookLoadDetailComponents.getLoadImages(images: Assets.vehicle_img)),
              Expanded(child: _bookLoadDetailComponents.getLoadImages(images: Assets.vehicle_img)),
              Expanded(child: _bookLoadDetailComponents.getLoadImages(images: Assets.vehicle_img)),
              Expanded(child: _bookLoadDetailComponents.getLoadImages(images: Assets.vehicle_img)),
              Expanded(child: _bookLoadDetailComponents.getLoadImages(images: Assets.vehicle_img)),
            ],
          ),

          // Container(
          //   child: ListView.builder(
          //     itemCount: getAllImages.length,
          //       itemBuilder: (context, index){
          //       return _bookLoadDetailComponents.getLoadImages(
          //           images: getAllImages[index].imagePath
          //       );
          //       }
          //   ),
          // ),
          SizedBox(height: AppSizes.height * 0.03),
          CommonWidgets.getBottomButton(
              text: "Submit",
              onPress: (){
                Navigator.push(context, SlideRightRoute(page: BottomTab(tag: widget.tag)));
              }
          ),
          SizedBox(height: AppSizes.height * 0.02),
        ],
      ),
    );
  }
}
