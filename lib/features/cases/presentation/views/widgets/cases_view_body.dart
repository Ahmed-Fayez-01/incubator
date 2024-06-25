import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incubator/features/cases/presentation/view_models/get_all_cases/get_all_cases_cubit.dart';
import 'package:incubator/features/cases/presentation/views/widgets/case_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/shared_components/default_text_form_field.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/cases_model.dart';

class CasesViewBody extends StatefulWidget {
  const CasesViewBody({super.key});

  @override
  State<CasesViewBody> createState() => _CasesViewBodyState();
}

class _CasesViewBodyState extends State<CasesViewBody> {
  var searchController = TextEditingController();

  @override
  void initState() {
    context.read<GetAllCasesCubit>().getAllCases();
    super.initState();
  }
  void runFilter(String enteredKeyword) {
    List<Cases> result = [];
    if (enteredKeyword.isEmpty) {
      result = AppConstant.model;
    } else {
      result = AppConstant.model
          .where((item) => item.fullName!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase())||item.code!.toString()
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase())||item.disease!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    AppConstant.foundedItems = result;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
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
                    "Cases",
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
          padding:
              EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
          child: DefaultTextFormField(
            textInputType: TextInputType.text,
            borderSideEnabledColor: const Color(0x80000000),
            hintText: "Search",
            hasBorder: true,
            onChange: (value) {
             runFilter(value);
            },
            controller: searchController,
            borderRadius: AppConstant.sp30(context),
            prefixIcon: SvgPicture.asset(
              AssetData.searchField,
              fit: BoxFit.scaleDown,
              color: const Color(0x80000000),
            ),
          ),
        ),
        SizedBox(
          height: AppConstant.height20(context),
        ),
        BlocBuilder<GetAllCasesCubit, GetAllCasesState>(
            builder: (context, state) {
          if (state is UserGetAllCasesSuccessState) {
            return Expanded(
              child:AppConstant.foundedItems.isNotEmpty? ListView.builder(
                itemCount: AppConstant.foundedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return CaseItem(
                    instance: AppConstant.foundedItems[index],
                  );
                },
              ):Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AssetData.noData,width: MediaQuery.of(context).size.height*.15,),
                    ],
                  ),
                  SizedBox(height: AppConstant.height5(context),),
                  Text("No Result Found",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height*.018,
                    color: const Color(0xffA5A5A5),
                  ),)
                ],
              ),
            );
          } else if(state is UserGetAllCasesErrorState){
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errMessage),
                ],
              ),
            );
          }else  {
            return Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConstant.sp20(context)),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .13,
                      decoration: BoxDecoration(
                        color: const Color(0xffA5a5a5),
                        borderRadius:
                            BorderRadius.circular(AppConstant.sp10(context)),
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppConstant.height10(context),
                    );
                  },
                ),
              )
            );
          }
        }),
      ],
    );
  }
}
