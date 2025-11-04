import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/controllers/c_check_point.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/gen/assets.gen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final CCheckPoint checkPoint = CCheckPoint();
    checkPoint.initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                Assets.images.logo.path,
                height: 300.w,
                width: 300.w,
              ),
            ),
          ),
          Text("Loading...").pB(value: 50),
        ],
      ),
    );
  }
}
