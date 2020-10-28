import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/history/history.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/more/more.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs.dart';


class BottomTab extends StatefulWidget {
  String tag;

  BottomTab({@required this.tag});

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  BottomTabComponents _bottomTabComponents;
  TextEditingController search;
  int _currentIndex = 0;
  int _value = 1;

  String myTag;
  List<Widget> pages = [
    BookLoad(),
    MyJobs(),
    HistoryScreen(),
    More(),
  ];

  @override
  void initState() {
    _bottomTabComponents = BottomTabComponents();
    search = TextEditingController();
    myTag = widget.tag;
  }

  _currentPage(){
    if(_currentIndex == 0){
      return BookLoad(tag: widget.tag);
    }if(_currentIndex == 1){
      return MyJobs(tag: widget.tag);
    }if(_currentIndex == 2){
      return HistoryScreen(tag: widget.tag);
    }if(_currentIndex == 3){
      return More(tag: widget.tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: _currentPage(),
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
                    height: 20,
                    width: 20,
                    color:
                        _currentIndex == 0 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "Book Load",
                  style: TextStyle(
                    color:
                        _currentIndex == 0 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Icon(LineariconsFree.briefcase, size: 20,  color:
                  _currentIndex == 1 ? AppColors.yellow : AppColors.grey,)
                ),
                title: Text(
                  "My Jobs",
                  style: TextStyle(
                    color:
                        _currentIndex == 1 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    "assets/png/icon_history.png",
                    height: 20,
                    width: 20,
                    color:
                        _currentIndex == 2 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "History",
                  style: TextStyle(
                    color:
                        _currentIndex == 2 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.moreIcon,
                    height: 20,
                    width: 20,
                    color:
                        _currentIndex == 3 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "More",
                  style: TextStyle(
                    color:
                        _currentIndex == 3 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
