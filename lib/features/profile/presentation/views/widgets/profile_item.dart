import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.icon, required this.title, this.onTap});
  final String icon;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal:AppConstant.width20(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(AppConstant.sp10(context)),
              decoration: const BoxDecoration(
                  color: Color(0xffFBD79B),
                  shape: BoxShape.circle
              ),
              child: SvgPicture.asset(icon,width: MediaQuery.of(context).size.height*.035,fit: BoxFit.scaleDown,)),
          SizedBox(width: AppConstant.width20(context),),
          Expanded(child: Text(title,style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*.02,
            fontWeight: FontWeight.w600,
          ),)),
          InkWell(onTap: onTap,child: SvgPicture.asset(AssetData.pArrow,width: MediaQuery.of(context).size.height*.012,)),
        ],
      ),
    );
  }
}
