import 'package:flutter/material.dart';
import 'package:incubator/core/utils/constants.dart';

import '../../../core/shared_components/custom_button.dart';
import '../incubator_login_view.dart';
import '../incubator_register_view.dart';

Future customAuthPopUpDialog({
  required BuildContext context,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: const Color(0xffFBD79B),
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        content:  SizedBox(
          width: MediaQuery.of(context).size.width*.8,
          child:  Padding(
            padding: EdgeInsets.all(AppConstant.sp20(context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },child: Icon(Icons.close,color: Colors.black,size: AppConstant.sp20(context),)),
                ],),
                SizedBox(height: AppConstant.height20(context),),
                DefaultButton(
                  onPress: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>IncubatorLoginView()));
                  },
                  height: MediaQuery.of(context).size.height*.016,
                  text: "login",
                  borderRadius: AppConstant.sp30(context),
                ),
                SizedBox(height: AppConstant.height20(context),),
                DefaultButton(
                  onPress: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const IncubatorRegisterView()));
                  },
                  height: MediaQuery.of(context).size.height*.016,
                  text: "create new account",
                  borderRadius: AppConstant.sp30(context),
                ),
              ],
            ),
          ),
        ),

      ),);