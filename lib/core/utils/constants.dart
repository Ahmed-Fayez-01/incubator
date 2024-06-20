import 'package:flutter/cupertino.dart';

import '../../features/cases/data/models/cases_model.dart';

class AppConstant{
  static List<Cases> model=[];
  static List<Cases> foundedItems=[];
  static int selectedIndex = 0;
  static sp10(context){
    var height=MediaQuery.of(context).size.height*.012;
    return height;
  }
  static  sp20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  sp30(context){
    var height=MediaQuery.of(context).size.height*.036;
    return height;
  }

  static  height5(context){
    var height=MediaQuery.of(context).size.height*.006;
    return height;
  }
  static  height10(context){
    var height=MediaQuery.of(context).size.height*.012;
    return height;
  }
  static  height15(context){
    var height=MediaQuery.of(context).size.height*.018;
    return height;
  }
  static  height20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  height30(context){
    var height=MediaQuery.of(context).size.height*.030;
    return height;
  }

  static  width5(context){
    var height=MediaQuery.of(context).size.height*.0075;
    return height;
  }
  static  width10(context){
    var height=MediaQuery.of(context).size.height*.015;
    return height;
  }
  static  width15(context){
    var height=MediaQuery.of(context).size.height*.02;
    return height;
  }
  static  width20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  width30(context){
    var height=MediaQuery.of(context).size.height*.036;
    return height;
  }
}