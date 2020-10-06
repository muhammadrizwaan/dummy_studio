


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _currentIndex = 0;

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
                  "Transections",
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
                onPress: (){}
            ),
            Divider(height: 10,),
            Container(
              color: AppColors.grey,
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
            children: [
              CommonWidgets.tabsAppBar1(
                  text: "My Jobs",
                  iconName: Assets.walletIcon,
                  onPress: (){}
              ),
              Divider(height: 10,),
              Container(
                color: AppColors.grey,
              )
            ],
          )
      );
    }
    else if (_currentIndex == 2){
      return Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.yellow,
        child: Text('Transactions Screen'),
      );
    }
    else if (_currentIndex == 3){
      return Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.yellow,
        child: Text('More Screen'),
      );
    }
  }


}