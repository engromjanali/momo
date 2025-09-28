import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String path;
  final double size;
  final Color color;
  const CustomIcon({
    super.key,
    required this.path,
    this.size = 20,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    bool isSvg = path.contains(".svg");
    return isSvg
        ? ClipOval(
          child: SvgPicture.asset(
              path,
              height: size,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
        )
        : Image.asset(path, height: size, color: color);
  }
}
