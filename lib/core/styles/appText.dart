// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'appStyle.dart';

class AppText {
  static const text = Text('Chưa có yêu thích nào!');
  static var textAppBarFavorite =
      Text('Favorites', style: Appstyle.styleTextSecond);
  static var textAppBarContact =
      Text('Favorites', style: Appstyle.styleTextSecond);
  static var textFailureHomePage = const Text('failed to fetch posts');
  static var textsuccessHomePage = const Text('No results found.');
  static var textAppBarHomeDetail =
      Text('Pots', style: Appstyle.styleTextSecond);
  static var hintTextSearch = 'Search posts...';
  static var textOnboardingScreen = 'Netx';
  static var textTitleShowDialogEdit = 'Edit Contact';
  static var textTitleShowDialogAdd = 'Add Contact';
  static var textLabelTextShowDialog = 'FullName';
}
