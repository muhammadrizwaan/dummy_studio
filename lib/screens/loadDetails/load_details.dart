

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bank/bank_screen.dart';
import 'package:truckoom_shipper/screens/individualPayment/individual_payment.dart';
import 'package:truckoom_shipper/screens/loadDetails/load_details_components.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class LoadDetail extends StatefulWidget {
  String tag;
  LoadDetail({@required this.tag});
  @override
  _LoadDetailState createState() => _LoadDetailState();
}

class _LoadDetailState extends State<LoadDetail> {
  LoadDetailComponents _loadDetailComponents;
  int _value = 1;

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
                  iconName: Assets.backArrow,
                  onPress: (){
                    Navigator.pop(context);
                  }
              ),
              Divider(height: 10),
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
                          _loadDetailComponents.getLocation(
                              pick_up: '1 Ash Park, Pembroke Dock, SA7254, Drury Lane, Oldham, OL9 7PH',
                              destination: '1 Ash Park, Pembroke Dock, SA6478, Drury Lane, Dubai, OL9 7PH'
                          ),
                          SizedBox(height: AppSizes.height * 0.01),
                          _loadDetailComponents.getExpectedRate(),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: "Pickup Date and Time"
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.06,
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
                                  child: Image(image: AssetImage('assets/png/location_icon.png')),
                                ) ,
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(

                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Select",
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontFamily: Assets.poppinsLight,
                                                fontSize: 12,
                                                color: AppColors.colorBlack
                                              ),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("New Zealand",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Nepal",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: Assets.poppinsLight,
                                                    fontSize: 12,
                                                    color: AppColors.colorBlack
                                                ),
                                              ),
                                              value: 3
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Malaysia",
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
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: "Receiver Name"
                          ),
                          SizedBox(height: 10,),
                          _loadDetailComponents.getNameTextField(
                              leftIcon: Assets.nameIcon,
                              hintText: 'Receiver Name',
                              textEditingController: null
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: "Receiver Phone"
                          ),
                          SizedBox(height: 10,),
                          _loadDetailComponents.getNameTextField(
                              leftIcon: Assets.phoneNumber,
                              hintText: '(333)465-2835',
                              textEditingController: null
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: "Good type"
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.06,
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
                                  child: Image(image: AssetImage(Assets.goodsType)),
                                ) ,
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(

                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Cargo",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Bulldozers.",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Mini Excavators",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: Assets.poppinsLight,
                                                    fontSize: 12,
                                                    color: AppColors.colorBlack
                                                ),),
                                              value: 3
                                          ),
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
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: "Weight"
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.06,
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
                                  child: Image(image: AssetImage(Assets.vehicle)),
                                ) ,
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(

                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("45 Ton",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("50 Ton",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: Text("55 Ton",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: Assets.poppinsLight,
                                                    fontSize: 12,
                                                    color: AppColors.colorBlack
                                                ),),
                                              value: 3
                                          ),
                                          DropdownMenuItem(
                                              child: Text("60 Ton",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: Assets.poppinsLight,
                                                    fontSize: 12,
                                                    color: AppColors.colorBlack
                                                ),),
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
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: "No. of Vehicle"
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.06,
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
                                  child: Image(image: AssetImage(Assets.vehicle)),
                                ) ,
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(

                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("55",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("60",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: Text("65",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: Assets.poppinsLight,
                                                    fontSize: 12,
                                                    color: AppColors.colorBlack
                                                ),),
                                              value: 3
                                          ),
                                          DropdownMenuItem(
                                              child: Text("70",
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
                          // SizedBox(height: AppSizes.height * 0.03,),
                          // CommonWidgets.getLableText(
                          //     text: "Note"
                          // ),
                          // SizedBox(height: AppSizes.height * 0.01,),
                          // _loadDetailComponents.getNameTextField(
                          //     leftIcon: Assets.messageIcon,
                          //     hintText: 'Pellentesque lobortis nec',
                          //     textEditingController: null
                          // ),
                          // SizedBox(height: 10,),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: "Description"
                          ),
                          SizedBox(height: AppSizes.height * 0.01),
                          _loadDetailComponents.getMessageTextField(
                              leftIcon: Assets.messageIcon,
                              hintText: 'Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet. Donec congue, nunc vel tempor.',
                              textEditingController: null
                          ),
                          SizedBox(height: AppSizes.height * 0.04),
                          Row(
                            children: [
                              Container(
                                  width: AppSizes.width * 0.25,
                                  height: AppSizes.height * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image(image: AssetImage(Assets.vehicle_img),
                                    fit: BoxFit.cover,
                                  )
                              ),
                              SizedBox(width: AppSizes.width * 0.03),
                              Container(
                                  width: AppSizes.width * 0.25,
                                  height: AppSizes.height * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image(image: AssetImage(Assets.vehicle_img),
                                    fit: BoxFit.cover,
                                  )
                              ),
                              SizedBox(width: AppSizes.width * 0.03),
                              Container(
                                  width: AppSizes.width * 0.25,
                                  height: AppSizes.height * 0.12,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGray,
                                    border: Border.all(color: AppColors.addVehicleBorderColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(Icons.add_circle),
                                  // child: Image(image: AssetImage(Assets.addProfileImg),)
                              )
                            ],
                          ),

                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getBottomButton(
                              text: "Next",
                              onPress: () {
                                // Navigator.push(context, SlideRightRoute(page: Payment(tag: widget.tag,)));
                                if(widget.tag == Strings.indiviual){
                                  Navigator.push(context, SlideRightRoute(page: IndividualPayment(tag: widget.tag,)));
                                }
                                else if(widget.tag == Strings.business){
                                  Navigator.push(context, SlideRightRoute(page: Payment(tag: widget.tag,)));
                                }
                              }
                          ),
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
