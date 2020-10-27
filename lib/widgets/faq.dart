

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class FAQStatelessContainer extends StatelessWidget {
  // final FAQ faq;
  // int pageIndex;

  FAQStatelessContainer();

  Widget buildTiles() {

    return ExpansionTile(
      title: Container(
        child: TextView.getLabelText04("Language", color: AppColors.colorBlack.withOpacity(0.6)),

      ),
      children: [
        Container(
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                height: AppSizes.height * 0.07,
                color: AppColors.yellow,
              ),
              SizedBox(height: 10),
              Container(
                height: 1,
                color: AppColors.colorBlack.withOpacity(0.6),
              ),
              Container(
                height: AppSizes.height * 0.07,
                color: AppColors.grey,
              ),
              SizedBox(height: 10),
              Container(
                height: 1,
                color: AppColors.colorBlack.withOpacity(0.6),
              ),
              Container(
                height: AppSizes.height * 0.07,
                color: AppColors.colorPinkShade,
              ),
              SizedBox(height: 10),
              Container(
                height: 1,
                color: AppColors.colorBlack.withOpacity(0.6),
              ),
              SizedBox(height: 10),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTiles();
  }

  // String _parseHtmlString(String htmlString) {
  //   final document = parse(htmlString);
  //   final String parsedString = parse(document.body.text).documentElement.text;
  //
  //   return parsedString;
  // }
}
