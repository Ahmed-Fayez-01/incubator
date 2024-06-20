import 'package:flutter/material.dart';
import 'package:incubator/core/text_styles/styles.dart';
import 'package:incubator/features/incubator/presentation/view/widgets/incubator_view_body.dart';

class IncubatorView extends StatelessWidget {
  const IncubatorView({super.key});

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
        title:  const Text("Cases found in the incubator",style: TextStyle(
          color: Colors.black
        ),),
        shadowColor: Colors.transparent,
      ),
      body: IncubatorViewBody(),

    );
  }
}
