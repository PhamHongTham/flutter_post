// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'appColors.dart';

class Appstyle {
  static const padding = EdgeInsets.symmetric(horizontal: 24, vertical: 24);
  static final styleTextFirst = GoogleFonts.acme(
    color: AppColor.textColorFirts,
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );
  static final styleTextSecond = GoogleFonts.acme(
    color: AppColor.textColorSecond,
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );
  static final styleTextThird = GoogleFonts.acme(
    color: AppColor.textColorSecond,
    fontSize: 23,
  );
  static const paddingSecond =
      EdgeInsets.symmetric(vertical: 10, horizontal: 10);

  static const paddingThird =
      EdgeInsets.symmetric(vertical: 12, horizontal: 20);
  static const fontSize = 16;
  static const style = TextStyle(
    color: AppColor.black87,
    fontSize: 16.0,
  );
  static const contentPadding =
      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0);
  static const labelStyle = TextStyle(
    color: AppColor.colorIcons,
    fontWeight: FontWeight.bold,
  );
  static final hintStyle = TextStyle(
    color: AppColor.grey2, // Màu sắc của văn bản gợi ý
  );
  static const borderSide = BorderSide(
    color: AppColor.colorIcons, // Màu sắc của đường viền khi không chọn
    width: 1.5, // Độ dày của đường viền
  );
  static const borderSide20 = BorderSide(
    color: AppColor.primaryColor, // Màu sắc của đường viền khi chọn
    width: 2.0,
  );
  // ignore: non_constant_identifier_names
  static const borderSize20_red = BorderSide(
    color: AppColor.textColorFirts, // Màu sắc của đường viền khi có lỗi
    width: 2.0,
  );
  static const margin = EdgeInsets.all(8);
  static const effect = ExpandingDotsEffect(
    activeDotColor: AppColor.activeDotColor,
    dotColor: AppColor.dotColor,
    dotHeight: 8,
    dotWidth: 8,
    expansionFactor: 4,
    spacing: 5,
  );
  static final borderRadius = BorderRadius.circular(10.0);
  static const borderRadiusSecond = BorderRadius.all(Radius.circular(20));
  static const paddingListView = EdgeInsets.symmetric(vertical: 10);
  static final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  );
  static final boxShadow = BoxShadow(
    offset: const Offset(0, 4),
    blurRadius: 13.0,
    color: AppColor.colors,
    spreadRadius: 0.0,
  );
  static const sizeBoxBottomLoader = SizedBox(
    height: 24,
    width: 24,
    child: CircularProgressIndicator(strokeWidth: 1.5),
  );
  static const padding3 = EdgeInsets.all(16.0);
  static const sizeBoxheight = SizedBox(height: 16);
  static const sizeBoxheight100 = SizedBox(height: 100);
  static const sizeBoxheight28 = SizedBox(height: 28);
  static const sizeBoxheight20 = SizedBox(height: 20);
}
