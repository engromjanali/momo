import 'package:flutter/material.dart';
import 'package:momo/core/util/constants/colors.dart';



// Title Style  ----------------

TextStyle getTitleStyleS() {
  return const TextStyle(
    fontSize: 18,
    color: MyColor.white,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis
  );
}

TextStyle getTitleStyleM() {
  return const TextStyle(
    fontSize: 24,
    color: MyColor.white,
    fontWeight: FontWeight.w600,
  );
}

TextStyle getTitleStyleL() {
  return const TextStyle(
    fontSize: 28,
    color: MyColor.white,
    fontWeight: FontWeight.w600,
  );
}

TextStyle getTitleStyleXL() {
  return const TextStyle(
    fontSize: 30,
    color: MyColor.white,
    fontWeight: FontWeight.w600,
  );
}


// sub title---
TextStyle getSubtitleStyleS() {
  return const TextStyle(
    fontSize: 12,
    color: MyColor.grey,
    fontWeight: FontWeight.w600,
  );
}

TextStyle getSubtitleStyleM() {
  return const TextStyle(
    fontSize: 14,
    color: MyColor.grey,
    fontWeight: FontWeight.w600,
  );
}

TextStyle getSubtitleStyleL() {
  return const TextStyle(
    fontSize: 16,
    color: MyColor.grey,
    fontWeight: FontWeight.w600,
  );
}

