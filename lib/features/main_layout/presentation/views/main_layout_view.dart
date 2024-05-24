// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/core/assets/assets.dart';
import 'package:incubator/features/notification/presentation/views/notification_view.dart';

import '../../../home/presentation/views/home_view.dart';
import '../../../profile/presentation/views/profile_view.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      SvgPicture.asset(AssetData.home,color: Colors.white,width: MediaQuery.of(context).size.height*.03,),
      SvgPicture.asset(AssetData.search,color: Colors.white,width: MediaQuery.of(context).size.height*.03,),
      SvgPicture.asset(AssetData.notification,color: Colors.white,width: MediaQuery.of(context).size.height*.03,),
      SvgPicture.asset(AssetData.user,color: Colors.white,width: MediaQuery.of(context).size.height*.03,),
    ];
    List screens = [
      const HomeView(),
      const SizedBox(),
      const NotificationView(),
      const ProfileView(),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0), // here the desired height
        child: AppBar(
          elevation: 0,
          systemOverlayStyle:  const SystemUiOverlayStyle(
            statusBarColor:Colors.white,
            statusBarIconBrightness:Brightness.dark,
            systemNavigationBarColor: Color(0xffD97706),
            statusBarBrightness:Brightness.light,
          ),
        ),
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: MediaQuery.of(context).size.height*.07,
        animationDuration: const Duration(milliseconds: 300),
        buttonBackgroundColor: const Color(0xffF59E0B),
        backgroundColor: const Color(0xffFBD79B),
        color: const Color(0xffD97706),
        index: index,
        items: items,
        onTap: (index) => setState(
              () {
            this.index = index;
          },
        ),
      ),
    );
  }
}