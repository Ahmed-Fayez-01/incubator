import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/features/profile/presentation/views/widgets/profile_item.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles=[
      "Edit Profile",
      "Notification",
      "Support",
      "Language",
      "Logout",
    ];
    List<String> icons=[
      AssetData.pUser,
      AssetData.pNotification,
      AssetData.support,
      AssetData.language,
      AssetData.exit,
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppConstant.sp20(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffD97706),width: 2)
                ),
                child: Image.asset(
                  AssetData.logo,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: AppConstant.height10(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('incubator',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height*.018,

                  ),),
                ],
              )
            ],
          ),
        ),
       Expanded(
         child: ListView.separated(
           itemCount: titles.length,
           itemBuilder: (BuildContext context, int index) {
           return ProfileItem(icon: icons[index], title: titles[index],);
         }, separatorBuilder: (BuildContext context, int index) {
             return Padding(
               padding: EdgeInsets.symmetric(horizontal: AppConstant.width20(context),vertical: AppConstant.height5(context)),
               child: const Divider(
                 color: Color(0xffD97706),
               ),
             );
         },),
       ),
      ],
    );
  }
}
