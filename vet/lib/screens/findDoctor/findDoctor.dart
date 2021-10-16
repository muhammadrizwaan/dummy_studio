import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet/res/colors.dart';
import 'package:vet/res/commonWidgets.dart';
import 'package:vet/res/res.dart';
import 'package:vet/screens/findDoctor/findDoctorComponents.dart';

class FindDoctor extends StatefulWidget {
  const FindDoctor({Key? key}) : super(key: key);

  @override
  _FindDoctorState createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  FindDoctorComponents _findDoctorComponents = FindDoctorComponents();


  @override
  void initState() {
    _findDoctorComponents = FindDoctorComponents();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: sizes.height,
            width: sizes.width,
            color: AppColors.whiteColor,
            padding: EdgeInsets.symmetric(horizontal: getWidth()*0.04, vertical: getHeight()*0.01),
            child: Column(
              children: [
                _findDoctorComponents.getAppBar(
                  onBack: (){

                  },
                  onFilter: (){

                  },
                  onBell: (){

                  }
                ),
                SizedBox(height: getHeight()*0.02),
                CommonWidget.getDivider(),
                SizedBox(height: getHeight()*0.02),
                _findDoctorComponents.textField()
              ],
            ),
          ),
        )
    );
  }
}
