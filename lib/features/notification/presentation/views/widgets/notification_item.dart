import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstant.sp20(context)),
      decoration: const BoxDecoration(
          color: Color(0xffFBD79B),
          boxShadow: [
            BoxShadow(
                color: Color(0x33000000),
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 2)
            )
          ]
      ),
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.height*.065,
              height: MediaQuery.of(context).size.height*.065,
              padding: EdgeInsets.all(AppConstant.sp10(context)),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: SvgPicture.asset(AssetData.bell,fit: BoxFit.contain,)),
          SizedBox(width: AppConstant.width10(context),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cleopatra Hospital",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height*.016
                ),),
                Text("The file has been uploaded",style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height*.014
                ),),
              ],
            ),
          ),
          SizedBox(width: AppConstant.width10(context),),
          Text("Moments ago",style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.height*.012
          ),),
        ],
      ),
    );
  }
}
