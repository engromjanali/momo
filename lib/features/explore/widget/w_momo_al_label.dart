import 'package:flutter/material.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_purchese.dart';

class WAiLabel extends StatelessWidget {
  const WAiLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WPurchese().push();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.cancel, color: Colors.white, size: 16),
            Text("MOMO AI  ", style: context.textTheme?.titleSmall),
          ],
        ),
      ),
    );
  }
}
