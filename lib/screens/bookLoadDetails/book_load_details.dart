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
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_detail_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import 'package:provider/provider.dart';

class BookLoadDetails extends StatefulWidget {
  String name,
      phone,
      weight,
      description,
      pickupLatitude,
      pickupLongitude,
      dropoffLatitude,
      dropoffLongitude,
      pickupLocation,
      dropoffLocation,
      numOfVehicle;
  int goodTypeId, vehicleTypeId, vehicleCategoryId;
  bool isRoundTrip;
  DateTime pickUpDate;
  double Rate;

  BookLoadDetails({@required this.name,
    @required this.phone,
    @required this.weight,
    @required this.description,
    @required this.numOfVehicle,
    @required this.vehicleCategoryId,
    @required this.pickUpDate,
    @required this.isRoundTrip,
    @required this.Rate,
    @required this.pickupLatitude,
    @required this.pickupLongitude,
    @required this.dropoffLatitude,
    @required this.dropoffLongitude,
    @required this.pickupLocation,
    @required this.dropoffLocation,
    @required this.goodTypeId,
    @required this.vehicleTypeId});

  @override
  _BookLoadDetailsState createState() => _BookLoadDetailsState();
}

class _BookLoadDetailsState extends State<BookLoadDetails> {
  LatLng _center = LatLng(30.3753, 69.3451);

  BookLoadDetailComponents _bookLoadDetailComponents;
  BookLoadDetailProvider _bookLoadDetailProvider;

  @override
  void initState() {
    super.initState();
    _bookLoadDetailComponents = BookLoadDetailComponents();
    _bookLoadDetailProvider =
        Provider.of<BookLoadDetailProvider>(context, listen: false);
    _bookLoadDetailProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BookLoadDetailProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              CommonWidgets.tabsAppBar2(
                  text: Strings.bookLoadDetails,
                  onPress: () {
                    Navigator.pop(context);
                  }),
              SizedBox(height: AppSizes.height * 0.005),
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition:
                      CameraPosition(target: _center, zoom: 5),
                    ),
                    SlidingUpPanel(
                      isDraggable: true,
                      minHeight: AppSizes.height * 0.35,
                      maxHeight: AppSizes.height * 0.65,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2)),
                      panel: _onSlidingUpPanel(),
                    )
                  ],
                ),
              )
            ],
          )),
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
                color: AppColors.dragContainerslider,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          _bookLoadDetailComponents.getLocationContainer(
              pickupLocation: widget.pickupLocation,
              dropOffLocation: widget.dropoffLocation),
          SizedBox(height: AppSizes.height * 0.01),
          _bookLoadDetailComponents.getExpectedRate(rate: widget.Rate),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(Strings.roundTrip,
              color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04(
              widget.isRoundTrip ? "Yes" : "No", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(Strings.pickupDateAndTime,
              color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04(widget.pickUpDate.toString(),
              color: AppColors.colorBlack),
          // TextView.getLabel2Text04("11 Aug, 12:00am",
          //     color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(Strings.receiverName,
              color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04(widget.name, color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(Strings.receiverPhone,
              color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04(widget.phone,
              color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(Strings.goodType,
              color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04("Cargo", color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(Strings.weight, color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04(widget.weight, color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(
              "No of Vehicle",
              color: AppColors.colorBlack
          ),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getLabel2Text04(
              widget.numOfVehicle, color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),
          TextView.getLabelText04(Strings.description,
              color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.001),
          TextView.getDescriptionText(
              widget.description,
              color: AppColors.colorBlack),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: _bookLoadDetailComponents.getLoadImages(
                      images: Assets.vehicle_img)),
              Expanded(
                  child: _bookLoadDetailComponents.getLoadImages(
                      images: Assets.vehicle_img)),
              Expanded(
                  child: _bookLoadDetailComponents.getLoadImages(
                      images: Assets.vehicle_img)),
              Expanded(
                  child: _bookLoadDetailComponents.getLoadImages(
                      images: Assets.vehicle_img)),
              Expanded(
                  child: _bookLoadDetailComponents.getLoadImages(
                      images: Assets.vehicle_img)),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.03),
          CommonWidgets.getBottomButton(
              text: "Submit",
              onPress: () {
                _bookLoadDetailProvider.onSaveLoad(context: context,
                    pickupLocation: widget.pickupLocation,
                    pickupLatitude: widget.pickupLatitude,
                    pickupLongitude: widget.pickupLongitude,
                    dropoffLocation: widget.dropoffLocation,
                    dropoffLatitude: widget.dropoffLatitude,
                    dropoffLongitude: widget.dropoffLongitude,
                    vehicleTypeId: widget.vehicleTypeId,
                    vehicleCategoryId: widget.vehicleCategoryId,
                    pickupDateTime: widget.pickUpDate,
                    receiverName: widget.name,
                    receiverPhone: widget.phone,
                    goodTypeId: widget.goodTypeId,
                    weight: widget.weight,
                    noOfVehicles: widget.numOfVehicle,
                    description: widget.description,
                    isRoundTrip: widget.isRoundTrip,
                );
                // Navigator.push(context, SlideRightRoute(page: BottomTab(tag: Strings.indiviual)));
              }),
          SizedBox(height: AppSizes.height * 0.02),
        ],
      ),
    );
  }
}
