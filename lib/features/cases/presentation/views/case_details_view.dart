import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incubator/features/cases/presentation/views/widgets/case_details_view_body.dart';

class CaseDetailsView extends StatelessWidget {
  const CaseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0), // here the desired height
        child: AppBar(
          elevation: 0,
          systemOverlayStyle:  const SystemUiOverlayStyle(
            statusBarColor:Colors.white,
            statusBarIconBrightness:Brightness.dark,
            systemNavigationBarColor: Colors.white,
            statusBarBrightness:Brightness.light,
          ),
        ),
      ),
      body: const CaseDetailsViewBody(),
    );
  }
}
