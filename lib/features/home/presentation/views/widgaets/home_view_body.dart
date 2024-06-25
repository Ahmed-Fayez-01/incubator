import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/core/assets/assets.dart';
import 'package:incubator/core/shared_components/default_text_form_field.dart';
import 'package:incubator/core/utils/constants.dart';
import 'package:incubator/features/cases/presentation/views/cases_view.dart';
import 'package:incubator/features/incubator/presentation/view/incubator_view.dart';
import 'package:incubator/features/upload_file/presentation/view/upload_file_view.dart';
import 'package:incubator/features/visiting/presentation/view/visiting_view.dart';
import 'package:incubator/features/visiting/presentation/view/widgets/visiting_view_body.dart';

import 'home_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                PositionedDirectional(
                  end: 0,
                  child: Row(
                    children: [
                      Image.asset(
                        AssetData.homeDecor,
                        fit: BoxFit.cover,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .5,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AppConstant.sp20(context)),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .2,
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
                            height: AppConstant.height20(context),
                          ),
                          const Text('Welcome Parent👋 ')
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //Search Heeeeeeeeeeeeeeeeeeeeeeeer
            SizedBox(
              height: AppConstant.height20(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
              child: DefaultTextFormField(textInputType: TextInputType.text,borderSideEnabledColor: const Color(0x80000000),hintText: "Search",hasBorder: true ,controller: searchController,borderRadius: AppConstant.sp30(context),prefixIcon: SvgPicture.asset(AssetData.searchField,fit: BoxFit.scaleDown,color: Color(0x80000000),),),
            ),
            SizedBox(
              height: AppConstant.height20(context)*3,
            ),
            Container(
              padding: EdgeInsets.all(AppConstant.sp20(context)),
              decoration: BoxDecoration(
                border: const Border(top:BorderSide(color: Colors.black)),
                borderRadius: BorderRadius.circular(AppConstant.sp20(context)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      HomeItem(
                          text: ' Incubator',
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const IncubatorView()));

                          },
                          image: AssetData.incubator),
                      SizedBox(width: AppConstant.width20(context),),
                      HomeItem(
                          text: 'Cases',
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CasesView()));
                          },
                          image:  AssetData.cases)
                    ],
                  ),
                  SizedBox(height: AppConstant.height20(context),),
                  Row(
                    children: [
                      HomeItem(
                          text: 'Upload File',
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> const UploadFileView()));

                          },
                          image:  AssetData.upload),
                      SizedBox(width: AppConstant.width20(context),),
                      HomeItem(
                          text: 'Visiting',
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const VisitingView()));

                          },
                          image:  AssetData.visiting),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}