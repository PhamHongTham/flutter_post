import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:post/core/styles/appColors.dart';
import 'package:post/core/styles/appStyle.dart';
import 'package:post/core/styles/appText.dart';
import 'favorite_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundAppBar,
        title: Center(
          child: AppText.textAppBarFavorite,
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
        if (state is FavoriteInitial) {
          final favorites = state.favorites;
          if (favorites.isEmpty) {
            return const Center(
              child: AppText.text,
            );
          }
          return ListView.builder(
            padding: Appstyle.paddingListView,
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final post = favorites[index];
              return SizedBox(
                height: 100,
                child: Card(
                  color: AppColor.colorCard,
                  elevation: 5,
                  margin: Appstyle.margin,
                  child: Center(
                    child: ListTile(
                      autofocus: true,
                      leading: SvgPicture.asset(
                        post.imageUrl,
                        fit: BoxFit.contain,
                        height: 50,
                        width: 50,
                      ),
                      title: Text(post.title),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<FavoriteBloc>()
                              .add(RemoveFavorite(post));
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Container();
      }),
    );
  }
}
