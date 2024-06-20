import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:incubator/features/cases/presentation/views/case_details_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/models/cases_model.dart';

class CaseItem extends StatelessWidget {
  const CaseItem({super.key, required this.instance});
  final Cases instance;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CaseDetailsView()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:AppConstant.width20(context),vertical: AppConstant.height10(context)),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0x80000000)
            )
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.height * 0.09,
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color:const Color(0x80000000),
                    width: .3
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.09),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[200]!,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                  imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaK-NIi-RXIcg_sGZOVeN79fdGk4OICsxjXg&s",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: AppConstant.width10(context),),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name : ",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffF59E0B),
                          fontSize: MediaQuery.of(context).size.height*.014
                      ),),
                      Expanded(
                        child: Text(instance.fullName!,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height*.014
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: AppConstant.height10(context),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("The Disease : ",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffF59E0B),
                          fontSize: MediaQuery.of(context).size.height*.014
                      ),),
                      Expanded(
                        child: Text(instance.disease!,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height*.014
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: AppConstant.width10(context),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Code : ",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffF59E0B),
                    fontSize: MediaQuery.of(context).size.height*.014
                ),),
                Text(instance.code!.toString(),style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height*.014
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
