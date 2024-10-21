import 'package:flutter/material.dart';

import '../../core/styles/appColors.dart';

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationRail(
            backgroundColor: AppColor
                .backgroundColorNavigator, // Màu nền của thanh điều hướng
            indicatorColor: AppColor
                .indicatorColorNavigator, // Màu của chỉ báo khi mục được chọn
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                label: Text('Post'),
                icon: Icon(Icons.home),
              ),
              NavigationRailDestination(
                label: Text('Contact'),
                icon: Icon(Icons.contact_phone_outlined),
              ),
              NavigationRailDestination(
                label: Text('Favorite'),
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
