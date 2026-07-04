import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Lays [left] and [right] out side-by-side with [Expanded] on wide
/// screens, or stacked full-width on mobile.
///
/// IMPORTANT: this deliberately does NOT use a single `Flex` whose
/// `direction` toggles between horizontal/vertical while keeping
/// `Expanded` children — inside a vertical scroll view that produces
/// unbounded height constraints and crashes. Instead it switches
/// between an actual `Row` (bounded height, Expanded is safe) and an
/// actual `Column` (unbounded height, so children are sized naturally
/// instead of expanded).
class ResponsiveTwoColumn extends StatelessWidget {
  final Widget left;
  final Widget right;
  final int leftFlex;
  final int rightFlex;
  final double gap;

  const ResponsiveTwoColumn({
    super.key,
    required this.left,
    required this.right,
    this.leftFlex = 3,
    this.rightFlex = 2,
    this.gap = 40,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          left,
          SizedBox(height: gap),
          right,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: leftFlex, child: left),
        SizedBox(width: gap),
        Expanded(flex: rightFlex, child: right),
      ],
    );
  }
}
