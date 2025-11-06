import 'package:flutter/material.dart';
import 'package:momo/core/controllers/c_base.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';


class COneShot extends CBase {
  List<MOneshot>? _oneShotList;
  List<MOneshot>? get oneShotList => _oneShotList;
}
