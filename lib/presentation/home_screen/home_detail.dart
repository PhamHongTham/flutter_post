import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:post/core/styles/appColors.dart';
import 'package:post/core/styles/appStyle.dart';
import 'package:post/data/model/home_model/home_model.dart';

import '../favorite_screen/favorite_bloc.dart';

class HomeDetail extends StatelessWidget {
  final HomeModel post;

  const HomeDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundAppBar,
        title: Text('Post Detail: ${post.id}'),
        actions: [
          BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
            if (state is FavoriteInitial) {
              final isFavorite = state.favorites.contains(post);
              return IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? AppColor.pink : AppColor.grey,
                ),
                onPressed: () {
                  if (isFavorite) {
                    context.read<FavoriteBloc>().add(RemoveFavorite(post));
                  } else {
                    context.read<FavoriteBloc>().add(AddFavorite(post));
                  }
                },
              );
            }
            return IconButton(
              icon: const Icon(
                Icons.favorite,
                color: AppColor.grey,
              ),
              onPressed: () {},
            );
          }),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: Appstyle.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                post.imageUrl,
                fit: BoxFit.contain,
                height: 300,
                width: 300,
              ),
            ),
            Appstyle.sizeBoxheight,
            Text(post.title, style: Appstyle.styleTextSecond),
            Appstyle.sizeBoxheight,
            Text(
              post.body,
              style: Appstyle.styleTextThird,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
