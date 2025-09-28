import 'package:flutter/material.dart';
import 'package:momo/core/controller/c_home.dart';
import 'package:momo/core/util/constants/text_style.dart';
import 'package:momo/core/widgets/glass_widget.dart';
import 'package:momo/main.dart';
import 'package:provider/provider.dart';

Widget getOneShot({required Function() onTap}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Spacer(),
        Icon(Icons.image, color: Colors.grey, size: 50),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Text(
            "You haven't created a \'One Shot\' yet",
            style: getTitleStyleL(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Discover",
              style: getTitleStyleS().copyWith(color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 150),
      ],
    ),
  );
}
