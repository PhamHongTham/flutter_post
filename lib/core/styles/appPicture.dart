import 'package:flutter_svg/svg.dart';
import 'package:post/gen/assets.gen.dart';
import 'package:post/presentation/onboarding_screen/onboarding_bloc.dart';

import '../../data/model/onboarding_model/onboarding_model.dart';

class Apppicture {
  static final sgvSplash = SvgPicture.asset(Assets.logo.cdnlogoComPost);
  static final svgOnboarding = SvgPicture.asset(
    onboardingData[OnboardingInitial().pageIndex].image!,
    //height: 200, // Thay đổi kích thước tùy ý
  );
}
