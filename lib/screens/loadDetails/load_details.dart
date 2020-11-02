import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_details.dart';
import 'package:truckoom_shipper/screens/loadDetails/load_details_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class LoadDetail extends StatefulWidget {
  String tag;

  LoadDetail({@required this.tag});

  @override
  _LoadDetailState createState() => _LoadDetailState();
}

class _LoadDetailState extends State<LoadDetail> {
  LoadDetailComponents _loadDetailComponents;
  bool switchState = false;
  int _dateTime = 1;
  int _goodType = 1;
  int _weight = 1;
  int _noOfVehicle = 1;

  @override
  void initState() {
    super.initState();
    print(widget.tag);
    _loadDetailComponents = LoadDetailComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
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
                    Container(
                      padding: EdgeInsets.all(AppSizes.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _loadDetailComponents.getLocationContainer(),
                          SizedBox(height: AppSizes.height * 0.01),
                          _loadDetailComponents.getExpectedRate(),
                          SizedBox(
                            height: AppSizes.height * 0.02,
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
                                        value: switchState,
                                        onChanged: (bool value) {
                                          setState(() {
                                            switchState = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: AppSizes.width * 0.02),
                                TextView.getLabel2Text04("Enable Round Trip",
                                    color: AppColors.roundTripColor),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(
                              text: "Pickup Date and Time"),
                          SizedBox(height: AppSizes.height * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.07,
                            width: AppSizes.width,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child:  Icon(Elusive.location, size: 20, color: AppColors.colorBlack.withOpacity(0.8),),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: _dateTime,
                                        items: [
                                          DropdownMenuItem(
                                            child: TextView.getLightText04(
                                              "Select",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: TextView.getLightText04(
                                              "New Zealand",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: TextView.getLightText04(
                                                "Nepal",
                                                color: AppColors.colorBlack,
                                              ),
                                              value: 3),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _dateTime = value;
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(
                              text: "Receiver Name"),
                          SizedBox(height: AppSizes.height * 0.01),
                          _loadDetailComponents.getNameTextField(
                              leftIcon: Entypo.user,
                              hintText: 'Receiver Name',
                              textEditingController: null),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(
                              text: "Receiver Phone"),
                          SizedBox(height: AppSizes.height * 0.01),
                          _loadDetailComponents.getNameTextField(
                              leftIcon: Entypo.mobile,
                              hintText: '(333)465-2835',
                              textEditingController: null),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(text: "Good type"),
                          SizedBox(height: AppSizes.height * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.07,
                            width: AppSizes.width,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Opacity(
                                      opacity: 0.7,
                                      child: Icon(
                                        MdiIcons.dialpad,
                                        size: 20,
                                      )),
                                  // child: Image(image: AssetImage(Assets.goodsType)),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: _goodType,
                                        items: [
                                          DropdownMenuItem(
                                            child: TextView.getLightText04(
                                              "Cargo",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: TextView.getLightText04(
                                              "Bulldozers",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: TextView.getLightText04(
                                                "Mini Excavators",
                                                color: AppColors.colorBlack,
                                              ),
                                              value: 3),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _goodType = value;
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(text: "Weight"),
                          SizedBox(height: AppSizes.height * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.07,
                            width: AppSizes.width,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Opacity(
                                      opacity: 0.7,
                                      child: Icon(
                                        FontAwesome5.truck,
                                        size: 18,
                                      )),
                                  // child: Image(image: AssetImage(Assets.vehicle)),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: _weight,
                                        items: [
                                          DropdownMenuItem(
                                            child: TextView.getLightText04(
                                              "40 Ton",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: TextView.getLightText04(
                                              "45 Ton",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: TextView.getLightText04(
                                                "50 Ton",
                                                color: AppColors.colorBlack,
                                              ),
                                              value: 3),
                                          DropdownMenuItem(
                                              child: TextView.getLightText04(
                                                "55 Ton",
                                                color: AppColors.colorBlack,
                                              ),
                                              value: 4)
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _weight = value;
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(
                              text: "No. of Vehicle"),
                          SizedBox(height: AppSizes.height * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.07,
                            width: AppSizes.width,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Opacity(
                                      opacity: 0.7,
                                      child: Icon(
                                        FontAwesome5.truck,
                                        size: 18,
                                      )),
                                  // child: Image(image: AssetImage(Assets.vehicle)),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: _noOfVehicle,
                                        items: [
                                          DropdownMenuItem(
                                            child: TextView.getLightText04(
                                              "20",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: TextView.getLightText04(
                                              "25",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: TextView.getLightText04(
                                                "30",
                                                color: AppColors.colorBlack,
                                              ),
                                              value: 3),
                                          DropdownMenuItem(
                                              child: TextView.getLightText04(
                                                "35",
                                                color: AppColors.colorBlack,
                                              ),
                                              value: 4)
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _noOfVehicle = value;
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(text: "Description"),
                          SizedBox(height: AppSizes.height * 0.01),
                          _loadDetailComponents.getMessageTextField(
                              leftIcon: Icons.message,
                              hintText: 'Description',
                              textEditingController: null),
                          SizedBox(height: AppSizes.height * 0.03),
                          Row(
                            children: [
                              SizedBox(width: AppSizes.width * 0.03),
                              Column(
                                children: [
                                  DottedBorder(
                                    color: AppColors.addVehicleBorderColor,
                                    // dashPattern: [6, 3, 2, 3],
                                    strokeWidth: 1,
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(5),
                                    // padding: EdgeInsets.all(16),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                  SizedBox(height: AppSizes.height * 0.02),
                                  CommonWidgets.getSubHeadingText(
                                      text: "Upload Images"),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getBottomButton(
                              text: "Next",
                              onPress: () {
                                Navigator.push(context, SlideRightRoute(page: BookLoadDetails()));
                              }),
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
