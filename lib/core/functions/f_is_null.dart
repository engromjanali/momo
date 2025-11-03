import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// ❓🧹 isNull
/// Checks if a given `value` is considered "null-like".
/// ⚠️ Useful when API responses or user inputs return various falsy values.

List _nulls = [null, '', 'null', 0, {}, [], File(''), XFile(''), '[]'];

bool isNull(dynamic value) {
  return _nulls.contains(value);
}
