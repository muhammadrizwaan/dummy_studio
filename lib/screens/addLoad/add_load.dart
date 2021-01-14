import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/addLoad/add_load_components.dart';
import 'package:truckoom_shipper/screens/addLoad/add_load_provider.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class AddLoad extends StatefulWidget {
  String
      PickupLatitude,
      PickupLongitude,
      DropoffLatitude,
      DropoffLongitude,
      PickupLocation,
      DropoffLocation;
  int VehicleTypeId, VehicleCategoryId;
  double Rate, multiplier;

  AddLoad(
      {
      @required this.PickupLatitude,
      @required this.PickupLongitude,
      @required this.DropoffLatitude,
      @required this.DropoffLongitude,
      @required this.PickupLocation,
      @required this.DropoffLocation,
      @required this.VehicleCategoryId,
      @required this.VehicleTypeId,
        @required this.Rate,
        @required this.multiplier,
      });

  @override
  _AddLoadState createState() => _AddLoadState();
}

class _AddLoadState extends State<AddLoad> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  AddLoadComponents _addLoadComponents;
  AddLoadProvider _addLoadProvider;
  TextEditingController receiver_name,
      receiver_phone,
      weight,
      num_of_vehicle,
      description;
  bool isRounded = false;
  int _weight = 1;
  int _noOfVehicle = 1;
  String _selectedValue;
  DateTime pickedDate;
  TimeOfDay pickedTime;
  double tolalRate;

  @override
  void initState() {
    super.initState();
    receiver_name = TextEditingController();
    receiver_phone = TextEditingController();
    weight = TextEditingController();
    num_of_vehicle = TextEditingController();
    description = TextEditingController();
    num_of_vehicle.addListener(() {_estimateRate();});
    pickedDate = DateTime.now();
    pickedTime = TimeOfDay.now();
    tolalRate = widget.Rate;
    _addLoadComponents = AddLoadComponents();
    _addLoadProvider = Provider.of<AddLoadProvider>(context, listen: false);
    _addLoadProvider.init(context: context);
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<AddLoadProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: _addLoadProvider.isDataFetched
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonWidgets.tabsAppBar2(
                        text: 'Add Book a Load Details',
                        onPress: () {
                          Navigator.pop(context);
                        }),
                    Expanded(
                      child: ListView(
                        children: [
                          CommonWidgets.getWalletPriceBox(
                              walletPrice: tolalRate.toString(),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _addLoadComponents.getLocationContainer(
                                    pickupLocation: widget.PickupLocation,
                                    dropOffLocation: widget.DropoffLocation
                                ),
                                TextView.getRoundTripText04("Round Trip",
                                    color: AppColors.roundTripColor),
                                SizedBox(height: AppSizes.height * 0.01),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Wrap(
                                          children: [
                                            CupertinoSwitch(
                                              activeColor: AppColors.yellow,
                                              value: isRounded,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  isRounded = value;
                                                });
                                                _estimateRate();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: AppSizes.width * 0.02),
                                      TextView.getLabel2Text04(
                                          "Enable Round Trip",
                                          color: AppColors.roundTripColor),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.02,
                                ),
                                CommonWidgets.getSubHeadingText(
                                    text: "Pickup Date and Time"),
                                SizedBox(height: AppSizes.height * 0.01),
                                _addLoadComponents.getDateField(
                                    onDate: () {
                                      _showDate();
                                    },
                                    date: "${pickedDate.day}/${pickedDate.month}/${pickedDate.year} ${pickedTime.hour}:${pickedTime.minute}"),
                                SizedBox(height: AppSizes.height * 0.02,),
                                CommonWidgets.getSubHeadingText(
                                    text: "Receiver Name"),
                                SizedBox(height: AppSizes.height * 0.01),
                                _addLoadComponents.getNameTextField(
                                    leftIcon: Entypo.user,
                                    hintText: 'Enter Receiver Name',
                                    textEditingController: receiver_name),
                                SizedBox(
                                  height: AppSizes.height * 0.02,
                                ),
                                CommonWidgets.getSubHeadingText(
                                    text: "Receiver Phone"),
                                SizedBox(height: AppSizes.height * 0.01),
                                _addLoadComponents.getPhoneField(
                                    leftIcon: Entypo.mobile,
                                    hintText: 'Enter Receiver Phone',
                                    textEditingController: receiver_phone),
                                SizedBox(
                                  height: AppSizes.height * 0.02,
                                ),
                                CommonWidgets.getSubHeadingText(
                                    text: "Good type"),
                                SizedBox(height: AppSizes.height * 0.01),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: AppSizes.height * 0.07,
                                  width: AppSizes.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGray,
                                    border:
                                        Border.all(color: AppColors.lightGray),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Container(
                                          height: AppSizes.height * 0.06,
                                          width: AppSizes.width * 0.06,
                                          child: Image.asset(Assets.loadIcon),
                                        ),
                                        // child: Image(image: AssetImage(Assets.vehicle)),
                                      ),
                                      Expanded(
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            isExpanded: true,
                                            value: _selectedValue,
                                            hint: TextView.getLightText04(
                                              "Select GoodType",
                                              color: AppColors.colorBlack,
                                            ),
                                            items: _addLoadProvider.description
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: TextView.getLightText04(
                                                  value,
                                                  color: AppColors.colorBlack,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String value) {
                                              setState(() {
                                                _selectedValue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.02,
                                ),
                                CommonWidgets.getSubHeadingText(text: "Weight"),
                                SizedBox(height: AppSizes.height * 0.01),
                                _addLoadComponents.getNumberField(
                                    leftIcon: Assets.weightIcon,
                                    hintText: 'Enter Weight',
                                    textEditingController: weight),
                                SizedBox(
                                  height: AppSizes.height * 0.02,
                                ),
                                CommonWidgets.getSubHeadingText(
                                    text: "No. of Vehicle"),
                                SizedBox(height: AppSizes.height * 0.01),
                                _addLoadComponents.getNumberField(
                                    leftIcon: Assets.vehicle,
                                    hintText: 'Enter No. of Vehicle',
                                    textEditingController: num_of_vehicle),
                                SizedBox(
                                  height: AppSizes.height * 0.02,
                                ),
                                CommonWidgets.getSubHeadingText(
                                    text: "Description"),
                                SizedBox(height: AppSizes.height * 0.01),
                                _addLoadComponents.getMessageTextField(
                                    leftIcon: Icons.message,
                                    hintText: 'Enter Description',
                                    textEditingController: description),
                                SizedBox(height: AppSizes.height * 0.03),
                                Row(
                                  children: [
                                    SizedBox(width: AppSizes.width * 0.03),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            loadAssets();
                                          },
                                          child: DottedBorder(
                                            color:
                                                AppColors.addVehicleBorderColor,
                                            // dashPattern: [6, 3, 2, 3],
                                            strokeWidth: 1,
                                            borderType: BorderType.RRect,
                                            radius: Radius.circular(5),
                                            // padding: EdgeInsets.all(16),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              child: Container(
                                                width: AppSizes.width * 0.25,
                                                height: AppSizes.height * 0.12,
                                                decoration: BoxDecoration(
                                                  color: AppColors.lightGray,
                                                  // border: Border.all(color: AppColors.addVehicleBorderColor),
                                                  // borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Icon(Icons.add_circle),
                                                // child: Image(image: AssetImage(Assets.addProfileImg),)
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: AppSizes.height * 0.02),
                                        CommonWidgets.getSubHeadingText(
                                            text: "Upload Images"),
                                      ],
                                    )
                                  ],
                                ),
                                images.isNotEmpty?Container(
                                  height: AppSizes.height * 0.1,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      itemBuilder: (context, index){
                                        Asset asset = images[index];
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
                                              // child: Image(
                                              //   image: AssetImage(asset),
                                              //   fit: BoxFit.cover,
                                              // ),
                                            ),
                                            SizedBox(width: AppSizes.width * 0.01,),
                                          ],
                                        );
                                      }),
                                ):
                                    Container(),
                                // CommonWidgets.onNullData(text: "No Images"),

                                SizedBox(
                                  height: AppSizes.height * 0.02),
                                CommonWidgets.getBottomButton(
                                    text: "Next",
                                    onPress: () {
                                      // _addLoadProvider.onUploadImages(context: context, ImagesList: images);
                                      _addLoadProvider.onEstimatedRate(
                                          context: context,
                                          pickupDateTime: "${pickedDate.month}/${pickedDate.day}/${pickedDate.year} ${pickedTime.hour}:${pickedTime.minute}",
                                          name: receiver_name.text,
                                          phone: receiver_phone.text,
                                          goodTypeId: _getGoodTypeId(),
                                          weight: weight.text,
                                          numOfVehicle: num_of_vehicle.text,
                                          description: description.text,
                                          isRoundTrip: isRounded,
                                          pickupLatitude: widget.PickupLatitude,
                                          pickupLongitude: widget.PickupLongitude,
                                          dropoffLatitude: widget.DropoffLatitude,
                                          dropoffLongitude: widget.DropoffLongitude,
                                          pickupLocation: widget.PickupLocation,
                                          dropoffLocation: widget.DropoffLocation,
                                        vehicleCategoryId: widget.VehicleCategoryId,
                                        vehicleTypeId: widget.VehicleTypeId,
                                        imagesList: images,
                                        Rate: tolalRate.toString(),
                                      );
                                    }),
                                SizedBox(height: AppSizes.height * 0.02)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              : Center(
                  child: Container(
                    height: AppSizes.height * 0.15,
                    child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                  ),
                ),
        ),
      ),
    );
  }

  int _getGoodTypeId() {
    int tempGoodTypeId = 0;
    for (int i = 0; i < _addLoadProvider.getGoodType().result.length; i++) {
      if (_selectedValue ==
          _addLoadProvider.getGoodType().result[i].description) {
        tempGoodTypeId = _addLoadProvider.getGoodType().result[i].goodTypeId;
        break;
      }
    }
    return tempGoodTypeId;
  }

  _showDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 10),

      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            cursorColor: Colors.grey,
            dialogBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light(primary: AppColors.yellow),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
            textSelectionColor: Colors.grey,
          ),
          child: child,
        );
      },
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
      _showTime();
    }
    else {
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Information",
          subHeading:
          "No Date has been selected, by default current date is filled above");
    }
  }

  _showTime() async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: pickedTime,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            cursorColor: Colors.grey,
            dialogBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light(primary: AppColors.yellow),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
            textSelectionColor: Colors.grey,
          ),
          child: child,
        );
      },
    );

    if(time!=null){
      setState(() {
        pickedTime = time;
      });
    }else{
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Information",
          subHeading:
          "No Time has been selected, by default current time is selected");
    }

  }


  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Truckoom",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      images = resultList;
      _error = error;
    });
  }

   _estimateRate(){
    double rate = widget.Rate;

    if(isRounded == false && num_of_vehicle.text.isEmpty){
      setState(() {
        tolalRate = double.parse(rate.toStringAsFixed(2));
      });
    }
    else if(isRounded && num_of_vehicle.text.isEmpty){
      print("rate and multipler");
      print(rate);
      print(widget.multiplier);
      double mul = rate * widget.multiplier;
      setState(() {
        tolalRate = double.parse(mul.toStringAsFixed(2));
      });
    }
    else if(isRounded == false && num_of_vehicle.text.isNotEmpty){
      int totalVehicles = int.parse(num_of_vehicle.text);
      double mul = rate * totalVehicles;
      setState(() {
        tolalRate = double.parse(mul.toStringAsFixed(2));
      });
    }
    else if(isRounded && num_of_vehicle.text.isNotEmpty){
      int totalVehicles = int.parse(num_of_vehicle.text);
      double mul = (rate * totalVehicles) * widget.multiplier;
      setState(() {
        tolalRate =double.parse(mul.toStringAsFixed(2));
      });
    }
  }
}

