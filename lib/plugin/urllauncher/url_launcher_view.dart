import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherView extends StatelessWidget {
  const UrlLauncherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('UrlLauncher测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _getText("https://docs.flutter.dev/get-started/install", color: gColorLightPrimary),
            _getButton(
              Icons.navigate_next,
              () => _launchURL(
                Uri(scheme: "https", host: "docs.flutter.dev", path: "/get-started/install"),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _getText("https://docs.flutter.dev/development/ui/layout#constraints", color: gColorLightPrimary),
            _getButton(
              Icons.navigate_next,
              () => _launchURL(
                Uri(scheme: "https", host: "docs.flutter.dev", path: "/development/ui/layout", fragment: "constraints"),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _getText("https://www.dartpad.cn/?id=e66e420f2f0201c772f73819711bf290", color: gColorLightPrimary),
            _getButton(
              Icons.navigate_next,
              () => _launchURL(
                Uri(scheme: "https", host: "www.dartpad.cn", path: "/", query: "id=e66e420f2f0201c772f73819711bf290"),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _getText("mailto:123456789@qq.com?subject=test&body=thisisatest", color: gColorRed),
            _getButton(
              Icons.navigate_next,
              () => _launchURL(
                Uri(scheme: "mailto", path: "123456789@qq.com", queryParameters: {'subject': 'Test', 'body': 'thisisatest'}),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _getText("https://www.dartpad.cn/?id=e66e420f2f0201c772f73819711bf290", color: gColorLightPrimary),
            _getButton(
              Icons.navigate_next,
              () => _launchURL(
                Uri.https("www.dartpad.cn", "/", {"id": "e66e420f2f0201c772f73819711bf290"}),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _getText("https://www.dartpad.cn/?id=e66e420f2f0201c772f73819711bf290", color: gColorLightPrimary),
            _getButton(
              Icons.navigate_next,
              () => _launchURL(Uri.parse('https://www.dartpad.cn/?id=e66e420f2f0201c772f73819711bf290')),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getText(String text, {Color? color}) {
    return SizedBox(
      width: 0.9.sw,
      child: Text(
        text,
        style: size14W400(color: color),
      ),
    );
  }

  Widget _getButton(IconData icon, Function() onPressed) {
    return SizedBox(
      width: 0.1.sw,
      child: gIconButton(icon, onPressed),
    );
  }

  void _launchURL(Uri uri, {LaunchMode? mode}) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: mode ?? LaunchMode.platformDefault);
    } else {
      throw 'launch $uri failed';
    }
  }
}
