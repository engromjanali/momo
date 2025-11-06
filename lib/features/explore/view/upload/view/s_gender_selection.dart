import 'package:flutter/material.dart';
import 'package:momo/core/constants/all_enums.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/widgets/w_app_bar.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';

class SGenderSelection extends StatefulWidget {
  const SGenderSelection({super.key});

  @override
  State<SGenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<SGenderSelection> {
  ValueNotifier selectedGender = ValueNotifier<Gender>(Gender.female);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: WBottomNavButton(
        label: "Continue",
        ontap: () {
          // Get.to(()=>ModelNameScreen());
        },
      ).pAll(),
      backgroundColor: Colors.black,
      appBar: WAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pick Your Gender", style: context.textTheme?.titleMedium),
          Text(
            "This Information Will improve your selection of model images for the genartion of your photos",
            style: context.textTheme?.bodyMedium,
          ),

          Spacer(),
          ValueListenableBuilder(
            valueListenable: selectedGender,
            builder: (context, value, _) {
              print(value);
              return Column(
                spacing: 10,
                children: [
                  getGenderButton(
                    onTap: () {
                      selectedGender.value = Gender.female;
                    },
                    label: "Female",
                    isSelected: selectedGender.value == Gender.female,
                  ),
                  getGenderButton(
                    onTap: () {
                      selectedGender.value = Gender.male;
                    },
                    label: "Male",
                    isSelected: selectedGender.value == Gender.male,
                  ),
                  getGenderButton(
                    onTap: () {
                      selectedGender.value = Gender.other;
                    },
                    label: "Other",
                    isSelected: selectedGender.value == Gender.other,
                  ),
                ],
              );
            },
          ),
          Spacer(),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget getGenderButton({
    required Function() onTap,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.cardColor,
          border: BoxBorder.all(
            color: isSelected
                ? context.primaryTextColor ?? Colors.white
                : context.secondaryTextColor ?? Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: context.textTheme?.titleMedium?.copyWith(
              color: !isSelected ? context.secondaryTextColor : null,
            ),
          ),
        ),
      ),
    );
  }
}
