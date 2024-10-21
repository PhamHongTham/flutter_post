import 'package:flutter/material.dart';
import 'package:post/core/styles/appColors.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background1,
      body: body,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ), // Độ bo cong
        child: NavigationBar(
          backgroundColor: AppColor.backgroundColorNavigator,
          indicatorColor: AppColor
              .indicatorColorNavigator, // Màu của chỉ báo khi mục được chọn
          selectedIndex: selectedIndex,
          destinations: const [
            NavigationDestination(
              label: 'Post',
              icon: Icon(Icons.home),
            ),
            NavigationDestination(
              label: 'Contact',
              icon: Icon(Icons.contact_phone_outlined),
            ),
            NavigationDestination(
              label: 'Favorite',
              icon: Icon(Icons.favorite),
            ),
          ],
          onDestinationSelected: onDestinationSelected,
        ),
      ),
    );
  }
}
