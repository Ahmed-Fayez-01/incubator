import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class CaseDetailsItem extends StatelessWidget {
  const CaseDetailsItem({super.key, required this.title, this.onTap, required this.value});
  final String title;
  final String value;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal:AppConstant.width20(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*.02,
            fontWeight: FontWeight.w600,
            color: const Color(0xffF59E0B)
          ),),
          Expanded(child: Text(value,style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*.02,
            fontWeight: FontWeight.w600,
          ),)),
          InkWell(onTap: onTap,child: SvgPicture.asset(AssetData.edit,width: MediaQuery.of(context).size.height*.035,)),
        ],
      ),
    );
  }
}
