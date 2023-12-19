import 'package:flutter_demo2/common/page/base_menu_view.dart';
import 'package:flutter_demo2/common/vo/plugin_menu_sort_vo.dart';
import 'package:flutter_demo2/common/vo/plugin_menu_vo.dart';
import 'package:flutter_demo2/plugin/badges/badges_view.dart';
import 'package:flutter_demo2/plugin/cachednetworkimage/cached_network_image_controller.dart';
import 'package:flutter_demo2/plugin/cachednetworkimage/cached_network_image_view.dart';
import 'package:flutter_demo2/plugin/carouselslider/carousel_slider_controller.dart';
import 'package:flutter_demo2/plugin/carouselslider/carousel_slider_view.dart';
import 'package:flutter_demo2/plugin/datepickertimeline/date_picker_timeline_controller.dart';
import 'package:flutter_demo2/plugin/datepickertimeline/date_picker_timeline_view.dart';
import 'package:flutter_demo2/plugin/easyloading/page/easy_loading_controller.dart';
import 'package:flutter_demo2/plugin/flutterblueplus/flutter_blue_plus_view.dart';
import 'package:flutter_demo2/plugin/flutterdatepickertimeline/flutter_date_picker_timeline_controller.dart';
import 'package:flutter_demo2/plugin/flutterdatepickertimeline/flutter_date_picker_timeline_view.dart';
import 'package:flutter_demo2/plugin/easyloading/page/easy_loading_view.dart';
import 'package:flutter_demo2/plugin/easyrefresh/easy_refresh_view.dart';
import 'package:flutter_demo2/plugin/gorouter/go_router_app.dart';
import 'package:flutter_demo2/plugin/imagecropper/image_cropper_view.dart';
import 'package:flutter_demo2/plugin/imagegallerysaver/image_gallery_saver_controller.dart';
import 'package:flutter_demo2/plugin/imagegallerysaver/image_gallery_saver_view.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_menu_config.dart';
import 'package:flutter_demo2/plugin/mobilescanner/mobile_scanner_controller.dart';
import 'package:flutter_demo2/plugin/mobilescanner/mobile_scanner_view.dart';
import 'package:flutter_demo2/plugin/pathprovider/path_provider_controller.dart';
import 'package:flutter_demo2/plugin/pathprovider/path_provider_view.dart';
import 'package:flutter_demo2/plugin/permissionhandler/permission_controller.dart';
import 'package:flutter_demo2/plugin/permissionhandler/permission_handler_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_menu_config.dart';
import 'package:flutter_demo2/plugin/provider/provider_menu_config.dart';
import 'package:flutter_demo2/plugin/pulltorefresh/pull_to_refresh_app.dart';
import 'package:flutter_demo2/plugin/qrcode/qr_code_view.dart';
import 'package:flutter_demo2/plugin/qrcodescanner/qr_code_scanner_controller.dart';
import 'package:flutter_demo2/plugin/qrcodescanner/qr_code_scanner_view.dart';
import 'package:flutter_demo2/plugin/responsiveframework/responsive_app.dart';
import 'package:flutter_demo2/plugin/screenshot/screenshot_controller.dart';
import 'package:flutter_demo2/plugin/screenshot/screenshot_view.dart';
import 'package:flutter_demo2/plugin/screenutil/screen_util_menu_config.dart';
import 'package:flutter_demo2/plugin/sharedpreferences/shared_preferences_controller.dart';
import 'package:flutter_demo2/plugin/sharedpreferences/shared_preferences_view.dart';
import 'package:flutter_demo2/plugin/sqlite/floor/floor_controller.dart';
import 'package:flutter_demo2/plugin/sqlite/floor/floor_view.dart';
import 'package:flutter_demo2/plugin/sqlite/sqflite/sqflite_controller.dart';
import 'package:flutter_demo2/plugin/sqlite/sqflite/sqflite_view.dart';
import 'package:flutter_demo2/plugin/svg/svg_view.dart';
import 'package:flutter_demo2/plugin/urllauncher/url_launcher_view.dart';
import 'package:flutter_demo2/plugin/video/chewie_menu_config.dart';
import 'package:flutter_demo2/plugin/video/video_player_menu_config.dart';
import 'package:flutter_demo2/plugin/webview/flutter_inappwebview_menu_config.dart';
import 'package:flutter_demo2/plugin/webview/webview_flutter_menu_config.dart';
import 'package:get/get.dart';

