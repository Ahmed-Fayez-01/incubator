import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incubator/features/cases/presentation/views/widgets/case_details_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class CaseDetailsViewBody extends StatelessWidget {
  const CaseDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Name : ",
      "The Disease : ",
      "Phone : ",
      "Code : ",
    ];
    List<String> values = [
      "Ahmed Fayez",
      "Jaundice",
      "01158368887",
          "140016",
    ];
    return Column(
      children: [
        SizedBox(
          height: AppConstant.height20(context),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Case Details",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height * .02),
                  ),
                ],
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AssetData.pageBack,
                    width: MediaQuery.of(context).size.height * .02,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: AppConstant.height20(context),
        ),
        Padding(
          padding: EdgeInsets.all(AppConstant.sp20(context)),
          child: Container(
            width: MediaQuery.of(context).size.height * 0.14,
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0x80000000), width: .3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.14),
              child: CachedNetworkImage(
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[200]!,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaK-NIi-RXIcg_sGZOVeN79fdGk4OICsxjXg&s",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(titles.length, (index){
            return Column(
              children: [
                CaseDetailsItem(
                  title: titles[index], value: values[index],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstant.width20(context),
                      vertical: AppConstant.height5(context)),
                  child: const Divider(
                    color: Color(0xff454B60),
                    thickness: 2,
                  ),
                )
              ],
            );
          }) ,
        ),
        SizedBox(height: AppConstant.height20(context),),
        Container(
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
                  child: SvgPicture.asset(AssetData.phFile,fit: BoxFit.contain,)),
              SizedBox(width: AppConstant.width10(context),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reports",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height*.018
                    ),),
                    SizedBox(height: AppConstant.height10(context),),
                    Text("30/12/2024",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0x80000000),
                        fontSize: MediaQuery.of(context).size.height*.018
                    ),),
                  ],
                ),
              ),
              SizedBox(width: AppConstant.width10(context),),
              Text("View",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*.018
              ),),
            ],
          ),
        ),
        SizedBox(height: AppConstant.height5(context),),
        Container(
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
                  child: SvgPicture.asset(AssetData.time,fit: BoxFit.contain,)),
              SizedBox(width: AppConstant.width10(context),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Visiting",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height*.018
                    ),),
                    SizedBox(height: AppConstant.height10(context),),
                    Text("30/12/2024",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0x80000000),
                        fontSize: MediaQuery.of(context).size.height*.018
                    ),),
                  ],
                ),
              ),
              SizedBox(width: AppConstant.width10(context),),
              Text("View",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*.018
              ),),
            ],
          ),
        )
      ],
    );
  }
}
