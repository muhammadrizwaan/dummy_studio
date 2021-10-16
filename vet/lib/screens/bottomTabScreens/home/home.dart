import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet/res/sizes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes().height,
          width: AppSizes().width,
          child: Center(
            child: Text("Home"),
          ),
        ),
      ),
    );
  }
}
