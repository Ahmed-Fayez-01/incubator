
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/splash/splash_view.dart';
import '../enums/data_type.dart';
import '../services/local/cache_helper/cache_helper.dart';
import '../services/local/cache_helper/cache_keys.dart';
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
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: "Incubator",
          builder: (context, child) {
            if (CacheKeysManger.getLanguageFromCache() == "" ||
                CacheHelper.getData(dataType: DataType.string, key: 'lang') == null) {
              CacheHelper.saveData(key: "lang", value: context.locale.toString());
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
    );
  }
}
