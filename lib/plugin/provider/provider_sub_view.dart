import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'entity/student_info.dart';

class ProviderSubView extends StatelessWidget {
  const ProviderSubView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.1.sh,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      alignment: Alignment.center,
      child: Text(context.read<StudentInfo>().name),
    );
  }
}
