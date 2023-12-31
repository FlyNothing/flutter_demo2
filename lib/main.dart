import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_binding.dart';
import 'package:flutter_demo2/common/global/global_theme_dark.dart';
import 'package:flutter_demo2/common/global/global_theme_light.dart';
import 'package:flutter_demo2/common/util/i18n_message.dart';
import 'package:flutter_demo2/home/home_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 840), // 默认Size(360, 690)
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // 初始化默认的全局Binding
        initialBinding: GlobalBinding(),
        // initialRoute: Routes.SPLASH,
        theme: lightTheme,
        darkTheme: darkTheme,
        defaultTransition: Transition.zoom,
        // getPages: AppPages.pages,
        translations: I18nMessage(),
        locale: const Locale('zh', 'CN'), // 按照指定语言翻译
        fallbackLocale: const Locale('en', 'US'), // 添加一个语言选项，以备指定语言翻译不存在
        home: const HomeView(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
