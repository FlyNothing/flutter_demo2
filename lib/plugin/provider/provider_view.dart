import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/global_widget.dart';
import 'package:flutter_demo2/plugin/provider/provider_sub_view.dart';
import 'package:provider/provider.dart';

import 'entity/student_info.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Provider'),
      body: Provider<StudentInfo>(
        create: (_) => StudentInfo("Andy"),
        child: const ProviderSubPage(),
      ),
    );
  }
}