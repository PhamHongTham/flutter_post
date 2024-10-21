import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post/core/styles/appColors.dart';
import 'package:post/core/styles/appStyle.dart';
import 'package:post/presentation/home_screen/home_bloc.dart';

import '../../core/styles/appText.dart';
import 'home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundAppBar,
        title: Center(child: AppText.textAppBarHomeDetail),
      ),
      body: Column(
        children: [
          Padding(
            padding: Appstyle.margin,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: AppText.hintTextSearch,
                border: const OutlineInputBorder(
                    borderRadius: Appstyle.borderRadiusSecond),
                suffixIcon: IconButton(
                  onPressed: () {
                    final query = searchController.text.trim();
                    if (query.isNotEmpty) {
                      // Phát sự kiện tìm kiếm
                      context.read<HomeBloc>().add(HomeSearch(query: query));
                      // Điều hướng đến trang tìm kiếm với query
                    } else {
                      context.read<HomeBloc>().add(HomeFetched());
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          const Expanded(
            child: HomePage(),
          ),
        ],
      ),
    );
  }
}
