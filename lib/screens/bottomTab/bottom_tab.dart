import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/history/history.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/more/more.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs.dart';

_BottomTabState bottomTabState;
class BottomTab extends StatefulWidget {

  @override
  _BottomTabState createState() {
    bottomTabState =  _BottomTabState();
    return bottomTabState;
  }
}

class _BottomTabState extends State<BottomTab> {
  BottomTabComponents _bottomTabComponents;
  BottomTabProvider _bottomTabProvider;
  TextEditingController search;

  List<Widget> pages = [
    BookLoad(),
    MyJobs(),
    HistoryScreen(),
    More(),
  ];

  @override
  void initState() {
    _bottomTabComponents = BottomTabComponents();
    _bottomTabProvider = Provider.of<BottomTabProvider>(context, listen: false);
    _bottomTabProvider.init(context: context);
    search = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _currentPage(){
    if(_bottomTabProvider.currentIndex == 0){
      return BookLoad();
    }if(_bottomTabProvider.currentIndex == 1){
      return MyJobs();
    }if(_bottomTabProvider.currentIndex == 2){
      return HistoryScreen();
    }if(_bottomTabProvider.currentIndex == 3){
      return More();
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BottomTabProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: _currentPage(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomTabProvider.currentIndex,
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _bottomTabProvider.setCurrentIndex(index);
              // _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.bookLoadIcon,
                    height: 22,
                    width: 22,
                    color:
                    _bottomTabProvider.currentIndex == 0 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "Book Load",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: Assets.poppinsRegular,
                    color:
                    _bottomTabProvider.currentIndex == 0 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Icon(LineariconsFree.briefcase, size: 20,  color:
                  _bottomTabProvider.currentIndex == 1 ? AppColors.yellow : AppColors.grey,)
                ),
                title: Text(
                  "My Jobs",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: Assets.poppinsRegular,
                    color:
                    _bottomTabProvider.currentIndex == 1 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    "assets/png/icon_history.png",
                    height: 22,
                    width: 22,
                    color:
                    _bottomTabProvider.currentIndex == 2 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "History",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: Assets.poppinsRegular,
                    color:
                    _bottomTabProvider.currentIndex == 2 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.moreIcon,
                    height: 22,
                    width: 22,
                    color:
                    _bottomTabProvider.currentIndex == 3 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "More",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: Assets.poppinsRegular,
                    color:
                    _bottomTabProvider.currentIndex == 3 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
