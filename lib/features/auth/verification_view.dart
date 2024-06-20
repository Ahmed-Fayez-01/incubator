import 'package:incubator/features/auth/widgets/verification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.email});
  final String email;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark,
              //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor: Colors.white,
              statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          )),
      body: VerificationViewBody(email: email,),
    );
  }
}
