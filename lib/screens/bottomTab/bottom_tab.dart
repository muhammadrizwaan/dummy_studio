


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_components.dart';
import 'package:truckoom_shipper/screens/contact_us/contact_us.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password.dart';
import 'package:truckoom_shipper/screens/history/history.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile.dart';
import 'package:truckoom_shipper/screens/invoice/invoice.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail.dart';
import 'package:truckoom_shipper/screens/loadDetails/load_details.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/screens/referrals/referrals.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/screens/wallet/wallet.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  BottomTabComponents _bottomTabComponents;
  TextEditingController search;
  int _currentIndex = 0;

  @override
  void initState() {
    _bottomTabComponents = BottomTabComponents();
    search = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
                child: _bottomNavigationContainer(),
            ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.bookLoadIcon,
                    height: 40,
                    width: 50,
                    color: _currentIndex == 0 ? AppColors.yellow : AppColors
                        .grey,
                  ),
                ),
                title: Text(
                  "Book Load",
                  style: TextStyle(
                    color: _currentIndex == 0 ? AppColors.yellow : AppColors
                        .grey,
                  ),
                )
            ),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.jobsIcon,
                    height: 40,
                    width: 50,
                    color: _currentIndex == 1 ? AppColors.yellow : AppColors
                        .grey,
                  ),
                ),
                title: Text(
                  "My Jobs",
                  style: TextStyle(
                    color: _currentIndex == 1 ? AppColors.yellow : AppColors
                        .grey,
                  ),
                )
            ),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.transactionIcon,
                    height: 40,
                    width: 50,
                    color: _currentIndex == 2 ? AppColors.yellow : AppColors
                        .grey,
                  ),
                ),
                title: Text(
                  "Transactions",
                  style: TextStyle(
                    color: _currentIndex == 2 ? AppColors.yellow : AppColors
                        .grey,
                  ),
                )
            ),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.moreIcon,
                    height: 40,
                    width: 50,
                    color: _currentIndex == 3 ? AppColors.yellow : AppColors
                        .grey,
                  ),
                ),
                title: Text(
                  "More",
                  style: TextStyle(
                    color: _currentIndex == 3 ? AppColors.yellow : AppColors
                        .grey,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationContainer() {
    if (_currentIndex == 0) {
      return Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.white,
        child: Column(
          children: [
            CommonWidgets.tabsAppBar2(
                text: "Book a Load - Vehicle Type",
                iconName: Assets.backArrow,
                onPress: (){
                  Navigator.pop(context);
                }
            ),
            Divider(height: 10,),
            SizedBox(height: AppSizes.height * 0.01,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.width *0.05),
              child: _bottomTabComponents.getTextField(
                  leftIcon: Assets.searchIcon,
                  textEditingController: search,
                  hintText: "Search"
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.height * 0.03,),
                        _bottomTabComponents.getVehicleDetail(
                            leftIcon: Assets.vehicle_img,
                            vehicleType: 'Toyota Prius',
                            vehicleDetail: 'Weight Capacity: 22kg'
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                        _bottomTabComponents.getVehicleDetail(
                            leftIcon: Assets.vehicle_img,
                            vehicleType: 'Toyota Prius',
                            vehicleDetail: 'Weight Capacity: 22kg'
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                        _bottomTabComponents.getVehicleDetail(
                            leftIcon: Assets.vehicle_img,
                            vehicleType: 'Toyota Prius',
                            vehicleDetail: 'Weight Capacity: 22kg'
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                        _bottomTabComponents.getVehicleDetail(
                            leftIcon: Assets.vehicle_img,
                            vehicleType: 'Toyota Prius',
                            vehicleDetail: 'Weight Capacity: 22kg'
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                        _bottomTabComponents.getVehicleDetail(
                            leftIcon: Assets.vehicle_img,
                            vehicleType: 'Toyota Prius',
                            vehicleDetail: 'Weight Capacity: 22kg'
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                        _bottomTabComponents.getVehicleDetail(
                            leftIcon: Assets.vehicle_img,
                            vehicleType: 'Toyota Prius',
                            vehicleDetail: 'Weight Capacity: 22kg'
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                        _bottomTabComponents.getVehicleDetail(
                            leftIcon: Assets.vehicle_img,
                            vehicleType: 'Toyota Prius',
                            vehicleDetail: 'Weight Capacity: 22kg'
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                        _bottomTabComponents.getVehicleDetail(
                            leftIcon: Assets.vehicle_img,
                            vehicleType: 'Toyota Prius',
                            vehicleDetail: 'Weight Capacity: 22kg'
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      );
    }
    else if (_currentIndex == 1){
      return Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets.tabsAppBar1(
                  text: "My Jobs",
                  iconName: Assets.walletIcon,
                  onPress: (){
                    Navigator.push(context, SlideRightRoute(page: Wallet()));
                  }
              ),
              Divider(height: 10,),
              SizedBox(height: AppSizes.height * 0.03,),
              _bottomTabComponents.getSelectViewText(),
              SizedBox(height: AppSizes.height * 0.02,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                child: Row(
                  children: [
                    _bottomTabComponents.onSelectViewType(
                        text: "Active",
                        onPress: () {
                          Navigator.push(context, SlideRightRoute(page: LoadDetail()));
                        }
                    ),
                    SizedBox(width: AppSizes.width * 0.02,),
                    _bottomTabComponents.onSelectViewType(
                        text: "In Processing",
                        onPress: () {}
                    ),
                    SizedBox(width: AppSizes.width * 0.02,),
                    _bottomTabComponents.onSelectViewType(
                        text: "Completed",
                        onPress: () {}
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                      child: Column(
                        children: [
                          SizedBox(height: AppSizes.height * 0.02,),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "1100 KG Container - Port Pickup",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              status: "Active",
                              onEdit: () {},
                              onDelete: () {}
                              ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "1100 KG Container - Port Pickup",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              status: "Active",
                              onEdit: () {},
                              onDelete: () {}
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "1100 KG Container - Port Pickup",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              status: "Active",
                              onEdit: () {},
                              onDelete: () {}
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "1100 KG Container - Port Pickup",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              status: "Active",
                              onEdit: () {},
                              onDelete: () {}
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      );
    }
    else if (_currentIndex == 2){

      //    Transaction  Screen


      return Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            children: [
              CommonWidgets.tabsAppBar1(
                  text: "Transaction",
                  iconName: Assets.bellIconUnpress,
                  onPress: (){
                    Navigator.push(context, SlideRightRoute(page: Notifications()));
                  }
              ),
              Divider(height: 10,),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                      child: Column(
                        children: [
                          SizedBox(height: AppSizes.height * 0.02,),
                          _bottomTabComponents.getTransectionsContainer(
                              jobDetail: "1100 KG Container",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              price: "Price: AED 260",
                              onInvoice: () {
                                Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                              },
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _bottomTabComponents.getTransectionsContainer(
                            jobDetail: "1100 KG Container",
                            pickUpLocation: "ABC Port:",
                            destinationLocation: "227 Building, UAE:",
                            startDate: "11 Aug, 12:00am",
                            endDate: "12 Aug, 11:00pm",
                            price: "Price: AED 260",
                            onInvoice: () {
                              Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                            },
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _bottomTabComponents.getTransectionsContainer(
                            jobDetail: "1100 KG Container",
                            pickUpLocation: "ABC Port:",
                            destinationLocation: "227 Building, UAE:",
                            startDate: "11 Aug, 12:00am",
                            endDate: "12 Aug, 11:00pm",
                            price: "Price: AED 260",
                            onInvoice: () {
                              Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                            },
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _bottomTabComponents.getTransectionsContainer(
                            jobDetail: "1100 KG Container",
                            pickUpLocation: "ABC Port:",
                            destinationLocation: "227 Building, UAE:",
                            startDate: "11 Aug, 12:00am",
                            endDate: "12 Aug, 11:00pm",
                            price: "Price: AED 260",
                            onInvoice: () {
                              Navigator.push(context, SlideRightRoute(page: InvoiceDetail()));
                            },
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                        ]
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      );
    }
    else if (_currentIndex == 3){


      //   More component


      return Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            children: [
              CommonWidgets.tabsAppBar1(
                  text: "More",
                  iconName: Assets.bellIconUnpress,
                  onPress: (){
                    Navigator.push(context, SlideRightRoute(page: Notifications()));
                  }
              ),
              Divider(height: 10,),
              _bottomTabComponents.getProfileContainer(
                  ProfileImg: Assets.profileImg,
                  name: 'Matthew',
                  email: 'Matthew@gmail.com',
                  onPress: (){
                    Navigator.push(context, SlideRightRoute(page: IndividualProfile()));
                  }
              ),
              Divider(height: 10,),
              _bottomTabComponents.touchableButton(
                  text: 'History',
                  onPress: (){
                    Navigator.push(context, SlideRightRoute(page: History()));
                  }
              ),
              Divider(height: 10,),
              _bottomTabComponents.touchableButton(
                  text: 'Referrals',
                  onPress: (){
                    Navigator.push(context, SlideRightRoute(page: Referrals()));
                  }
              ),
              Divider(height: 10,),
              _bottomTabComponents.touchableButton(
                  text: 'Contact Us',
                  onPress: (){
                    Navigator.push(context, SlideRightRoute(page: ContactUs()));
                  }
              ),
              Divider(height: 10,),
              _bottomTabComponents.getSOSbutton(
                  text: 'SOS',
                  onPress: (){
                    Navigator.push(context, SlideRightRoute(page: DriverDetails()));
                  }
              )
            ],
          )
      );
    }
  }


}