import 'package:flutter/material.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/load_and_error/widgets/loading_widget.dart';

/// ⏳ showLoader() — Shows modal loading spinner (WOnScreenLoading)
/// 🧱 Blocks UI while async operation runs
/// ❌ hideOverlay() — Hides topmost dialog/loader
void showLoader({bool canPop = true}) {
  showDialog(
    barrierDismissible: false,
    context: NavigationService.currentContext,
    builder: (_) {
      return PopScope(
        canPop: canPop,
        child: const AlertDialog.adaptive(
          content: Wrap(children: [WOnScreenLoading()]),
        ),
      );
    },
  );
}

void hideOverlay() {
  Navigation.pop();
}
