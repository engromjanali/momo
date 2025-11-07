import 'package:flutter/material.dart';
import 'package:momo/core/constants/all_enums.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_app_bar.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/features/explore/view/upload/view/s_act_name_selection.dart';

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
          SActNameSelection().push();
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
                  WGenderSelectionButton(
                    onTap: () {
                      selectedGender.value = Gender.female;
                    },
                    label: "Female",
                    isSelected: selectedGender.value == Gender.female,
                  ),
                  WGenderSelectionButton(
                    onTap: () {
                      selectedGender.value = Gender.male;
                    },
                    label: "Male",
                    isSelected: selectedGender.value == Gender.male,
                  ),
                  WGenderSelectionButton(
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
}

class WGenderSelectionButton extends StatelessWidget {
  final Function() onTap;
  final String label;
  final bool isSelected;
  const WGenderSelectionButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
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
