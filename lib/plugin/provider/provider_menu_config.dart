import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/provider/entity/order_record_overview.dart';
import 'package:flutter_demo2/plugin/provider/provider_order_overview_view.dart';
import 'package:flutter_demo2/plugin/provider/provider_view.dart';
import 'package:provider/provider.dart';

List<BaseMenuVO> providerMenuList = [
  BaseMenuVO("Provider", const ProviderView()),
  BaseMenuVO(
    "Provider.Order",
    ListenableProvider<OrderRecordOverview>(
      create: (_) => OrderRecordOverview(),
      child: const ProviderOrderOverviewView(),
    ),
  ),
];
