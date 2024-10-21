import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post/presentation/home_screen/home_bloc.dart';

import '../../common/constants/bottom_loader.dart';
import '../../common/enums/homeStatus.dart';
import '../../core/routering/router_path.dart';
import '../../core/styles/appText.dart';
import 'home_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          switch (state.status) {
            case HomeStatus.searching:
              return const Center(child: CircularProgressIndicator());
            case HomeStatus.failure:
              return Center(child: AppText.textFailureHomePage);
            case HomeStatus.success:
              if (state.homeModel.isEmpty) {
                final filteredPosts = state.homeModel
                    .where((post) =>
                        post.title.contains(post.title) ||
                        post.body.contains(post.body))
                    .toList();
                if (filteredPosts.isEmpty) {
                  return Center(child: AppText.textsuccessHomePage);
                }
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  if (index >= state.homeModel.length) {
                    return const BottomLoader();
                  } else {
                    final post = state.homeModel[index];
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          Routers.detail,
                          extra: post, // Pass the HomeModel instance
                        );
                      },
                      child: HomeListItem(post: post),
                    );
                  }
                },
                itemCount: state.hasReachedMax
                    ? state.homeModel.length
                    : state.homeModel.length + 1,
                controller: _scrollController,
              );
            case HomeStatus.initial:
            default:
              return const Center(child: CircularProgressIndicator());
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<HomeBloc>().add(HomeFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