List<PluginMenuSortVO> pluginMenuSortList = [
  PluginMenuSortVO(0, "编码", true, false, (int asc) => pluginMenuList.sort((p1, p2) => asc * p1.code.compareTo(p2.code))),
  PluginMenuSortVO(1, "名称", true, false, (int asc) => pluginMenuList.sort((p1, p2) => asc * p1.name.compareTo(p2.name))),
];

List<PluginMenuVO> pluginMenuList = [
  PluginMenuVO("badges", "徽标", const BadgesView()),
  PluginMenuVO("cached_network_image", "网络图片缓存", const CachedNetworkImageView(), binding: BindingsBuilder.put(() => CachedNetworkImageController())),
  PluginMenuVO("carousel_slider", "轮播图", const CarouselSliderView(), binding: BindingsBuilder.put(() => CarouselSliderController())),
  PluginMenuVO("chewie", "视频播放【2】", BaseMenuView("视频播放【2】", chewieMenuList)),
  PluginMenuVO("date_picker_timeline", "左右滑动日期选择器【1】", const DatePickerTimelineView(), binding: BindingsBuilder.put(() => DatePickerTimelineController())),
  PluginMenuVO("easy_refresh", "下拉刷新及上拉加载【1】", const FlutterEasyRefreshView()),
  PluginMenuVO("floor", "SQLLite数据库【2】", const FloorView(), binding: BindingsBuilder.put(() => FloorController())),
  PluginMenuVO("flutter_blue_plus", "蓝牙连接", const FlutterBluePlusView()),
  PluginMenuVO("flutter_date_picker_timeline", "左右滑动日期选择器【2】", const FlutterDatePickerTimelineView(), binding: BindingsBuilder.put(() => FlutterDatePickerTimelineController())),
  PluginMenuVO("flutter_easyloading", "简易弹窗和加载", const EasyLoadingView(), binding: BindingsBuilder.put(() => EasyLoadingController())),
  PluginMenuVO("flutter_inappwebview", "Webview【2】", BaseMenuView("webview【2】", flutterInappwebviewMenuList)),
  PluginMenuVO("flutter_screenutil", "屏幕适配", BaseMenuView("屏幕适配", screenUtilMenuList)),
  PluginMenuVO("flutter_svg", "Svg扩展", const FlutterSvgView()),
  PluginMenuVO("go_router", "声明式路由", const GoRouterApp()),
  PluginMenuVO("image_cropper", "图片裁剪", const ImageCropperView()),
  PluginMenuVO("image_gallery_saver", "保存到相册", const ImageGallerySaverView(), binding: BindingsBuilder.put(() => ImageGallerySaverController())),
  PluginMenuVO("image_picker", "图片选择", BaseMenuView("图片选择", imagePickerMenuList)),
  PluginMenuVO("mobile_scanner", "二维码扫码【2】", const MobileScannerView(), binding: BindingsBuilder.put(() => MobileScannerGetxController())),
  PluginMenuVO("path_provider", "访问设备文件系统", const PathProviderView(), binding: BindingsBuilder.put(() => PathProviderController())),
  PluginMenuVO("permission_handler", "权限管理", const PermissionHandlerView(), binding: BindingsBuilder.put(() => PermissionController())),
  PluginMenuVO("photo_view", "图片预览", BaseMenuView("图片预览", photoViewMenuList)),
  PluginMenuVO("provider", "状态管理", BaseMenuView("状态管理", providerMenuList)),
  PluginMenuVO("pull_to_refresh", "下拉刷新及上拉加载【2】", const PullToRefreshApp()),
  PluginMenuVO("qr_code_scanner", "二维码扫码【1】", QRCodeScannerView(), binding: BindingsBuilder.put(() => QRCodeScannerController())),
  PluginMenuVO("qr_flutter", "二维码生成", const QrFlutterView()),
  PluginMenuVO("responsive_framework", "响应式框架", const ResponsiveFrameworkApp()),
  PluginMenuVO("screenshot", "截图", const ScreenshotView(), binding: BindingsBuilder.put(() => ScreenshotGetxController())),
  PluginMenuVO("shared_preferences", "轻量级本地存储", const SharedPreferencesView(), binding: BindingsBuilder.put(() => SharedPreferencesController())),
  PluginMenuVO("sqflite", "SQLLite数据库【1】", const SqfliteView(), binding: BindingsBuilder.put(() => SqfliteController())),
  PluginMenuVO("url_launcher", "Url跳转", const UrlLauncherView()),
  PluginMenuVO("video_player", "视频播放【1】", BaseMenuView("视频播放【1】", videoPlayerMenuList)),
  PluginMenuVO("webview_flutter", "Webview【1】", BaseMenuView("webview【1】", webviewFlutterMenuList)),
];
