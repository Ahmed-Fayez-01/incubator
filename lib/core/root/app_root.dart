import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incubator/features/auth/data/repos/auth_repo_impl.dart';
import 'package:incubator/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:incubator/features/auth/presentation/view_model/login/login_cubit.dart';
import 'package:incubator/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:incubator/features/auth/presentation/view_model/send_otp/send_otp_cubit.dart';
import 'package:incubator/features/cases/data/repos/cases_repo_impl.dart';
import 'package:incubator/features/cases/presentation/view_models/get_all_cases/get_all_cases_cubit.dart';
import 'package:incubator/features/incubator/data/repos/incubator_repo_impl.dart';
import 'package:incubator/features/incubator/presentation/view_models/add_case/add_case_cubit.dart';
import 'package:incubator/features/upload_file/presentation/view_model/upload_file_cubit/upload_file_cubit.dart';

import '../../features/splash/splash_view.dart';
import '../services/local/cache_helper/cache_helper.dart';
import '../services/local/cache_helper/cache_keys.dart';
import '../services/remote/service_locator.dart';
import '../theme/app_theme.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: "lib/core/lang",
      supportedLocales: const [Locale("ar"), Locale("en")],
      saveLocale: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GetAllCasesCubit(
                    getIt.get<CaseRepoImpl>(),
                  )),
          BlocProvider(
              create: (context) => RegisterCubit(
                    getIt.get<AuthRepoImpl>(),
                  )),
          BlocProvider(
              create: (context) => LoginCubit(
                    getIt.get<AuthRepoImpl>(),
                  )),
          BlocProvider(
              create: (context) => ForgetPasswordCubit(
                    getIt.get<AuthRepoImpl>(),
                  )),
          BlocProvider(
              create: (context) => SendOtpCubit(
                    getIt.get<AuthRepoImpl>(),
                  )),
          BlocProvider(
              create: (context) => AddCaseCubit(
                getIt.get<IncubatorRepoImpl>(),
              )),
          BlocProvider(create: (context) => UploadFileCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 640),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            title: "Incubator",
            builder: (context, child) {
              if (CacheKeysManger.getUserLanguageFromCache() == "" ||
                  CacheHelper.getData(key: 'language') == null) {
                CacheHelper.saveData(key: "language", value: context.locale.toString());
              }
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: themeDataLight,
            home: child,
          ),
          child: const SplashView(),
        ),
      ),
    );
  }
}
