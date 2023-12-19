import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_binding.dart';
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
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.light,
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.indigo),
              minimumSize: MaterialStateProperty.all(Size(100.w, 40.h)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.w),
                ),
              ),
            ),
          ),
        ),
        defaultTransition: Transition.zoom,
        // initialBinding: SplashBinding(),
        // getPages: AppPages.pages,
        home: const HomeView(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
