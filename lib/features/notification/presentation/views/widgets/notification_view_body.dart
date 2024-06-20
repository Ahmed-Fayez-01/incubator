import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/core/assets/assets.dart';
import 'package:incubator/core/utils/constants.dart';

import 'notification_item.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppConstant.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Notification",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height*.02
                  ),),
                ],
              ),
              InkWell(onTap: (){
                Navigator.pop(context);
              },child: SvgPicture.asset(AssetData.pageBack,width: MediaQuery.of(context).size.height*.02,)),
            ],
          ),
        ),
        SizedBox(height: AppConstant.height20(context),),
        Expanded(
          child: ListView.separated(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
            return const NotificationItem();
          }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: MediaQuery.of(context).size.height*.002,);
          },),
        ),
      ],
    );
  }
}
