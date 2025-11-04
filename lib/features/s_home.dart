import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:momo/core/widgets/nav/models/bottom_items.dart';
import 'package:momo/core/widgets/nav/widgets/nav_bar_widget.dart';

class SHome extends StatefulWidget {
  const SHome({super.key});

  @override
  State<SHome> createState() => _SHomeState();
}

class _SHomeState extends State<SHome> {
  final ValueNotifier currentIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    // TODO: implement dispose
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return WNavigationBar(
            items: homeNevItem,
            currentIndex: value,
            onChanged: (index) {
              currentIndex.value = index;
              setState(() {});
            },
          );
        },
      ),
      body: homeNevItem[currentIndex.value].child,
    );
  }
}
