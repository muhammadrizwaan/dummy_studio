import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle_components.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../animations/slide_right.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';
import '../../widgets/common_widgets.dart';
import '../loadDetails/load_details.dart';

class SelectVehicle extends StatefulWidget {
  String tag;
  SelectVehicle({@required this.tag});
  @override
  _SelectVehicleState createState() => _SelectVehicleState();
}

class _SelectVehicleState extends State<SelectVehicle> {
  int _value = 1;

  SelectVechileComponents _selectVehicleComponents;
  TextEditingController search;
  bool isSelect;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectVehicleComponents = SelectVechileComponents();
    search = TextEditingController();
    isSelect = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                height: AppSizes.height,
                width: AppSizes.width,
                color: AppColors.white,
                child: Column(
                  children: [
                    CommonWidgets.tabsAppBar2(
                        text: "Book a Load - Vehicle Type",
                        onPress: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.width * 0.05),
                      child: _selectVehicleComponents.getTextField(
                          leftIcon: Assets.searchIcon,
                          textEditingController: search,
                          hintText: "Search",
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.width * 0.05,
                      ),
                      height: AppSizes.height * 0.06,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          // border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500].withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 0))
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Opacity(
                                opacity: 0.7,
                                child: Icon(
                                  FontAwesome5.truck,
                                  size: 18,
                                  color: AppColors.colorBlack,
                                )),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  value: _value,
                                  items: [
                                    DropdownMenuItem(
                                      child: TextView.getLightText04(
                                        "Select Category",
                                        color: AppColors.lightGray
                                            .withOpacity(0.3),
                                      ),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: TextView.getLightText04(
                                        "Category 1",
                                        color: AppColors.colorBlack,
                                      ),
                                      value: 2,
                                    ),
                                    DropdownMenuItem(
                                        child: TextView.getLightText04(
                                          "Category 2",
                                          color: AppColors.colorBlack,
                                        ),
                                        value: 3),
                                    DropdownMenuItem(
                                        child: TextView.getLightText04(
                                          "Category 3",
                                          color: AppColors.colorBlack,
                                        ),
                                        value: 4)
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.height * 0.02),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                _selectVehicleComponents.getVehicleDetail(
                                  leftIcon: Assets.vehicle_img,
                                  vehicleType: 'Toyota Prius',
                                  vehicleDetail: '22 Ton',
                                  Category: 'Cargo',
                                  onLoadDetail: () {
                                    setState(() {
                                      isSelect = !isSelect;
                                    });
                                    //show button
                                  },
                                  isSelect: isSelect,
                                  onTap: () {
                                    //Show information
                                  },
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                _selectVehicleComponents.getVehicleDetail(
                                  leftIcon: Assets.vehicle_img,
                                  vehicleType: 'Toyota Prius',
                                  vehicleDetail: '22 Ton',
                                  Category: 'Cargo',
                                  onLoadDetail: () {
                                    setState(() {
                                      isSelect = !isSelect;
                                    });
                                    //show button
                                  },
                                  isSelect: false,
                                  onTap: () {
                                    //Show information
                                  },
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                _selectVehicleComponents.getVehicleDetail(
                                  leftIcon: Assets.vehicle_img,
                                  vehicleType: 'Toyota Prius',
                                  vehicleDetail: '22 Ton',
                                  Category: 'Cargo',
                                  onLoadDetail: () {
                                    setState(() {
                                      isSelect = !isSelect;
                                    });
                                    //show button
                                  },
                                  onTap: () {
                                    //Show information
                                  },
                                  isSelect: false,
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                _selectVehicleComponents.getVehicleDetail(
                                  leftIcon: Assets.vehicle_img,
                                  vehicleType: 'Toyota Prius',
                                  vehicleDetail: '22 Ton',
                                  Category: 'Cargo',
                                  onLoadDetail: () {
                                    setState(() {
                                      isSelect = !isSelect;
                                    });
                                    //show button
                                  },
                                  isSelect: false,
                                  onTap: () {
                                    //Show information
                                  },
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                _selectVehicleComponents.getVehicleDetail(
                                  leftIcon: Assets.vehicle_img,
                                  vehicleType: 'Toyota Prius',
                                  vehicleDetail: '22 Ton',
                                  Category: 'Cargo',
                                  onLoadDetail: () {
                                    setState(() {
                                      isSelect = !isSelect;
                                    });
                                    //show button
                                  },
                                  isSelect: false,
                                  onTap: () {
                                    //Show information
                                  },
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                _selectVehicleComponents.getVehicleDetail(
                                  leftIcon: Assets.vehicle_img,
                                  vehicleType: 'Toyota Prius',
                                  vehicleDetail: '22 Ton',
                                  Category: 'Cargo',
                                  onLoadDetail: () {
                                    setState(() {
                                      isSelect = !isSelect;
                                    });
                                    //show button
                                  },
                                  isSelect: false,
                                  onTap: () {
                                    //Show information
                                  },
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                _selectVehicleComponents.getVehicleDetail(
                                  leftIcon: Assets.vehicle_img,
                                  vehicleType: 'Toyota Prius',
                                  vehicleDetail: '22 Ton',
                                  Category: 'Cargo',
                                  onLoadDetail: () {
                                    setState(() {
                                      isSelect = !isSelect;
                                    });
                                    //show button
                                  },
                                  isSelect: false,
                                  onTap: () {
                                    //Show information
                                  },
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                _selectVehicleComponents.getVehicleDetail(
                                  leftIcon: Assets.vehicle_img,
                                  vehicleType: 'Toyota Prius',
                                  vehicleDetail: '22 Ton',
                                  Category: 'Cargo',
                                  onLoadDetail: () {
                                    setState(() {
                                      isSelect = !isSelect;
                                    });

                                    //show button
                                  },
                                  isSelect: false,
                                  onTap: () {
                                    //Show information
                                  },
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: isSelect ? Container(
                height: AppSizes.height * 0.07,
                margin: EdgeInsets.only(
                  bottom: AppSizes.width*0.03,
                    left: AppSizes.width * 0.05,
                    right: AppSizes.width * 0.05),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    08,
                  ),
                ),
                width: AppSizes.width,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        SlideRightRoute(page: LoadDetail()));
                  },
                  child: TextView.getBottomButtonText04(
                    "Next",
                    color: AppColors.white.withOpacity(0.6),
                  ),
                ),
              ): Container(),
            ),
          ],
        ),
      ),
    );
  }
}
