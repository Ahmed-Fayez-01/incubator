
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/core/shared_components/custom_button.dart';
import 'package:incubator/core/utils/constants.dart';

class HomeItem extends StatelessWidget {
  const HomeItem(
      {super.key,
        required this.text,
        required this.image,
      });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppConstant.sp20(context)),
        decoration: BoxDecoration(
            color: const Color(0xffFBD79B),
            borderRadius: BorderRadius.circular(AppConstant.sp20(context))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(AppConstant.sp10(context)),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            DefaultButton(onPress: (){}, text: text,borderRadius: AppConstant.sp20(context),height: AppConstant.height10(context),),
          ],
        ),
      ),
    );
  }
}