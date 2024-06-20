import 'package:flutter/material.dart';
import 'package:incubator/features/visiting/presentation/view/widgets/visiting_view_body.dart';


class VisitingView extends StatelessWidget {
  const VisitingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        centerTitle: true,
        title:  const Text("Visiting",style: TextStyle(
          color: Colors.black
        ),),
        shadowColor: Colors.transparent,
      ),
      body: const VisitingViewBody(),

    );
  }
}
