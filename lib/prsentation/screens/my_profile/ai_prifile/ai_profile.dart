import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:momo/core/util/constants/text_style.dart';

Widget getAiProfile({required Function() onTap}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                border: Border.all(color: Colors.grey.withAlpha(100), width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.person, size: 50, color: Colors.grey),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(150),
                  // border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.add, size: 20, color: Colors.black),
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: AutoSizeText(
            "Upload your photos to start using the app",
            style: getTitleStyleL(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Text(
            "You need to take this step only once",
            style: getSubtitleStyleL(),
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
            child: Row(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Photos",
                  style: getTitleStyleS().copyWith(color: Colors.black),
                ),
                Icon(Icons.add_circle, color: Colors.black),
              ],
            ),
          ),
        ),
        Spacer(),
        SizedBox(height: 100,),
       
      ],
    ),
  );
}
