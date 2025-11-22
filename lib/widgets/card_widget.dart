import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  const CardWidget({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardElevation = elevation ?? 2.0;
    final cardBorderRadius = borderRadius ?? BorderRadius.circular(16.0);
    
    // Use Container with BoxDecoration for custom shadows when elevation is 0
    if (cardElevation == 0) {
      return Container(
        margin: margin ?? const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: cardBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: cardBorderRadius,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(16.0),
              child: child,
            ),
          ),
        ),
      );
    }
    
    // Use Card for elevation-based shadows
    return Card(
      margin: margin ?? const EdgeInsets.all(16.0),
      elevation: cardElevation,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: cardBorderRadius,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: cardBorderRadius,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}

