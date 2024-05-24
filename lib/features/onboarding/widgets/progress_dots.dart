import 'package:flutter/material.dart';

import '../../../../../core/colors/app_colors.dart';

class ProgressDots extends StatelessWidget {
  ProgressDots({super.key, required this.isActiveScreen});
  bool isActiveScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.01),
      height:  MediaQuery.of(context).size.width*.01,
      width:   MediaQuery.of(context).size.width*.04,
      decoration: BoxDecoration(
          color: isActiveScreen ?  CustomColor.primaryColor : const Color(0xffDCDCDC),
          borderRadius:  BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*.01))),
    );
  }
}

