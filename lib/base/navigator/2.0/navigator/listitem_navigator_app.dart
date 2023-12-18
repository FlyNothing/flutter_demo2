import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/navigator/2.0/navigator/item_view.dart';
import 'package:flutter_demo2/base/navigator/2.0/navigator/listview_view.dart';

class ListitemNavigatorApp extends StatefulWidget {
  const ListitemNavigatorApp({super.key});
  @override
  State<StatefulWidget> createState() => _ListitemNavigatorAppState();
}

class _ListitemNavigatorAppState extends State<ListitemNavigatorApp> {
  String _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 去掉右上角debug贴纸
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Navigator(
        pages: [
          MaterialPage(key: const ValueKey(ListViewView.valueKey), name: ListViewView.valueKey, child: ListViewView(_itemTapped)),
          if (_selectedItem.isNotEmpty) MaterialPage(key: ValueKey(ItemView.valueKey + _selectedItem), child: ItemView(_selectedItem))
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          return true;
        },
      ),
    );
  }

  void _itemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }
}
