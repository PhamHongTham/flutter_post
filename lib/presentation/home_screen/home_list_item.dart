import 'package:flutter/material.dart';
import 'package:post/data/model/home_model/home_model.dart';

import '../../core/styles/appColors.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({required this.post, super.key});

  final HomeModel post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: AppColor.backgroundColor,
      child: ListTile(
        leading: Text('${post.id}', style: textTheme.bodySmall),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}
