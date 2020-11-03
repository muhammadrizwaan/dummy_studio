import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process_components.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';

class InProcess extends StatefulWidget {
  @override
  _InProcessState createState() => _InProcessState();
}

class _InProcessState extends State<InProcess> {
  InProcessComponents _inProcessComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inProcessComponents = InProcessComponents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _inProcessComponents.getJobContainer(
                context: context,
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Job Approved",
                price: "AED 260",
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
                onClickPay: () {
                  Navigator.push(context, SlideRightRoute(page: Payment()));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _inProcessComponents.getJobContainer(
                context: context,
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Job Approved",
                price: "AED 260",
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
                onClickPay: () {},
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _inProcessComponents.getJobContainer(
                context: context,
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Job Approved",
                price: "AED 260",
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
                onClickPay: () {},
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _inProcessComponents.getJobContainer(
                context: context,
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Job Approved",
                price: "AED 260",
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
                onClickPay: () {},
              ),
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
