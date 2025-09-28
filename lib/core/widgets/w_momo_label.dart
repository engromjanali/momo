import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/core/util/constants/text_style.dart';
import 'package:momo/prsentation/screens/purchese_screen.dart';

class MomoLabel extends StatelessWidget {
  const MomoLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                        onTap: () {
                          Get.to(()=>PurcheseScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.cancel, color: Colors.white, size: 16),
                              Text(
                                "MOMO AI  ",
                                style: getTitleStyleS().copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
  }
}