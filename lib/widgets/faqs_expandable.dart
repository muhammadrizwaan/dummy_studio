
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import 'package:url_launcher/url_launcher.dart';

class FAQsExpandable extends StatefulWidget {
  @override
  _FAQsExpandableState createState() => _FAQsExpandableState();
}

class _FAQsExpandableState extends State<FAQsExpandable> {
  bool isExpanded;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpanded = false;

  }

  Widget buildTiles() {
    return Container(
      color: isExpanded ? AppColors.lightGray : Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (value){
            setState(() {
              isExpanded = value;
            });
          },
          trailing: Icon(isExpanded ? FontAwesome5.chevron_down : FontAwesome5.chevron_right, size: 20, color: AppColors.colorBlack.withOpacity(0.4), ),
          title: Container(
            padding: EdgeInsets.only(left: AppSizes.width*0.035),
            child: TextView.getLabelText04("Others", color: AppColors.colorBlack.withOpacity(0.6)),

          ),
          children: [
            Container(
              color: AppColors.lightGray,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    color: AppColors.colorBlack.withOpacity(0.1),
                  ),
                  GestureDetector(
                    onTap: (){
                      launchURL("http://truckoom.jinnbytedev.com/");
                    },
                    child: Container(
                      height: AppSizes.height * 0.06,
                      padding: EdgeInsets.only(left: AppSizes.width*0.08),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextView.getLabelText04("FAQs", color: AppColors.colorBlack.withOpacity(0.6))),
                    ),
                  ),
                  SizedBox(height: 05),
                  Container(
                    height: 1,
                    color: AppColors.colorBlack.withOpacity(0.1),
                  ),
                  GestureDetector(
                    onTap: (){
                      launchURL("http://truckoom.jinnbytedev.com/");
                    },
                    child: Container(
                      height: AppSizes.height * 0.06,
                      padding: EdgeInsets.only(left: AppSizes.width*0.08),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextView.getLabelText04("Privacy Policy", color: AppColors.colorBlack.withOpacity(0.6))),
                    ),
                  ),
                  SizedBox(height: 05),
                  Container(
                    height: 1,
                    color: AppColors.colorBlack.withOpacity(0.1),
                  ),
                  GestureDetector(
                    onTap: (){
                      launchURL("http://truckoom.jinnbytedev.com/");
                    },
                    child: Container(
                      height: AppSizes.height * 0.06,
                      padding: EdgeInsets.only(left: AppSizes.width*0.08),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextView.getLabelText04("Terms and Conditions", color: AppColors.colorBlack.withOpacity(0.6))),
                    ),
                  ),
                  SizedBox(height: 05),
                  Container(
                    height: 1,
                    color: AppColors.colorBlack.withOpacity(0.1),
                  ),
                  SizedBox(height: 05),
                  GestureDetector(
                    onTap: (){
                      launchURL("http://truckoom.jinnbytedev.com/");
                    },
                    child: Container(
                      height: AppSizes.height * 0.06,
                      padding: EdgeInsets.only(left: AppSizes.width*0.08),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextView.getLabelText04("Refund Policy", color: AppColors.colorBlack.withOpacity(0.6))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTiles();
  }


   launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
