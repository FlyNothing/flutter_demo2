import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/webview/common/flutter_inappwebview_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterInappwebview extends GetView<FlutterInappwebController> {
  const FlutterInappwebview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "Inappwebview1"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(controller.url)),
          initialSettings: InAppWebViewSettings(),
          pullToRefreshController: controller.pullToRefreshController,
          onLoadStart: (crtl, url) => debugPrint("InAppWebView onLoadStart. url = $url"),
          onLoadStop: (crtl, url) {
            controller.pullToRefreshController?.endRefreshing();
            debugPrint("InAppWebView onLoadStop. url = $url");
          },
          onReceivedError: (crtl, request, error) {
            controller.pullToRefreshController?.endRefreshing();
            debugPrint("InAppWebView onReceivedError. url = ${request.url}");
          },
          onProgressChanged: (crtl, progress) {
            if (progress == 100) {
              controller.pullToRefreshController?.endRefreshing();
            }
            debugPrint("InAppWebView onProgressChanged. progress = $progress");
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            WebUri? uri = navigationAction.request.url;
            if (uri == null) {
              return NavigationActionPolicy.CANCEL;
            }
            if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
              if (await canLaunchUrl(uri)) {
                await launchUrl(
                  uri,
                );
              }
            }
            return NavigationActionPolicy.CANCEL;
          }),
    );
  }
}
