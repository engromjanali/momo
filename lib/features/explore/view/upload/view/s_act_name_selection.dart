import 'package:flutter/material.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_app_bar.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/features/explore/view/upload/view/s_save.dart';

class SActNameSelection extends StatefulWidget {
  const SActNameSelection({super.key});

  @override
  State<SActNameSelection> createState() => _ModelNameScreenState();
}

class _ModelNameScreenState extends State<SActNameSelection> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: (nameController.text.isNotEmpty)
          ? WBottomNavButton(
              label: "Continue",
              ontap: () {
                SSave().push();
              },
            ).pAll()
          : null,
      backgroundColor: Colors.black,
      appBar: WAppBar(),
      body: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name Your AI Model", style: context.textTheme?.titleMedium),
          Text(
            "This information will improve your selection of medl images for the generation of your photos.",
            style: context.textTheme?.bodyMedium,
            textAlign: TextAlign.justify,
          ).pB(),
          Container(
            decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.circular(PTheme.boarderRadius),
            ),
            child: TextField(
              controller: nameController,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text("Model Name", style: context.textTheme?.titleSmall),
                hint: Text(
                  "Type Your Model Name",
                  style: context.textTheme?.bodyMedium,
                ),
                suffixIcon: nameController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          nameController.clear();
                        },
                        icon: Icon(Icons.cancel),
                        color: context.primaryTextColor,
                      )
                    : null,
              ),
              style: context.textTheme?.titleSmall,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
