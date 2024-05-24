import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

class EBCenterIndicator extends StatelessWidget {
  const EBCenterIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: EBCenterOSIndicator(),
      ),
    );
  }
}

class EBCenterOSIndicator extends StatelessWidget {
  const EBCenterOSIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: LFIndicator(),
      ),
    );
  }
}
