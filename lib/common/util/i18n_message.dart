import 'package:get/get.dart';

/// 多语言配置</p>
/// GetMaterialApp中的locale和fallbackLocale指定Locale
class I18nMessage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'bottomBarBase': '基础',
          'bottomBarIssue': '问题',
          'bottomBarPlugin': '插件',
          'appBarTitleBase': '基础知识',
          'appBarTitleIssue': '问题修复',
          'appBarTitlePlugin': '扩展插件',
        },
        'en_US': {
          'bottomBarBase': 'Base',
          'bottomBarIssue': 'Issue',
          'bottomBarPlugin': 'Plugin',
          'appBarTitleBase': 'Base',
          'appBarTitleIssue': 'Issue',
          'appBarTitlePlugin': 'Plugin',
        },
      };
}
