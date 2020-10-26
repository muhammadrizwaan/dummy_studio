import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle_components.dart';

import '../../animations/slide_right.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';
import '../../widgets/common_widgets.dart';
import '../loadDetails/load_details.dart';

class SelectVehicle extends StatefulWidget {
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
        body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.white,
            child: Column(
              children: [
                CommonWidgets.tabsAppBar2(
                    text: "Book a Load - Vehicle Type",
                    iconName: Assets.backArrow,
                    onPress: () {
                      Navigator.pop(context);
                    }),
                Divider(height: 10),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                  child: _selectVehicleComponents.getTextField(
                      leftIcon: Assets.searchIcon,
                      textEditingController: search,
                      hintText: "Search"),
                ),
                SizedBox(height: AppSizes.height * 0.02,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05,),
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
                      ]
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image(image: AssetImage(Assets.vehicle)),
                      ) ,
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(

                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Select Category",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: Assets.poppinsLight,
                                        fontSize: 12,
                                        color: AppColors.colorBlack
                                    ),),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Category 1",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: Assets.poppinsLight,
                                        fontSize: 12,
                                        color: AppColors.colorBlack
                                    ),),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                    child: Text("Category 2",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: Assets.poppinsLight,
                                          fontSize: 12,
                                          color: AppColors.colorBlack
                                      ),),
                                    value: 3
                                ),
                                DropdownMenuItem(
                                    child: Text("Category 3",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: Assets.poppinsLight,
                                          fontSize: 12,
                                          color: AppColors.colorBlack
                                      ),
                                    ),
                                    value: 4
                                )
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              }
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: AppSizes.height * 0.03,
                            ),
                            _selectVehicleComponents.getVehicleDetail(
                                leftIcon: Assets.vehicle_img,
                                vehicleType: 'Toyota Prius',
                                vehicleDetail: '22 Ton',
                                Category: 'Cargo',
                                onLoadDetail: (){
                                  setState(() {
                                    isSelect = !isSelect;
                                  });
                                  Navigator.push(context, SlideRightRoute(page: LoadDetail()));
                                  //show button
                                },
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
                              onLoadDetail: (){
                                setState(() {
                                  isSelect = !isSelect;
                                });
                                //show button
                              },
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
                              onLoadDetail: (){
                                setState(() {
                                  isSelect = !isSelect;
                                });
                                //show button
                              },
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
                              onLoadDetail: (){
                                setState(() {
                                  isSelect = !isSelect;
                                });
                                //show button
                              },
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
                              onLoadDetail: (){
                                setState(() {
                                  isSelect = !isSelect;
                                });
                                //show button
                              },
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
                              onLoadDetail: (){
                                setState(() {
                                  isSelect = !isSelect;
                                });
                                //show button
                              },
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
                              onLoadDetail: (){
                                setState(() {
                                  isSelect = !isSelect;
                                });
                                //show button
                              },
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
                              onLoadDetail: (){
                                setState(() {
                                  isSelect = !isSelect;
                                });

                                //show button
                              },
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
      ),
    );
  }
}
