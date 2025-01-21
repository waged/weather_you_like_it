import 'package:flutter/material.dart';

/// Reusable Bottom Navigation Widget
class CustomBottomNavigation extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  const CustomBottomNavigation({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
