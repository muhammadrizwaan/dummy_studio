import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet/res/res.dart';

import 'colors.dart';


class CommonWidget{
  static Widget getDivider(){
    return Container(
        color: AppColors.grayColor,
        height: getHeight()*.002,
    );
  }
}