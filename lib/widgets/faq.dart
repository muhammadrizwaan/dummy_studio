

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class FAQStatelessContainer extends StatefulWidget {
  // final FAQ faq;
  // int pageIndex;

  FAQStatelessContainer();

  @override
  _FAQStatelessContainerState createState() => _FAQStatelessContainerState();
}

class _FAQStatelessContainerState extends State<FAQStatelessContainer> {

  bool isExpanded;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpanded = false;

  }

  Widget buildTiles() {
    return Container(
      color: isExpanded ? Color.fromRGBO(212, 212, 212, 1).withOpacity(0.5) : Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (value){
            setState(() {
              isExpanded = value;
            });
          },
          trailing: Icon(isExpanded ? FontAwesome5.chevron_down : FontAwesome5.chevron_right, size: 20, ),
          title: Container(
            padding: EdgeInsets.only(left: AppSizes.width*0.03),
            child: TextView.getLabelText04("Language", color: AppColors.colorBlack.withOpacity(0.6)),

          ),
          children: [
            Container(
              color: Color.fromRGBO(212, 212, 212, 1).withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: AppSizes.height * 0.04,
                    padding: EdgeInsets.only(left: AppSizes.width*0.08),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextView.getLabelText04("English", color: AppColors.colorBlack.withOpacity(0.6))),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: AppColors.colorBlack.withOpacity(0.2),
                  ),
                  Container(
                    height: AppSizes.height * 0.04,
                    padding: EdgeInsets.only(left: AppSizes.width*0.08),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextView.getLabelText04("اردو", color: AppColors.colorBlack.withOpacity(0.6))),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: AppColors.colorBlack.withOpacity(0.2),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: AppSizes.height * 0.04,
                    padding: EdgeInsets.only(left: AppSizes.width*0.08),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextView.getLabelText04("عربى", color: AppColors.colorBlack.withOpacity(0.6))),
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
}
