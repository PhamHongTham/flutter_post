import 'package:flutter/material.dart';
import 'package:post/core/styles/appStyle.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Appstyle.sizeBoxBottomLoader,
    );
  }
}
