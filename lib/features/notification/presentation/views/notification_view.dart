import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incubator/features/notification/presentation/views/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: const NotificationViewBody(),
    );
  }
}
