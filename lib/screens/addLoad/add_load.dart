import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/addLoad/add_load_components.dart';
import 'package:truckoom_shipper/screens/addLoad/add_load_provider.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_details.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class AddLoad extends StatefulWidget {
  String tag;

  AddLoad({@required this.tag});

  @override
  _AddLoadState createState() => _AddLoadState();
}

class _AddLoadState extends State<AddLoad> {
  AddLoadComponents _addLoadComponents;
  AddLoadProvider _addLoadProvider;
  TextEditingController receiver_name, receiver_phone, weight, num_of_vehicle, description;
  bool switchState = false;
  int _weight = 1;
  int _noOfVehicle = 1;
  String _selectedValue;
  DateTime pickedDate;

  @override
  void initState() {
    super.initState();
    print(widget.tag);
    receiver_name = TextEditingController();
    receiver_phone = TextEditingController();
    weight = TextEditingController();
    num_of_vehicle = TextEditingController();
    description = TextEditingController();
    pickedDate = DateTime.now();
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
          child: _addLoadProvider.isDataFetched? Column(
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
                          _addLoadComponents.getLocationContainer(),
                          SizedBox(height: AppSizes.height * 0.01),
                          _addLoadComponents.getExpectedRate(),
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

                          _addLoadComponents.getDateField(
                              onDate: () {
                                _showDate();
                              },
                              date:
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(
                              text: "Receiver Name"),
                          SizedBox(height: AppSizes.height * 0.01),
                          _addLoadComponents.getNameTextField(
                              leftIcon: Entypo.user,
                              hintText: 'Receiver Name',
                              textEditingController: receiver_name),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(
                              text: "Receiver Phone"),
                          SizedBox(height: AppSizes.height * 0.01),
                          _addLoadComponents.getNameTextField(
                              leftIcon: Entypo.mobile,
                              hintText: '(333)465-2835',
                              textEditingController: receiver_phone),
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
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Container(
                                    height: AppSizes.height * 0.06,
                                    width: AppSizes.width * 0.06,
                                    child: Image.asset(
                                        Assets.vehicle
                                    ),
                                  ),
                                  // child: Image(image: AssetImage(Assets.vehicle)),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: Icon(Icons.keyboard_arrow_down),
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
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(text: "Weight"),
                          SizedBox(height: AppSizes.height * 0.01),
                          _addLoadComponents.getTextField(
                              leftIcon: Assets.vehicle,
                              hintText: 'Enter Weight',
                              textEditingController: weight),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(
                              text: "No. of Vehicle"),
                          SizedBox(height: AppSizes.height * 0.01),
                          _addLoadComponents.getTextField(
                              leftIcon: Assets.vehicle,
                              hintText: 'Enter No. of Vehicle',
                              textEditingController: num_of_vehicle),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(text: "Description"),
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
          ):Center(
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
      if (_selectedValue == _addLoadProvider.getGoodType().result[i].description) {
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
      firstDate: DateTime(DateTime.now().year - 10),
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
    }
  }
}
