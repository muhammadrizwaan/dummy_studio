import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet/res/sizes.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes().height,
          width: AppSizes().width,
          child: Center(
            child: Text("Bottom Tab"),
          ),
        ),
      ),
    );
  }
}
