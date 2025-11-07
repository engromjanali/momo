import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/explore/widget/w_glass.dart';

class WISDialog extends StatelessWidget {
  const WISDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: WGlass(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigation.pop();
                    },
                    icon: Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
              Text("Take photo from", style: context.textTheme?.titleSmall),
              gapY(40),
          
              WCElevatedButton(
                ontap: () {
                  Navigation.pop(data: ImageSource.gallery);
                },
                label: "Photo Library",
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                margin: EdgeInsets.all(10),
              ),
              WCElevatedButton(
                ontap: () {
                  Navigation.pop(data: ImageSource.camera);
                },
                label: "Camera",
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                margin: EdgeInsets.only(
                  bottom: 30,
                  top: 10,
                  left: 10,
                  right: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WCElevatedButton extends StatelessWidget {
  final Function() ontap;
  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final EdgeInsets margin;
  const WCElevatedButton({
    super.key,
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.white,
    required this.ontap,
    required this.label,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          minimumSize: Size(double.maxFinite, 30),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: ontap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
