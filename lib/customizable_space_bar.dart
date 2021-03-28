library customizable_space_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizableSpaceBar extends StatelessWidget {
  const CustomizableSpaceBar({Key? key, required this.builder})
      : super(key: key);
  final Widget Function(BuildContext context, double scrollingRate) builder;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final FlexibleSpaceBarSettings settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;

        final double deltaExtent = settings.maxExtent - settings.minExtent;

        // 0.0 -> Expanded
        // 1.0 -> Collapsed to toolbar
        final double scrollingRate =
            (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
                .clamp(0.0, 1.0);
        return builder(context, scrollingRate);
      },
    );
  }
}
