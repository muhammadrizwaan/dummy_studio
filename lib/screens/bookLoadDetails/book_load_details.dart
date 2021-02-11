import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_detail_components.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_detail_provider.dart';
import 'package:truckoom_shipper/widgets/MapView.dart';
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
  int goodTypeId, vehicleTypeId, vehicleCategoryId, Distance;
  bool isRoundTrip;
  String pickUpDate;
  String Rate;
  List<Asset> images;

  BookLoadDetails({@required this.name,
    @required this.images,
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
    @required this.vehicleTypeId,
    @required this.Distance
  });

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
          body: Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: AppSizes.height * 0.5,
                      pinned: true,
                      automaticallyImplyLeading: true,
                      floating: false,
                      toolbarHeight: 0,
                      backgroundColor: AppColors.white,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          children: [
                            CommonWidgets.tabsAppBar2(
                                text: Strings.bookLoadDetails,
                                onPress: () {
                                  Navigator.pop(context);
                                }),
                            Expanded(
                              child: MapView(
                                startLat: double.parse(widget.pickupLatitude),
                                startLong: double.parse(widget.pickupLongitude),
                                endLat: double.parse(widget.dropoffLatitude),
                                endLong: double.parse(widget.dropoffLongitude),
                                apiKey: "IzaSyDHxZ--0FYqNItvE-kf3Sz2jlRtgt0Mp3Q",
                                directionsApiKey: "AIzaSyDTLiSzdkVV8xrO9an282diUlBFMshCwAI",
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ];
                },
                body: Container(
                  height: AppSizes.height * 0.5,
                  padding: EdgeInsets.only(top: AppSizes.height * 0.01),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      )),
                  child: Column(
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
                      SizedBox(height: AppSizes.height * 0.01),
                      Expanded(
                        child: ListView(
                          children: [
                            CommonWidgets.getWalletPriceBox(
                                walletPrice: widget.Rate.toString()
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _bookLoadDetailComponents.getLocationContainer(
                                      pickupLocation: widget.pickupLocation,
                                      dropOffLocation: widget.dropoffLocation),
                                  SizedBox(height: AppSizes.height * 0.01),
                                  TextView.getLabelText04(Strings.roundTrip,
                                      color: AppColors.colorBlack),
                                  SizedBox(height: AppSizes.height * 0.001),
                                  TextView.getLabel2Text04(
                                      widget.isRoundTrip ? "Yes" : "No", color: AppColors.colorBlack),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  TextView.getLabelText04(Strings.pickupDateAndTime,
                                      color: AppColors.colorBlack),
                                  SizedBox(height: AppSizes.height * 0.001),
                                  TextView.getLabel2Text04(widget.pickUpDate,
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
                                  widget.images.isNotEmpty?Container(
                                    height: AppSizes.height * 0.1,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget.images.length,
                                        itemBuilder: (context, index){
                                          Asset asset = widget.images[index];
                                          return Row(
                                            children: [
                                              SizedBox(width: AppSizes.width * 0.01,),
                                              Container(
                                                height: AppSizes.height * 0.1,
                                                width: AppSizes.width * 0.2,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: AssetThumb(
                                                  asset: asset,
                                                  width: 300,
                                                  height: 300,
                                                ),
                                              ),
                                              SizedBox(width: AppSizes.width * 0.01,),
                                            ],
                                          );
                                        }),
                                  ):
                                  CommonWidgets.onNullData(text: "No Images"),
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
                                            images: widget.images,
                                            distance: widget.Distance
                                        );
                                      }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, vertical: AppSizes.height * 0.01),
                  child: CommonWidgets.getBottomButton(
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
                            images: widget.images,
                            distance: widget.Distance
                        );
                      }),
                ),
              ),
            ],
          )
      ),
    );
  }
}
