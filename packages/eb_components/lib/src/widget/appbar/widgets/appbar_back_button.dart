import 'package:flutter/material.dart';

class EBAppBarBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const EBAppBarBackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Stack(
        children: [
          Center(
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ],
      ),
    );
  }
}
