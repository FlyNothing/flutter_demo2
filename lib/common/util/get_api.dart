import 'package:flutter_demo2/common/vo/base_resp_vo.dart';
import 'package:get/get.dart';

class GetApi extends GetConnect {
  final _host = "https://xxx.yyy.com";

  Future<BaseRespVo> postBody(String body) async {
    var api = '$_host/login';
    Response resp = await post(api, body, contentType: "application/json");
    BaseRespVo respVO = BaseRespVo.fromJson(resp.body);
    return respVO;
  }

  Future<String> getRaw(String url) async {
    Response<String> resp = await get(url);
    return resp.body ?? "data is empty";
  }

  /// WebSocket
  GetSocket getSocket() {
    return socket('$_host/socket');
  }
}
