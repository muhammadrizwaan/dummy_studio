import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet/res/sizes.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes().height,
          width: AppSizes().width,
          child: Center(
            child: Text("Profile"),
          ),
        ),
      ),
    );
  }
}
