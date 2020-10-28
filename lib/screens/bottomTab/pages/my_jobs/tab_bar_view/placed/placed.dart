
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_components.dart';

class Placed extends StatefulWidget {
  @override
  _PlacedState createState() => _PlacedState();
}

class _PlacedState extends State<Placed> {

  PlacedComponents _placedComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placedComponents = PlacedComponents();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                  jobDetail: "01",
                  pickUpLocation: "ABC Port:",
                  destinationLocation: "227 Building, UAE:",
                  startDate: "11 Aug,",
                  time: '12:00am',
                  status: "Active",
                  price: "AED 260",
                  onTap: () {}),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                  jobDetail: "01",
                  pickUpLocation: "ABC Port:",
                  destinationLocation: "227 Building, UAE:",
                  startDate: "11 Aug,",
                  time: '12:00am',
                  status: "Active",
                  price: "AED 260",
                  onTap: () {}),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                  jobDetail: "01",
                  pickUpLocation: "ABC Port:",
                  destinationLocation: "227 Building, UAE:",
                  startDate: "11 Aug,",
                  time: '12:00am',
                  status: "Active",
                  price: "AED 260",
                  onTap: () {}),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                  jobDetail: "01",
                  pickUpLocation: "ABC Port:",
                  destinationLocation: "227 Building, UAE:",
                  startDate: "11 Aug,",
                  time: '12:00am',
                  status: "Active",
                  price: "AED 260",
                  onTap: () {}),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
